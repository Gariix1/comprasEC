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
- [x] Migrar de `Strings` a `AppLocalizations` generadas con ARB (usar `flutter gen-l10n`), eliminar hardcodes y duplicados.
- [x] Sustituir `RepositoryProvider` estático por inyección (provider/riverpod/get_it) y repos async (contratos con Future) listos para datos reales.
- [x] Implementar flujos de loading/error/empty reales en Search/Tracker/Comunidad usando `AppLoadingOverlay`/`AppEmptyState` y repos async.
- [x] Mover textos embebidos en componentes (mensajes de empty, errores de tracking) a l10n.
- [x] Crear validadores/estado de formularios reutilizables para `GlassFormTextField` y aplicarlos en tracking u otros formularios.
- [x] Usar `SectionCard` de forma consistente en bloques (Search/Config/Tracker) para reducir composición manual.
- [x] Revisar `AppSliverPage`: aplicar maxWidth a slivers y soportar headers/pinning si se necesitan feeds más ricos.
- [x] Expandir tests: loading/empty en Search/Tracker y barras de acción en anchos estrechos (nav rail ya cubierto).
- [x] Plan de migración l10n + async estable:
  - [x] Regenerar l10n con `flutter gen-l10n` (PowerShell) -> genera en `lib/l10n`.
  - [x] Usar `package:compras_ec/l10n/app_localizations.dart` (synthetic-package deprecado).
  - [x] Migrar Search/Tracker/Comunidad/Settings a `AppLocalizations` (reemplazar `Strings.*` y hardcodes).
  - [x] Alinear mensajes de error/empty en l10n y `FutureBuilder` con repos async.
  - [x] Actualizar tests por cambios de textos/l10n (providers y strings ajustados).

## Escalabilidad pendiente (queda para despues)
- [x] Accesibilidad: contraste ajustado (overlay en glass) y focus order mejorado con `FocusTraversalGroup`; labels listos.
- [x] CI fase 1: workflow GitHub Actions con cache de Flutter que corre analyze/test/goldens. (Fase 2 pendiente: codecov + builds por plataforma).
- [x] Fuentes: bundlear Roboto en `assets/fonts` y declarada en `pubspec.yaml` (sin fetch, funciona offline/web).
- [x] DI migrada a Riverpod (providers globales, overrides por env mock/prod con `buildOverrides`).
- Pasos propuestos:
  1) Fuentes en tests: set `GoogleFonts.config.allowRuntimeFetching=false` en `flutter_test_config.dart` y/o usar stack local para tests. **(hecho)**
  2) Accesibilidad básica: agregar semantics labels a íconos/nav/tiles y revisar contraste en el tema; test de smoke que valide labels. **(hecho: labels + contraste/focus order)** 
  3) CI fase 1: workflow con cache de Flutter, `flutter pub get`, `flutter analyze`, `flutter test` y goldens. **(hecho)** Fase 2: codecov + builds por plataforma.

## Modernización Material 3 (pendiente)
- [x] Ajustar `AppTheme` a M3 avanzado: `pageTransitionsTheme` (fadeThrough para tabs, sharedAxis para flows), `cardTheme` con superficie controlada y `inputDecorationTheme` filled con `surfaceVariant`.
- [ ] Reemplazar glass en tarjetas densas por `Card` M3 (tonalElevation 3–5); mantener glass solo en hero/blocks clave. NavigationBar sobre `surface` con `indicatorColor` del scheme.
- [ ] Motion: usar `AnimatedSwitcher` en estados loading/empty/data y `AnimatedContainer`/hover/focus; `ImplicitlyAnimatedList` opcional para feeds.
- [ ] Componentes M3: Search con chips (Filter/Assist), TextField filled; Tracker con `ListTile` M3 + `tonalElevation`; Config/Comunidad con `Card` + `ListTile` y `AssistChip` para acciones.
- [ ] Shapes y spacing: bordes 12/16px en `cardTheme/bottomSheet/dialog`, mantener escala AppSpacing (4/8/12/16/24); revisar maxWidth y grids ya existentes.
- [ ] Optional: modo “low blur” para dispositivos lentos (toggle de glass vs. tonal).
- [ ] Dynamic color opcional en Android 12+ (toggle seed fijo vs. `DynamicColorBuilder` con fallback al seed actual).
- [ ] Unificar transiciones M3 también en modales/diálogos (`modalBottomSheetTheme` con drag handle y `dialogTheme` alineado).
