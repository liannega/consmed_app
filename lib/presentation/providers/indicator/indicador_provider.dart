import 'package:riverpod/riverpod.dart';

final indicadorProvider =
    StateNotifierProvider<IndicadorNotifier, IndicadorState>((ref) {
  return IndicadorNotifier();
});

class IndicadorNotifier extends StateNotifier<IndicadorState> {
  IndicadorNotifier() : super(IndicadorState());
}

class IndicadorState {}
