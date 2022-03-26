class PatientModel {
  int? batteryCharge;
  double? temperature;
  double? heartBeat;
  int? spO2;
  int? currentOxy;
  int? deviceId;
  int? height;
  int? weight;
  double? lat;
  double? long;
  int? privacy;

  PatientModel.fromDataBase(Map<dynamic, dynamic> db) {
    privacy = db['privacy'];
    batteryCharge = db['battaryCharge'];
    temperature = db['sensors']['tempreture'];
    heartBeat = db['sensors']['heartBeat'];
    spO2 = db['sensors']['spO2'];
    currentOxy = db['currentOxy'];
    deviceId = db['deviceId'];
    height = db['height'];
    weight = db['weight'];
    lat = db['location']['lat'];
    lat = db['location']['long'];
  }
}

class History {
  int? heartRateValue;
  DateTime? timeOfHeartRateValue;
  int? oxygenValue;
  DateTime? timeOfOxygenValue;
  int? temperatureValue;
  DateTime? timeOfTemperatureValue;
  History({
    required this.timeOfTemperatureValue,
    required this.temperatureValue,
    required this.timeOfOxygenValue,
    required this.oxygenValue,
    required this.timeOfHeartRateValue,
    required this.heartRateValue,
  });

  History.fromDataBase(Map<dynamic, dynamic> db) {
    heartRateValue = db['heartRate']['heartRateValue'];
    timeOfHeartRateValue = db['heartRate']['time'];
    oxygenValue = db['oxygenRate']['oxygenValue'];
    timeOfOxygenValue = db['oxygenRate']['time'];
    temperatureValue = db['temperatureRate']['temperatureValue'];
    timeOfTemperatureValue = db['temperatureRate']['time'];
  }

  Map<String, dynamic> toMap() {
    return {
      "heartRate": {
        "heartRateValue": heartRateValue,
        "time": timeOfHeartRateValue,
      },
      "oxygenRate": {
        "oxygenValue": oxygenValue,
        "time": timeOfOxygenValue,
      },
      "temperatureRate": {
        "temperatureValue": temperatureValue,
        "time": timeOfTemperatureValue,
      },
    };
  }
}
