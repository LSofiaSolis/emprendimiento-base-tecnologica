# Sonora — música en común

Proyecto académico de Emprendimiento de Base Tecnológica, Politécnico Grancolombiano.

## Prototipo
- Administrador general: correo y contraseña de demostración, gestión de establecimientos y catálogo.
- Dueño: acceso por código privado generado por el administrador; reproducción, moderación y QR.
- Visitantes: acceso mediante QR público, sin cuenta; solicitudes y un voto por sesión y solicitud.

## Arquitectura
Interfaz web adaptable en español; Vercel; Supabase PostgreSQL con RLS y acceso directo restringido; Edge Function `sonora-sesion` con autorización de sesión por rol. Sin infraestructura compartida con otros proyectos.

## Audio y licencias
Seis pistas sintéticas originales de 90 segundos generadas en el navegador. Los MP3 de terceros no se redistribuyen sin autorización verificable. El catálogo admite una URL de audio para futuras pistas autorizadas.

## Pruebas de aceptación
1. Ingresar como administrador y crear un establecimiento; copiar su código privado.
2. Abrir el acceso de dueño en otro navegador e ingresar el código.
3. Generar el QR y escanearlo desde un teléfono. Solicitar una pista, votar y comprobar que el panel se actualiza.
4. Aprobar, reproducir, pausar, ajustar volumen y avanzar a otra pista.
5. Cerrar la participación y comprobar que no se aceptan solicitudes ni votos.
6. Desactivar un establecimiento y comprobar que el acceso queda bloqueado.

Las credenciales no se incluyen en el repositorio. Las pruebas con usuarios reales deben documentarse por separado; no se atribuyen resultados de validación que no se hayan obtenido.
