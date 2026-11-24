# Instrucciones para el desarrollo

## Proyecto
Aplicación académica de música interactiva para establecimientos comerciales. **No existe relación con Kasted. No consultar ni modificar otros repositorios, bases de datos o despliegues.**

## Idioma
Interfaz, documentación, mensajes de error, comentarios útiles y mensajes de commits en español. Nombres de variables y rutas técnicas pueden seguir convenciones estándar.

## Alcance del MVP
- Panel del administrador del establecimiento.
- Catálogo limitado de pistas con permisos documentados.
- Reproductor web funcional.
- Código QR por establecimiento que abra la vista móvil de invitados.
- Solicitudes de canciones y votos actualizados entre dispositivos.
- Cola musical y reglas básicas del establecimiento.
- Métricas calculadas a partir de eventos reales.

## Restricciones
- No afirmar que el prototipo habilita legalmente música comercial de terceros.
- Solo incorporar audio con fuente, autor, licencia y usos permitidos verificados; no subir música sin autorización.
- No inventar encuestas, pruebas de usuario, resultados ni métricas.
- Mantener aisladas las credenciales del proyecto; nunca subir secretos, .env.local ni service_role a Git.
- Aplicar RLS, validar entrada de usuarios, limitar votos por sesión y proteger funciones administrativas.
- Evitar pagos, integraciones con Spotify o funciones fuera del MVP.
- Si Supabase no está configurado, mostrar un estado de configuración claro y no simular persistencia como real.
- Registrar cada cambio con un mensaje de commit descriptivo. No falsificar datos de autoría ni añadir coautores automáticos incorrectos.

## Verificación
Antes de publicar, ejecutar instalación limpia, lint, comprobación de tipos, build y prueba manual desde dos dispositivos. Documentar pruebas y limitaciones reales.
