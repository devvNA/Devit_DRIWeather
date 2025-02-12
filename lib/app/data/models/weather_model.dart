class WeatherModel {
  WeatherModel({
    required this.time,
    required this.values,
  });

  final DateTime? time;
  final Map<String, dynamic> values;

  WeatherModel copyWith({
    DateTime? time,
    Map<String, dynamic>? values,
  }) {
    return WeatherModel(
      time: time ?? this.time,
      values: values ?? this.values,
    );
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      time: DateTime.tryParse(json["time"] ?? ""),
      values: Map.from(json["values"])
          .map((k, v) => MapEntry<String, dynamic>(k, v)),
    );
  }

  Map<String, dynamic> toJson() => {
        "time": time?.toIso8601String(),
        "values":
            Map.from(values).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };

  @override
  String toString() {
    return "$time, $values, ";
  }
}
