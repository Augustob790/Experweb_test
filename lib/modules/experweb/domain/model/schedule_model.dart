class ScheduleModel {
  int? id;
  final String scheduleTo;
  final String dateSchedule;
  final String victimName;
  final int professionalId;
  final String city;
  final String state;
  final String street;
  final String number;

  ScheduleModel( {
    this.id,
    required this.dateSchedule,
    required this.scheduleTo,
    required this.victimName,
    required this.professionalId,
    required this.city,
    required this.state,
    required this.street,
    required this.number,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'],
      victimName: json['victimName'] ?? "",
      dateSchedule:json['dateSchedule'] ?? "",
      scheduleTo: json['scheduleTo'] ?? "",
      professionalId: json['professionalId'] ?? 0,
      city: json['city'] ?? "",
      state: json['state'] ?? "",
      street: json['street'] ?? "",
      number: json['number'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'scheduleTo': scheduleTo,
      'victimName': victimName,
      'dateSchedule': dateSchedule,
      'professionalId': professionalId,
      'city': city,
      'state': state,
      'street': street,
      'number': number,
    };
  }
}
