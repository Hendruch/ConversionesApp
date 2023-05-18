class TiposConversion {
  final String nombre;
  final List<String> unidades;

  TiposConversion(this.nombre, this.unidades);
  
}

class TiposConversionData {
  static List<TiposConversion> tipos = [
    TiposConversion(
      'Longitud', 
      ['Metros', 'Pies', 'Pulgadas', 'Centimetros']
    ),
    TiposConversion(
      'Tiempo', 
      ['Horas', 'Minutos', 'Segundos']
    ),
    TiposConversion(
      'Masa', 
      ['Kilogramos', 'Libras', 'Gramos']
    ),
    TiposConversion(
      'Área', 
      ['M^2', 'Hectareas', 'Acres']
    ),
    TiposConversion(
      'Volumen', 
      ['Litros', 'M^3', 'Onzas']
    ),
    TiposConversion(
      'Velocidad', 
      ['Kmh', 'Mph']
    ),
  ];
}