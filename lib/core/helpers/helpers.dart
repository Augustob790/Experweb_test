import '../../modules/experweb/domain/model/user_model.dart';

class Helpers {
  static final monthsName = {
    1: 'Janeiro 2024',
    2: 'Fevereiro 2024',
    3: 'Março 2024',
    4: 'Abril 2024',
    5: 'Maio 2024',
    6: 'Junho 2024',
    7: 'Julho 2024',
    8: 'Agosto 2024',
    9: 'Setembro 2024',
    10: 'Outubro 2024',
    11: 'Novembro 2024',
    12: 'Dezembro 2024',
  };

  static final List<User> user = [
    User(
      horario: "14:00",
      nome: 'Augusto Batista',
      rua: 'Rua X',
      estado: 'Tocantins',
      cidade: 'Palmas',
      numero: 10,
    ),
    User(
      horario: "14:30",
      nome: 'José Bezerra',
      rua: 'Rua Z',
      estado: 'Tocantins',
      cidade: 'Palmas',
      numero: 11,
    ),
    User(
      horario: "15:00",
      nome: 'Mateus Souza',
      rua: 'Rua Y',
      estado: 'Tocantins',
      cidade: 'Palmas',
      numero: 12,
    ),
    User(
      horario: "15:30",
      nome: 'Daniel Becker',
      rua: 'Rua A',
      estado: 'Tocantins',
      cidade: 'Palmas',
      numero: 13,
    ),
  ];
}
