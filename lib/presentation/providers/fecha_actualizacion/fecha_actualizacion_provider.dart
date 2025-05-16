import 'package:consmed_app/data/datasources/api.dart';
import 'package:consmed_app/domain/entities/fecha_actualizacion_entity.dart';
import 'package:consmed_app/domain/repositories/remote_repository.dart';
import 'package:riverpod/riverpod.dart';

// Proveedor para el repositorio remoto
final remoteRepositoryProvider = Provider<RemoteRepository>((ref) {
  return ApiConsumer();
});

final fechaActualizacionProvider =
    StateNotifierProvider<FechaActualizacionNotifier, FechaActualizacionState>(
  (ref) {
    final repository = ref.watch(remoteRepositoryProvider);
    return FechaActualizacionNotifier(repository);
  },
);

class FechaActualizacionNotifier
    extends StateNotifier<FechaActualizacionState> {
  final RemoteRepository _repository;

  FechaActualizacionNotifier(this._repository)
      : super(FechaActualizacionState()) {
    getFechaActualizacion();
  }

  Future<void> getFechaActualizacion() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response =
        await _repository.fechaActualizacion.getFechaActualizacion();

    if (response.status == 200 && response.data != null) {
      state = state.copyWith(
        fechaActualizacion: response.data!.fechaActualizacion,
        isLoading: false,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage:
            response.message ?? 'Error al obtener la fecha de actualización',
      );
    }
  }
}

class FechaActualizacionState {
  final DateTime? fechaActualizacion;
  final bool isLoading;
  final String? errorMessage;

  FechaActualizacionState({
    this.fechaActualizacion,
    this.isLoading = false,
    this.errorMessage,
  });

  FechaActualizacionState copyWith({
    DateTime? fechaActualizacion,
    bool? isLoading,
    String? errorMessage,
  }) {
    return FechaActualizacionState(
      fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
