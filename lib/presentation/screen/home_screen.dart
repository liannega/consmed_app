import 'package:consmed_app/config/utils/custom_context.dart';
import 'package:consmed_app/domain/entities/dpt_entity.dart';
import 'package:consmed_app/presentation/providers/fecha_actualizacion/fecha_actualizacion_provider.dart';
import 'package:consmed_app/presentation/providers/municipality/muncipality_provider.dart';
import 'package:consmed_app/presentation/providers/province/province_provider.dart';
import 'package:consmed_app/presentation/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final fechaActualizacionState = ref.watch(fechaActualizacionProvider);
    final provinceState = ref.watch(provinceProvider);
    final municipalityState = ref.watch(municipalityProvider);

    final String fechaFormateada =
        fechaActualizacionState.fechaActualizacion != null
            ? DateFormat('dd/MM/yyyy')
                .format(fechaActualizacionState.fechaActualizacion!)
            : fechaActualizacionState.isLoading
                ? 'Cargando...'
                : 'No disponible';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0097A7),
        title: Text(
          'CONSMED',
          style: context.titleLarge.copyWith(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              'Última actualización:\n$fechaFormateada',
              style: context.labelSmall.copyWith(color: Colors.white),
              textAlign: TextAlign.end,
              maxLines: 2,
            ),
          )
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const MenuLateral(),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        // Logo
                        Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 380,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Formulario con validación
                        Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                // Dropdown de Provincias con validación visual
                                if (provinceState.isLoading)
                                  const Center(
                                      child: CircularProgressIndicator())
                                else if (provinceState.errorMessage != null)
                                  Text(
                                    'Error: ${provinceState.errorMessage}',
                                    style: const TextStyle(color: Colors.red),
                                  )
                                else
                                  DropdownButtonFormField<DptEntity>(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      labelText: 'Provincia*',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 1.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 2.0),
                                      ),
                                    ),
                                    value: provinceState.selectedProvince,
                                    items:
                                        provinceState.provinces.map((province) {
                                      return DropdownMenuItem<DptEntity>(
                                        value: province,
                                        child: Text(
                                          province.denominacion,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (DptEntity? value) {
                                      if (value != null) {
                                        ref
                                            .read(provinceProvider.notifier)
                                            .selectProvince(value);
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Por favor seleccione una provincia';
                                      }
                                      return null;
                                    },
                                    hint:
                                        const Text('Seleccione una provincia'),
                                  ),
                                const SizedBox(height: 16),

                                // Dropdown de Municipios con validación visual
                                if (municipalityState.isLoading)
                                  const Center(
                                      child: CircularProgressIndicator())
                                else if (municipalityState.errorMessage != null)
                                  Text(
                                    'Error: ${municipalityState.errorMessage}',
                                    style: const TextStyle(color: Colors.red),
                                  )
                                else
                                  DropdownButtonFormField<DptEntity>(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      labelText: 'Municipio*',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 1.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 2.0),
                                      ),
                                      errorStyle: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                    ),
                                    value:
                                        municipalityState.selectedMunicipality,
                                    items: municipalityState.municipalities
                                        .map((municipality) {
                                      return DropdownMenuItem<DptEntity>(
                                        value: municipality,
                                        child: Text(
                                          municipality.denominacion,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (DptEntity? value) {
                                      if (value != null) {
                                        ref
                                            .read(municipalityProvider.notifier)
                                            .selectMunicipality(value);
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Por favor seleccione un municipio';
                                      }
                                      return null;
                                    },
                                    hint: const Text('Seleccione un municipio'),
                                  ),
                                const SizedBox(height: 16),

                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Medicamento',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF0097A7),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14.0),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        FocusScope.of(context).unfocus();
                                        // Aquí puedes continuar con la búsqueda
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Realizando búsqueda...'),
                                            backgroundColor: Color(0xFF0097A7),
                                          ),
                                        );
                                      } else {
                                        // Mostrar mensaje de error
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Por favor complete los campos obligatorios'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'Buscar',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
