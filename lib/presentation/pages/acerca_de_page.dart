import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AcercaDe extends StatelessWidget {
  const AcercaDe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (context.canPop()) {
                Navigator.pop(context);
              } else {
                context.go(
                    '/');
              }
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: const Color(0xFF0097A7),
        title: Text(
          'Acerca de',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: const Color(0xFF0097A7).withOpacity(0.1),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Plataforma Pública de Consulta de Medicamentos',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: const Color(0xFF0097A7),
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    context,
                    'Descripción',
                    'CONSMED es una plataforma pública diseñada para facilitar el acceso a la información sobre medicamentos en tiempo real, proporcionando a los usuarios un recurso confiable y fácil de usar para consultar la disponibilidad y características de los medicamentos en disponibilidad en las farmacias cubanas. Este sistema tiene como objetivo principal ofrecer a los ciudadanos, profesionales de la salud y a la comunidad en general, una herramienta eficaz para conocer la existencia y disponibilidad de medicamentos, así como detalles importantes sobre su uso y características.',
                  ),
                  _buildSection(
                    context,
                    'Características del Proyecto',
                    '',
                    bulletPoints: [
                      'Búsqueda Avanzada de Medicamentos: Permite a los usuarios buscar medicamentos por nombre, principio activo, presentación, categoría terapéutica y más, obteniendo resultados precisos y detallados.',
                      'Información Completa de Medicamentos: Cada medicamento en la plataforma cuenta con datos completos, incluyendo el nombre comercial, nombre genérico, dosis, formas farmacéuticas, efectos secundarios, contraindicaciones, y disponibilidad en las farmacias.',
                      'Interfaz Intuitiva: La plataforma fue desarrollada con un diseño sencillo y responsivo, lo que permite que sea utilizada tanto por profesionales de la salud como por el público general, sin complicaciones.',
                      'Acceso Público: CONSMED es completamente accesible para todos los usuarios, sin necesidad de registro, asegurando que cualquier persona pueda hacer consultas rápidas en cualquier momento.',
                      'Información Actualizada: La base de datos de medicamentos está constantemente actualizada para asegurar que la información disponible sea la más precisa y reciente posible.',
                    ],
                  ),
                  _buildSection(
                    context,
                    'Objetivo del Proyecto',
                    'El objetivo de CONSMED es ser una herramienta confiable para el público, mejorando la accesibilidad a la información farmacéutica y contribuyendo a la toma de decisiones informadas en la compra y uso de medicamentos. Al facilitar la búsqueda y consulta de medicamentos disponibles en farmacias, CONSMED busca reducir la incertidumbre en la población, optimizando el acceso a tratamientos adecuados.',
                  ),
                  _buildSection(
                    context,
                    'Tecnologías Utilizadas',
                    '',
                    bulletPoints: [
                      'Angular: para el desarrollo frontend, proporcionando una experiencia de usuario fluida y dinámica.',
                      'Leaflet: para la integración de mapas interactivos que permiten a los usuarios visualizar la localización de las farmacias más cercanas.',
                      'Bootstrap: para garantizar una interfaz responsiva y accesible en dispositivos móviles y de escritorio.',
                    ],
                  ),
                  _buildSection(
                    context,
                    'Visión Futura',
                    'CONSMED tiene como visión expandir su alcance e incluir funcionalidades adicionales que permitan mejorar aún más la experiencia del usuario. Se planea incorporar nuevas herramientas, como la posibilidad de verificar la disponibilidad de medicamentos en tiempo real en farmacias, integrar opciones de compra online y seguir ampliando la base de datos con más medicamentos, tanto nacionales como internacionales.',
                  ),
                  _buildSection(
                    context,
                    'Compromiso con la Salud Pública',
                    'A través de la plataforma, CONSMED contribuye al bienestar de la sociedad al ofrecer un acceso claro y directo a la información necesaria para tomar decisiones informadas sobre medicamentos. El proyecto no solo responde a una necesidad creciente de accesibilidad a la información, sino que también se alinea con las mejores prácticas de salud pública al promover el uso responsable de los medicamentos.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content,
      {List<String>? bulletPoints}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: const Color(0xFF0097A7),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        if (content.isNotEmpty)
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                ),
          ),
        if (bulletPoints != null) ...[
          const SizedBox(height: 8),
          ...bulletPoints.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 20)),
                  Expanded(
                    child: Text(
                      point,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            height: 1.6,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
