import 'package:consmed_app/data/datasources/api.dart';
import 'package:consmed_app/domain/entities/dpt_entity.dart';
import 'package:consmed_app/domain/repositories/remote_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Asumiendo que ya tienes este provider definido
final remoteRepositoryProvider = Provider<RemoteRepository>((ref) {
  return ApiConsumer();
});

final provinceProvider =
    StateNotifierProvider<ProvinceNotifier, ProvinceState>((ref) {
  final repository = ref.watch(remoteRepositoryProvider);
  return ProvinceNotifier(repository);
});

class ProvinceNotifier extends StateNotifier<ProvinceState> {
  final RemoteRepository _repository;

  ProvinceNotifier(this._repository) : super(ProvinceState()) {
    getProvinces();
  }

  Future<void> getProvinces() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _repository.province.getProvince();

    if (response.status == 200 && response.data != null) {
      state = state.copyWith(
        provinces: response.data!,
        isLoading: false,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: response.message ?? 'Error al obtener las provincias',
      );
    }
  }

  void selectProvince(DptEntity province) {
    state = state.copyWith(selectedProvince: province);
  }
}

class ProvinceState {
  final List<DptEntity> provinces;
  final bool isLoading;
  final String? errorMessage;
  final DptEntity? selectedProvince;

  ProvinceState({
    this.provinces = const [],
    this.isLoading = false,
    this.errorMessage,
    this.selectedProvince,
  });

  ProvinceState copyWith({
    List<DptEntity>? provinces,
    bool? isLoading,
    String? errorMessage,
    DptEntity? selectedProvince,
  }) {
    return ProvinceState(
      provinces: provinces ?? this.provinces,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedProvince: selectedProvince ?? this.selectedProvince,
    );
  }
}
