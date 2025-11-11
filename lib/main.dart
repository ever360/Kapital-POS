// Kapital POS Flutter PWA Base
// Compatible con modo dark/light, PC y móvil.
// Estructura inicial con rutas: Login, Clientes, Ventas, Compras, Inventario, Usuarios.

import 'package:flutter/material.dart';

void main() {
  runApp(const KapitalPOSApp());
}

class KapitalPOSApp extends StatelessWidget {
  const KapitalPOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kapital POS',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        '/clientes': (_) => const ClientesScreen(),
        '/ventas': (_) => const VentasScreen(),
        '/compras': (_) => const ComprasScreen(),
        '/inventario': (_) => const InventarioScreen(),
        '/usuarios': (_) => const UsuariosScreen(),
      },
    );
  }
}

// Pantalla de Login
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/ventas');
          },
          child: const Text('Entrar al POS'),
        ),
      ),
    );
  }
}

// Plantillas de pantallas base
class ClientesScreen extends StatelessWidget {
  const ClientesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const BasePage(title: 'Clientes');
  }
}

class VentasScreen extends StatelessWidget {
  const VentasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const BasePage(title: 'Ventas');
  }
}

class ComprasScreen extends StatelessWidget {
  const ComprasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const BasePage(title: 'Compras');
  }
}

class InventarioScreen extends StatelessWidget {
  const InventarioScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const BasePage(title: 'Inventario');
  }
}

class UsuariosScreen extends StatelessWidget {
  const UsuariosScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const BasePage(title: 'Usuarios');
  }
}

// Página base reutilizable con menú lateral
class BasePage extends StatelessWidget {
  final String title;
  const BasePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text('Kapital POS', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            _drawerItem(context, Icons.shopping_cart, 'Ventas', '/ventas'),
            _drawerItem(context, Icons.people, 'Clientes', '/clientes'),
            _drawerItem(context, Icons.inventory, 'Inventario', '/inventario'),
            _drawerItem(context, Icons.shopping_bag, 'Compras', '/compras'),
            _drawerItem(context, Icons.person, 'Usuarios', '/usuarios'),
          ],
        ),
      ),
      body: Center(child: Text('Pantalla de $title')),
    );
  }

  ListTile _drawerItem(BuildContext context, IconData icon, String label, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }
}
