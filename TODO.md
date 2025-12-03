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

## Limpieza y reutilización
- [x] Centralizar datos mock en fixtures/modelos (Search/Tracker/Comunidad) para evitar strings duplicados.
- [x] Comunidad: usar `CustomScrollView + SliverList` con un solo `AppSection` para el feed, evitando secciones vacías por item.
- [x] Crear `SectionCard` que combine `GlassSurface + AppSection` para reducir composición repetida.
- [x] Definir barra de acciones reutilizable (CTAs, filtros/alertas) usando `AppButton` cuando haya múltiples acciones en una sección.
- [x] Centralizar configuración de grillas (columnas y `childAspectRatio`) en helper si se repite entre Search/Comunidad.
- [x] Añadir estados reutilizables (`AppEmptyState`, `AppLoadingOverlay`) para listas/formularios.
- [x] Crear `GlassFormTextField` con soporte de error/ayuda para futuros formularios.
- [x] Repositorios/mock providers por feature para preparar capas domain/data.
- [x] Optimizar listas largas con `AppSliverPage` cuando haya feeds extensos (usado en Comunidad).
- [x] Inyección de dependencias para repos (mocks desde capa de presentación via `RepositoryProvider`).
- [x] Centralizar strings (l10n o recurso compartido) para evitar hardcodes y preparar traducciones.
- [x] Ajustar `AppSliverPage` para aplicar `maxWidth`/constraints a slivers y usarlo en feeds cuando correspondan.
- [x] Tests mínimos de widgets (navegación y componentes clave) para validar layout sin overflows.
- [x] Extender DI para datos reales (sustituir mocks), incluyendo configuración de entorno y factories.
- [x] Incorporar l10n real con ARB y `flutter gen-l10n`.
- [x] Añadir estados de error/loading/empty integrados en cada feature (usar `AppEmptyState`/`AppLoadingOverlay`).
- [x] Tests adicionales: rail en desktop, layouts de grid en tablet/desktop, y validación de AppSection con acciones en pantallas estrechas.
- [x] Componente de toast/snackbar reutilizable para feedback de usuario.
- [x] Inline forms: validar `GlassFormTextField` con formularios (ej. nuevo tracking) y mostrar errores.
- [ ] Migrar de `Strings` a `AppLocalizations` generadas con ARB (usar `flutter gen-l10n`), eliminar hardcodes y duplicados.
- [ ] Sustituir `RepositoryProvider` estático por inyección (provider/riverpod/get_it) y repos async (contratos con Future) listos para datos reales.
- [ ] Implementar flujos de loading/error/empty reales en Search/Tracker/Comunidad usando `AppLoadingOverlay`/`AppEmptyState` y repos async.
- [ ] Mover textos embebidos en componentes (mensajes de empty, errores de tracking) a l10n.
- [ ] Crear validadores/estado de formularios reutilizables para `GlassFormTextField` y aplicarlos en tracking u otros formularios.
- [ ] Usar `SectionCard` de forma consistente en bloques (Search/Config/Tracker) para reducir composición manual.
- [ ] Revisar `AppSliverPage`: aplicar maxWidth a slivers y soportar headers/pinning si se necesitan feeds más ricos.
- [ ] Expandir tests: loading/empty en Search/Tracker, NavigationRail en desktop y barras de acción en anchos estrechos.
