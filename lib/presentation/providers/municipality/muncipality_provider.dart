import 'package:consmed_app/data/datasources/api.dart';
import 'package:consmed_app/domain/entities/dpt_entity.dart';
import 'package:consmed_app/domain/repositories/remote_repository.dart';
import 'package:consmed_app/presentation/providers/province/province_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteRepositoryProvider = Provider<RemoteRepository>((ref) {
  return ApiConsumer();
});

final municipalityProvider =
    StateNotifierProvider<MunicipalityNotifier, MunicipalityState>((ref) {
  final repository = ref.watch(remoteRepositoryProvider);
  return MunicipalityNotifier(repository, ref);
});

class MunicipalityState {
  final List<DptEntity> municipalities;
  final bool isLoading;
  final String? errorMessage;
  final DptEntity? selectedMunicipality;

  MunicipalityState({
    this.municipalities = const [],
    this.isLoading = false,
    this.errorMessage,
    this.selectedMunicipality,
  });

  MunicipalityState copyWith({
    List<DptEntity>? municipalities,
    bool? isLoading,
    String? errorMessage,
    DptEntity? selectedMunicipality,
  }) {
    return MunicipalityState(
      municipalities: municipalities ?? this.municipalities,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedMunicipality: selectedMunicipality ?? this.selectedMunicipality,
    );
  }
}

class MunicipalityNotifier extends StateNotifier<MunicipalityState> {
  final RemoteRepository _repository;
  final Ref _ref;

  MunicipalityNotifier(this._repository, this._ref)
      : super(MunicipalityState()) {
    _setupProvinceListener();
  }

  void _setupProvinceListener() {
    _ref.listen(provinceProvider, (previous, next) {
      if (previous?.selectedProvince?.iddpt != next.selectedProvince?.iddpt &&
          next.selectedProvince != null) {
        getMunicipalities(next.selectedProvince!.iddpt.toString());
      }
    });
  }

  Future<void> getMunicipalities(String idPadre) async {
    state = state.copyWith(
        isLoading: true,
        errorMessage: null,
        municipalities: [],
        selectedMunicipality: null);

    try {
      final response = await _repository.municipality.getMunicipality(idPadre);

      if (response.status == 200 && response.data != null) {
        state = state.copyWith(
          municipalities: response.data!,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: response.message ?? 'Error al obtener los municipios',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error: ${e.toString()}',
      );
    }
  }

  void selectMunicipality(DptEntity municipality) {
    state = state.copyWith(selectedMunicipality: municipality);
  }

  void reset() {
    state = state.copyWith(
      municipalities: [],
      selectedMunicipality: null,
      errorMessage: null,
    );
  }
}
