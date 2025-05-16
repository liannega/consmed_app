import 'package:consmed_app/config/utils/custom_context.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          itemMenu(
            context: context,
            icon: Icons.info,
            text: 'Acerca de',
            onTap: () {
              context.go('/acercade');
            },
          ),
          itemMenu(
            context: context,
            icon: Icons.download,
            text: 'Descargas',
            onTap: () {},
          ),
          itemMenu(
            context: context,
            icon: Icons.question_answer,
            text: 'FAQs',
            onTap: () {
              context.go('/preguntas');
            },
          ),
          const Divider(),
          itemMenu(
            context: context,
            icon: Icons.contact_support,
            text: 'Contacto',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget itemMenu({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return ListTile(
      leading: Icon(icon, color: context.primary),
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
        onTap.call();
      },
    );
  }
}
