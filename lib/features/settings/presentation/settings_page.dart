import 'package:flutter/material.dart';

import '../../../core/widgets/app_background.dart';
import '../../../core/widgets/clear_glass.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            ClearGlass(
              padding: EdgeInsets.all(16),
              child: _Section(
                title: 'Apariencia',
                children: [
                  _SettingTile(
                    icon: Icons.brightness_6_outlined,
                    title: 'Tema',
                    subtitle: 'Claro / Oscuro / Sistema',
                  ),
                  _SettingTile(
                    icon: Icons.color_lens_outlined,
                    title: 'Acento de color',
                    subtitle: 'Verde (predeterminado)',
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            ClearGlass(
              padding: EdgeInsets.all(16),
              child: _Section(
                title: 'Notificaciones',
                children: [
                  _SettingTile(
                    icon: Icons.local_offer_outlined,
                    title: 'Alertas de ofertas',
                    subtitle: 'Cambios de precio y ofertas destacadas',
                  ),
                  _SettingTile(
                    icon: Icons.local_shipping_outlined,
                    title: 'Estados de envío',
                    subtitle: 'Actualizaciones del tracker y aduana',
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            ClearGlass(
              padding: EdgeInsets.all(16),
              child: _Section(
                title: 'Cuenta',
                children: [
                  _SettingTile(
                    icon: Icons.person_outline,
                    title: 'Perfil',
                    subtitle: 'Datos y preferencias de la cuenta',
                  ),
                  _SettingTile(
                    icon: Icons.security_outlined,
                    title: 'Privacidad',
                    subtitle: 'Control de datos y actividad',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
