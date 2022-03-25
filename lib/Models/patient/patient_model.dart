class PatientModel {
  int? batteryCharge;
  int? currentHeartRate;
  double? heartBeat;
  int? spO2;
  int? currentOxy;
  int? currentTemp;
  int? deviceId;
  int? height;
  int? weight;
  double? lat;
  double? long;
  int? privacy;

  PatientModel.fromDataBase(Map<dynamic, dynamic> db) {
    privacy = db['privacy'];
    batteryCharge = db['battaryCharge'];
    currentHeartRate = db['currentHeartRate'];
    heartBeat = db['sensors']['heartBeat'];
    spO2 = db['sensors']['spO2'];
    currentOxy = db['currentOxy'];
    currentTemp = db['currentTemp'];
    deviceId = db['deviceId'];
    height = db['height'];
    weight = db['weight'];
    lat = db['location']['lat'];
    lat = db['location']['long'];
  }
}

class History {
  int? heartRateValue;
  String? timeOfHeartRateValue;
  int? oxygenValue;
  String? timeOfOxygenValue;
  int? temperatureValue;
  String? timeOfTemperatureValue;
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
