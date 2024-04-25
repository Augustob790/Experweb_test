// ignore_for_file: file_names

class ScheduleException implements Exception {
  final String message;

  ScheduleException({required this.message});

  ScheduleException.generic()
      : message = 'Não foi possivel acessar o banco de dados.';
}
