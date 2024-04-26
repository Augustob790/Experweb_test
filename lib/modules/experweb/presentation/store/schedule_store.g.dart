// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScheduleStore on _ScheduleStoreBase, Store {
  late final _$errorMessageAtom =
      Atom(name: '_ScheduleStoreBase.errorMessage', context: context);

  @override
  dynamic get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(dynamic value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ScheduleStoreBase.isLoading', context: context);

  @override
  dynamic get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(dynamic value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$nameControllerAtom =
      Atom(name: '_ScheduleStoreBase.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$cityControllerAtom =
      Atom(name: '_ScheduleStoreBase.cityController', context: context);

  @override
  TextEditingController get cityController {
    _$cityControllerAtom.reportRead();
    return super.cityController;
  }

  @override
  set cityController(TextEditingController value) {
    _$cityControllerAtom.reportWrite(value, super.cityController, () {
      super.cityController = value;
    });
  }

  late final _$stateControllerAtom =
      Atom(name: '_ScheduleStoreBase.stateController', context: context);

  @override
  TextEditingController get stateController {
    _$stateControllerAtom.reportRead();
    return super.stateController;
  }

  @override
  set stateController(TextEditingController value) {
    _$stateControllerAtom.reportWrite(value, super.stateController, () {
      super.stateController = value;
    });
  }

  late final _$numberControllerAtom =
      Atom(name: '_ScheduleStoreBase.numberController', context: context);

  @override
  TextEditingController get numberController {
    _$numberControllerAtom.reportRead();
    return super.numberController;
  }

  @override
  set numberController(TextEditingController value) {
    _$numberControllerAtom.reportWrite(value, super.numberController, () {
      super.numberController = value;
    });
  }

  late final _$streetControllerAtom =
      Atom(name: '_ScheduleStoreBase.streetController', context: context);

  @override
  TextEditingController get streetController {
    _$streetControllerAtom.reportRead();
    return super.streetController;
  }

  @override
  set streetController(TextEditingController value) {
    _$streetControllerAtom.reportWrite(value, super.streetController, () {
      super.streetController = value;
    });
  }

  late final _$scheduleModelListAtom =
      Atom(name: '_ScheduleStoreBase.scheduleModelList', context: context);

  @override
  ObservableList<ScheduleModel> get scheduleModelList {
    _$scheduleModelListAtom.reportRead();
    return super.scheduleModelList;
  }

  @override
  set scheduleModelList(ObservableList<ScheduleModel> value) {
    _$scheduleModelListAtom.reportWrite(value, super.scheduleModelList, () {
      super.scheduleModelList = value;
    });
  }

  late final _$disposeAsyncAction =
      AsyncAction('_ScheduleStoreBase.dispose', context: context);

  @override
  Future dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$insertAsyncAction =
      AsyncAction('_ScheduleStoreBase.insert', context: context);

  @override
  Future<void> insert(ScheduleModel schedule) {
    return _$insertAsyncAction.run(() => super.insert(schedule));
  }

  late final _$getAllPeriodsAsyncAction =
      AsyncAction('_ScheduleStoreBase.getAllPeriods', context: context);

  @override
  Future<void> getAllPeriods() {
    return _$getAllPeriodsAsyncAction.run(() => super.getAllPeriods());
  }

  late final _$updateAsyncAction =
      AsyncAction('_ScheduleStoreBase.update', context: context);

  @override
  Future<void> update(ScheduleModel schedule) {
    return _$updateAsyncAction.run(() => super.update(schedule));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_ScheduleStoreBase.delete', context: context);

  @override
  Future<void> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  late final _$initializeInitAsyncAction =
      AsyncAction('_ScheduleStoreBase.initializeInit', context: context);

  @override
  Future<void> initializeInit(DateTime dateTime) {
    return _$initializeInitAsyncAction
        .run(() => super.initializeInit(dateTime));
  }

  late final _$_ScheduleStoreBaseActionController =
      ActionController(name: '_ScheduleStoreBase', context: context);

  @override
  void addEvents(String data) {
    final _$actionInfo = _$_ScheduleStoreBaseActionController.startAction(
        name: '_ScheduleStoreBase.addEvents');
    try {
      return super.addEvents(data);
    } finally {
      _$_ScheduleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSelectedCategory(String category) {
    final _$actionInfo = _$_ScheduleStoreBaseActionController.startAction(
        name: '_ScheduleStoreBase.onSelectedCategory');
    try {
      return super.onSelectedCategory(category);
    } finally {
      _$_ScheduleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isLoading: ${isLoading},
nameController: ${nameController},
cityController: ${cityController},
stateController: ${stateController},
numberController: ${numberController},
streetController: ${streetController},
scheduleModelList: ${scheduleModelList}
    ''';
  }
}
