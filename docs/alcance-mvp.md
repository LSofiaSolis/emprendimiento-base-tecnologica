# Alcance del prototipo mínimo viable

## Propósito
Validar una plataforma en español para que administradores de establecimientos controlen una selección musical y visitantes participen mediante un código QR.

## Roles y recorrido
1. El administrador accede al panel y configura el establecimiento.
2. El administrador consulta un catálogo autorizado para la demostración.
3. El sistema genera un código QR o un enlace público del establecimiento.
4. Una persona visitante abre el enlace en su teléfono, sin registrarse, y propone canciones.
5. La persona visitante vota por canciones de la cola. Debe limitarse el voto repetido por sesión.
6. El administrador aprueba o rechaza solicitudes, ordena la cola y reproduce las pistas.
7. Los cambios se reflejan en la otra interfaz y las métricas provienen de eventos almacenados.

## Aceptación funcional
- Un QR lleva a la vista correcta del establecimiento.
- Las solicitudes creadas en el móvil son visibles en el panel.
- La aprobación/rechazo cambia el estado de la solicitud en ambos dispositivos.
- Cada sesión puede emitir como máximo un voto por solicitud.
- Un usuario anónimo no puede administrar otros establecimientos.
- La reproducción utiliza exclusivamente archivos de audio verificados y disponibles.
- El proyecto se despliega en Vercel con su propia instancia de Supabase.

## Fuera del alcance
Cobros reales, licenciamiento automático, repertorios comerciales de Spotify, recomendaciones mediante IA, contratos con titulares de derechos y una implementación multiempresa a escala comercial.

## Validación académica
Recoger participantes reales, tareas realizadas, fecha, observaciones, dificultades y mejoras propuestas. El piloto de varias semanas descrito en el documento del grupo es una **propuesta futura** hasta que exista evidencia real de su ejecución.

## Trabajo por completar
- Crear un proyecto nuevo en Supabase dentro de la organización indicada por la estudiante, sin intervenir proyectos existentes.
- Implementar migraciones con seguridad RLS y control de roles.
- Localizar y documentar pistas con autorizaciones verificadas.
- Desarrollar interfaces, pruebas y desplegar en Vercel.
- Incorporar capturas reales y resultados de validación al capítulo 7 y al pitch deck.
