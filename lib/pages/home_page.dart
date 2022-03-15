import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App para puro diseño'),
      ),
      body: ListView(
        children: [
          const _Items(
            title: 'Pagina de perfil',
            route: 'profile',
          ),
          const _Items(
            title: 'bottom navigation bar animated',
            route: 'animatedNavBar',
          ),
          const _Items(
            title: 'change theme',
            route: 'changeTheme',
          ),
          const _Items(
            title: 'Sliders',
            route: 'sliders',
          ),
        ],
      ),
    );
  }
}

class _Items extends StatelessWidget {
  final String title;
  final String route;
  const _Items({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
