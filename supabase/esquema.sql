-- Ejecutar únicamente en el proyecto académico nuevo.
create table public.establecimientos (
 id uuid primary key default gen_random_uuid(),
 propietario uuid not null default auth.uid() references auth.users(id),
 nombre text not null check (char_length(nombre) between 1 and 80)
);
create table public.solicitudes (
 id uuid primary key default gen_random_uuid(),
 establecimiento uuid not null references public.establecimientos(id) on delete cascade,
 pista integer not null check (pista between 0 and 5),
 estado text not null default 'pendiente' check (estado in ('pendiente','aprobada','rechazada','reproducida')),
 creada timestamptz not null default now(),
 unique(establecimiento,pista)
);
create table public.votos (
 solicitud uuid not null references public.solicitudes(id) on delete cascade,
 visitante uuid not null default auth.uid() references auth.users(id),
 primary key(solicitud,visitante)
);
alter table public.establecimientos enable row level security;
alter table public.solicitudes enable row level security;
alter table public.votos enable row level security;
grant select on public.establecimientos,public.solicitudes,public.votos to anon,authenticated;
grant insert(nombre) on public.establecimientos to authenticated;
grant insert(establecimiento,pista) on public.solicitudes to authenticated;
grant update(estado) on public.solicitudes to authenticated;
grant insert(solicitud) on public.votos to authenticated;
create policy "Lectura de establecimientos" on public.establecimientos for select using(true);
create policy "Crear establecimiento" on public.establecimientos for insert to authenticated with check(propietario=auth.uid() and coalesce((auth.jwt()->>'is_anonymous')::boolean,false)=false);
create policy "Lectura de solicitudes" on public.solicitudes for select using(true);
create policy "Solicitar pista" on public.solicitudes for insert to authenticated with check(estado='pendiente');
create policy "Administrar solicitudes" on public.solicitudes for update to authenticated using(exists(select 1 from public.establecimientos e where e.id=establecimiento and e.propietario=auth.uid())) with check(exists(select 1 from public.establecimientos e where e.id=establecimiento and e.propietario=auth.uid()));
create policy "Lectura de votos" on public.votos for select using(true);
create policy "Voto individual" on public.votos for insert to authenticated with check(visitante=auth.uid() and exists(select 1 from public.solicitudes s where s.id=solicitud and s.estado in ('pendiente','aprobada')));

create index establecimientos_propietario_idx on public.establecimientos(propietario);
create index votos_visitante_idx on public.votos(visitante);
revoke all on public.establecimientos,public.solicitudes,public.votos from anon,authenticated;
grant select on public.establecimientos,public.solicitudes,public.votos to authenticated;
grant insert(nombre) on public.establecimientos to authenticated;
grant insert(establecimiento,pista) on public.solicitudes to authenticated;
grant update(estado) on public.solicitudes to authenticated;
grant insert(solicitud) on public.votos to authenticated;
revoke execute on function public.rls_auto_enable() from public, anon, authenticated;
