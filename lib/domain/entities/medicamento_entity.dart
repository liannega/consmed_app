class MedicamentoEntity {
  final int idindicador;
  final String denominacion;
  final String? descripcion;
  final String? codigoprod;
  final String codigobarra;
  final String precioventa;

  MedicamentoEntity({
    required this.idindicador,
    required this.denominacion,
    required this.descripcion,
    required this.codigoprod,
    required this.codigobarra,
    required this.precioventa,
  });
}
