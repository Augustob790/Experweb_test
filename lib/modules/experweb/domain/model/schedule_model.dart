class Schedule {
  final String id;
  final DateTime scheduleTo;
  final String assessment;
  final String victimName;
  final int professionalId;
  final String city;
  final String state;
  final String street;
  final int number;

  Schedule({
    required this.id,
    required this.scheduleTo,
    required this.assessment,
    required this.victimName,
    required this.professionalId,
    required this.city,
    required this.state,
    required this.street,
    required this.number,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'] ?? "",
      scheduleTo: DateTime.parse(json['schedule_to']),
      assessment: json['assessment'] ?? "",
      victimName: json['victim_name'] ?? "",
      professionalId: json['professional_id'] ?? "",
      city: json['city'] ?? "",
      state: json['state'] ?? "",
      street: json['street'] ?? "",
      number: json['number'] ?? "",
    );
  }
}
