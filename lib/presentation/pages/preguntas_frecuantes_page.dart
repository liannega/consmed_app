import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PreguntasFrecuentesPage extends StatelessWidget {
  const PreguntasFrecuentesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (context.canPop()) {
                Navigator.pop(context);
              } else {
                context.go('/');
              }
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: const Color(0xFF0097A7),
        title: Text(
          'Preguntas frecuentes',
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
                    'Preguntas Frecuentes',
                    'Encuentra respuestas a las preguntas más comunes sobre el uso y funcionamiento de la plataforma CONSMED. ',
                  ),
                  _buildSection(
                    context,
                    '¿Qué es CONSMED?',
                    'CONSMED es una plataforma pública que permite consultar la disponibilidad de medicamentos en tiempo real. Facilita a los usuarios obtener información precisa sobre medicamentos en las farmacias. ',
                  ),
                  _buildSection(
                    context,
                    '¿Cómo busco un medicamento?',
                    'En la página principal, utiliza el buscador ingresando primeramente la provincia donde desea realizar la búsqueda, seguido el municipio y por último el nombre del medicamento o seleccionarlo del listado en disponibilidad.',
                  ),
                  _buildSection(
                    context,
                    '¿Por qué no se listan todos los municipios de la provincia?',
                    'Solamente la plataforma lista los municipios del país que tienen existencia de medicamentos. ',
                  ),
                  _buildSection(
                    context,
                    '¿Es necesario registrarse para usar la plataforma?',
                    'No, la plataforma es completamente pública y no requiere registro. Puedes acceder a todas las funcionalidades sin necesidad de crear una cuenta.',
                  ),
                  _buildSection(
                    context,
                    '¿Cómo se asegura que la información de los medicamentos esté actualizada?',
                    'Trabajamos con fuentes confiables y actualizamos la base de datos regularmente para garantizar la precisión de la información presentada en la plataforma.',
                  ),
                  _buildSection(
                    context,
                    '¿Puedo saber en qué farmacia se encuentra disponible un medicamento?',
                    'Sí, al buscar un medicamento, la plataforma muestra un mapa con las farmacias cercanas que cuentan con el medicamento en existencia.',
                  ),
                  _buildSection(
                    context,
                    '¿Qué hago si no encuentro un medicamento?',
                    'Si no encuentras un medicamento, verifica su nombre. Si persiste el problema, es posible que no esté registrado en la base de datos. Puedes contactar con el soporte de la plataforma para más ayuda.',
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
