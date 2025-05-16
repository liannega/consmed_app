
import 'package:consmed_app/presentation/pages/acerca_de_page.dart';
import 'package:consmed_app/presentation/pages/preguntas_frecuantes_page.dart';
import 'package:consmed_app/presentation/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

final approuter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/acercade',
    builder: (context, state) => const AcercaDe(),
  ),
  GoRoute(
    path: '/preguntas',
    builder: (context, state) => const PreguntasFrecuentesPage(),
  ),
]);
