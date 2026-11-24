alter table public.sonora_locales add column modo_aprobacion text not null default 'espera' check(modo_aprobacion in ('manual','espera','automatica'));
alter table public.sonora_sesiones add column visitante_id uuid not null default gen_random_uuid() unique, add column nombre text, add column dispositivo_hash text, add column ultima_actividad timestamptz not null default now();
alter table public.sonora_cola add column solicitado_por uuid references public.sonora_sesiones(visitante_id) on delete set null, add column nombre_visitante text, add column aprobacion text check(aprobacion in ('manual','automatica'));
create table public.sonora_bloqueos (local_id uuid not null references public.sonora_locales(id) on delete cascade, dispositivo_hash text not null, nombre text not null, creado timestamptz not null default now(),primary key(local_id,dispositivo_hash));
alter table public.sonora_bloqueos enable row level security;
revoke all on public.sonora_bloqueos from public,anon,authenticated;
grant select,insert,update,delete on public.sonora_bloqueos to service_role;
create index sonora_sesiones_dispositivo_idx on public.sonora_sesiones(local_id,dispositivo_hash);
create index sonora_cola_solicitante_idx on public.sonora_cola(solicitado_por);
