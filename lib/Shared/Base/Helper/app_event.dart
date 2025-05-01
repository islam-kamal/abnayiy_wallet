


import 'package:abnayiy_wallet/Features/Authentication/domain/entities/login_entity.dart';

abstract class AppEvent {}

class logoutClickEvent extends AppEvent{}
class loginClickEvent extends AppEvent{
  LoginEntity? loginEntity;
  loginClickEvent({this.loginEntity});
}

class CreateAdmissionRequestEvent extends AppEvent{}

class UpdateAdmissionRequestEvent extends AppEvent{}


class BookAppointmentEvent extends AppEvent{}
class CreateFinancialPlanEvent extends AppEvent{}

class GetSonsEvent extends AppEvent{
  GetSonsEvent();
}

class GetAdmissionRequestsEvent extends AppEvent{
  GetAdmissionRequestsEvent();
}
class GetWithdrawalRequestsEvent extends AppEvent{
  GetWithdrawalRequestsEvent();
}

class GetStudentDataEvent extends AppEvent{}

class CreateWithdrawalRequestEvent extends AppEvent{}

class GetStudentFinancialBillEvent extends AppEvent{}