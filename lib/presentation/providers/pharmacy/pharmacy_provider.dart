import 'package:riverpod/riverpod.dart';

final pharmacyProvider =
    StateNotifierProvider<PharmacyNotifier, PharmacyState>((ref) {
  return PharmacyNotifier();
});

class PharmacyNotifier extends StateNotifier<PharmacyState> {
  PharmacyNotifier() : super(PharmacyState());
}

class PharmacyState {}
