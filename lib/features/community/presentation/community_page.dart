import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comunidad'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(child: Icon(Icons.person)),
                      const SizedBox(width: 8),
                      Text('Usuario${index + 1}',
                          style: Theme.of(context).textTheme.titleMedium),
                      const Spacer(),
                      const Icon(Icons.thumb_up_alt_outlined, size: 18),
                      const SizedBox(width: 4),
                      const Text('12'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Mi experiencia comprando en Temu: llego en 12 dias, revisado por aduana sin impuestos.',
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: const [
                      Chip(label: Text('Temu')),
                      Chip(label: Text('Envio')),
                      Chip(label: Text('Ecuador')),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
