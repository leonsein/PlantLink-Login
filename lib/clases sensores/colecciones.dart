import 'package:login_plantlink/clases%20sensores/sensores.dart';

class ColeccionData {
  String tiempo;
  SensorData co2;
  SensorData gas;
  SensorData humedad;
  SensorData humedadDelSuelo;
  SensorData intensidadLuz;
  SensorData smoke;
  SensorData temperatura;
  ColeccionData(this.tiempo, this.co2, this.gas, this.humedad, this.humedadDelSuelo, this.intensidadLuz, this.smoke, this.temperatura);
}