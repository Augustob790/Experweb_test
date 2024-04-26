import '../../ data/repositories/auth_repository.dart';
import '../exception/user_exception.dart';
import '../model/user_model.dart';

abstract class GetUserLoginUsecase {
  Future<UserModel> call(String email, String password);
}

class GetUserLoginUsecaseImpl implements GetUserLoginUsecase {
  final AuthRepository repository;

  GetUserLoginUsecaseImpl({required this.repository});

  @override
  Future<UserModel> call(String email, String password) async {
    try {
      return repository.login(email, password);
    } on UserException {
      rethrow;
    }
  }
}
