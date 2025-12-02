# TODO - Responsividad y componentes

## Layout base
- [x] Crear `AppPageScaffold`: combina `AppBackground` + `SafeArea` + `SingleChildScrollView` con padding y `bottomPadding` automático. Opcional `maxWidth` para centrar contenido en pantallas amplias.
- [x] Crear `GlassSurface` (variante de `GlassCard`) con `maxWidth` opcional para centrar bloques en tablet/desktop.
- [x] Crear `AppSection`: recibe `title`, `child` y acción opcional (botón), para headers consistentes en Search/Config/Comunidad.

## Breakpoints y helpers
- [x] Definir breakpoints: móvil <600, tablet 600–1024, desktop >1024.
- [x] Helpers en `core/utils/layout.dart`: `isMobile/isTablet/isDesktop`, `edgePadding(bp)`, `maxContentWidth(bp)`, `gridColumns(bp)`.

## Aplicar responsividad
 - [x] Search: migrar a `AppPageScaffold`; usar `gridColumns(bp)` para ofertas (1 col móvil, 2–3 col tablet/desktop); limitar `maxContentWidth` en móvil.
 - [x] Comunidad: migrar a `AppPageScaffold`; usar `CustomScrollView + SliverList`; centrar contenido con `maxWidth` en pantallas grandes.
 - [x] Tracker: migrar a `AppPageScaffold`; aplicar `maxWidth` a cards; ajustar `maxLines` y `ellipsis` según breakpoint; mantener padding inferior dinámico vía helper.
 - [x] Config: migrar a `AppPageScaffold`; usar `AppSection` para bloques; añadir `AppButton` en acciones (p.ej., gestionar perfil/notificaciones).

## Estandarizar UI
 - [x] Reemplazar `SizedBox` numéricos por constantes de `AppSpacing`.
 - [x] Usar `AppButton` para CTAs y acciones comunes.
 - [x] Tipografía: considerar tamaños levemente mayores en tablet/desktop.
 - [x] Navegación: evaluar `NavigationRail` en desktop/tablet grande según breakpoint.
