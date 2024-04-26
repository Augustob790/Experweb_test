import 'package:experweb_app/modules/auth/domain/model/user_model.dart';

import '../../ data/repositories/auth_repository.dart';
import '../exception/user_exception.dart';


abstract class CheckDataUserUsecase {
  Future<UserModel> call();
}

class CheckDataUserUsecaseImpl implements CheckDataUserUsecase {
  final AuthRepository repository;

  CheckDataUserUsecaseImpl({required this.repository});

  @override
  Future<UserModel> call() async {
    try {
      return repository.checkDataSave();
    } on UserException {
      rethrow;
    }
  }
}
