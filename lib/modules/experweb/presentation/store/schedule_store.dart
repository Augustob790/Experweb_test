// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../domain/model/schedule_model.dart';
import '../../domain/usecases/delete_schedule.dart';
import '../../domain/usecases/get_all_schedule.dart';
import '../../domain/usecases/insert_schedule.dart';
import '../../domain/usecases/update_schedule.dart';

part 'schedule_store.g.dart';

class ScheduleStore = _ScheduleStoreBase with _$ScheduleStore;

abstract class _ScheduleStoreBase with Store {
  final GetAllScheduleUsecase getAllScheduleUsecase;
  final DeleteScheduleUsecase deleteScheduleUsecase;
  final InsertScheduleUsecase insertScheduleUsecase;
  final UpdateScheduleUsecase updateScheduleUsecase;

  _ScheduleStoreBase({
    required this.getAllScheduleUsecase,
    required this.deleteScheduleUsecase,
    required this.insertScheduleUsecase,
    required this.updateScheduleUsecase,
  });

  @action
  dispose() async {
    dateInit = DateTime.now();
    nameController.clear();
    stateController.clear();
    numberController.clear();
    streetController.clear();
    cityController.clear();
    dropdownTimesValue = 'Horários';
  }

  DateTime dateInit = DateTime.now();
  String dropdownTimesValue = 'Horários';
  List<String> times = [
    'Horários',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '14:00',
    '15:00',
    '16:00',
  ];

  @observable
  dynamic errorMessage;

  @observable
  dynamic isLoading;

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController cityController = TextEditingController();

  @observable
  TextEditingController stateController = TextEditingController();

  @observable
  TextEditingController numberController = TextEditingController();

  @observable
  TextEditingController streetController = TextEditingController();

  @observable
  ObservableList<ScheduleModel> scheduleModelList =
      ObservableList<ScheduleModel>();

  @action
  Future<void> insert(ScheduleModel schedule) async {
    isLoading = "isLoading";
    try {
      await insertScheduleUsecase(schedule);
      isLoading = "sucess";
    } catch (e) {
      isLoading = "error";
      throw e.toString();
    }
  }

  @action
  Future<void> getAllPeriods() async {
    isLoading = "isLoading";
    try {
      List<ScheduleModel> schedules = await getAllScheduleUsecase();
      scheduleModelList.clear();
      scheduleModelList.addAll(schedules);
      isLoading = "sucess";
    } catch (e) {
      isLoading = "error";

      throw e.toString();
    }
  }

  @action
  Future<void> update(ScheduleModel schedule) async {
    isLoading = "isLoading";
    try {
      await updateScheduleUsecase(schedule);
      isLoading = "sucess";
    } catch (e) {
      throw e.toString();
    }
  }

  @action
  Future<void> delete(int id) async {
    isLoading = "isLoading";
    try {
      await deleteScheduleUsecase(id);
      isLoading = "sucess";
    } catch (e) {
      isLoading = "error";
      throw e.toString();
    }
  }

  @action
  void initializeInit(DateTime dateTime) async {
    dateInit = dateTime;
  }

  @action
  void onSelectedCategory(String category) {
    dropdownTimesValue = category;
  }
}
