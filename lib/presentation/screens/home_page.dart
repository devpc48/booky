import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booky'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 3/2,
        children: [
          _MenuCard(
            title: 'Usuarios',
            icon: Icons.people,
            onTap: () => Navigator.pushNamed(context, '/users'),
          ),
          _MenuCard(
            title: 'Locales',
            icon: Icons.location_on,
            onTap: () => Navigator.pushNamed(context, '/locals'),
          ),
          _MenuCard(
            title: 'Tipos de Equipo',
            icon: Icons.category,
            onTap: () => Navigator.pushNamed(context, '/equipment-types'),
          ),
          _MenuCard(
            title: 'Equipos',
            icon: Icons.computer,
            onTap: () => Navigator.pushNamed(context, '/equipment'),
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _MenuCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}