

import 'package:abnayiy_wallet/Shared/Base/network/network-mappers.dart';

abstract class AppState {
  get model =>null;
}
class Start extends AppState{
}

class Loading extends AppState{}

class Done extends AppState{
  final String? token;
  Done({this.token});
}

class ErrorLoading extends AppState{
  final String? message;
  ErrorLoading({this.message});
}

class SonLoading extends AppState{}

class SonDoneState extends AppState{
  Mappable? model;
  final String? indicator;
  SonDoneState({this.model , this.indicator});

  @override
  String toString() {
    return indicator!;
  }

}

class SonErrorLoadingState extends AppState{
  Mappable? model;
  String? indicator;
  String? message;
  SonErrorLoadingState({this.model,this.message,this.indicator});
  @override
  String toString() {
    return message!;
  }
}


class AdmissionRequestsLoading extends AppState{}

class AdmissionRequestsDoneState extends AppState{
  Mappable? model;
  final String? indicator;
  AdmissionRequestsDoneState({this.model , this.indicator});

  @override
  String toString() {
    return indicator!;
  }

}

class AdmissionRequestsErrorLoadingState extends AppState{
  Mappable? model;
  String? indicator;
  String? message;
  AdmissionRequestsErrorLoadingState({this.model,this.message,this.indicator});
  @override
  String toString() {
    return message!;
  }
}



class StudentDataLoading extends AppState{}

class StudentDataDoneState extends AppState{
  Mappable? model;
  final String? indicator;
  StudentDataDoneState({this.model , this.indicator});

  @override
  String toString() {
    return indicator!;
  }

}

class StudentDataErrorLoadingState extends AppState{
  Mappable? model;
  String? indicator;
  String? message;
  StudentDataErrorLoadingState({this.model,this.message,this.indicator});
  @override
  String toString() {
    return message!;
  }
}



//Create Admission Requests
class CreateAdmissionRequestLoading extends AppState{}

class CreateAdmissionRequestDone extends AppState{
  CreateAdmissionRequestDone();
}

class CreateAdmissionRequestErrorLoading extends AppState{
  final String? message;
  CreateAdmissionRequestErrorLoading({this.message});
}



//Update Admission Requests
class UpdateAdmissionRequestLoading extends AppState{}

class UpdateAdmissionRequestDone extends AppState{
  UpdateAdmissionRequestDone();
}

class UpdateAdmissionRequestErrorLoading extends AppState{
  final String? message;
  UpdateAdmissionRequestErrorLoading({this.message});
}


//Financial Plan
class FinancialPlanLoading extends AppState{}

class FinancialPlanDone extends AppState{
  FinancialPlanDone();
}

class FinancialPlanErrorLoading extends AppState{
  final String? message;
  FinancialPlanErrorLoading({this.message});
}


//Book Appointment
class BookAppointmentLoading extends AppState{}

class BookAppointmentDone extends AppState{
  BookAppointmentDone();
}

class BookAppointmentErrorLoading extends AppState{
  final String? message;
  BookAppointmentErrorLoading({this.message});
}


//Withdrawal Request
class CreateWithdrawalRequestLoading extends AppState{}

class CreateWithdrawalRequestDone extends AppState{
  CreateWithdrawalRequestDone();
}

class CreateWithdrawalRequestErrorLoading extends AppState{
  final String? message;
  CreateWithdrawalRequestErrorLoading({this.message});
}


// withdrawal requests
class WithdrawalRequestLoading extends AppState{}

class WithdrawalRequestDone extends AppState{
  Mappable? model;
  final String? indicator;
  WithdrawalRequestDone({this.model , this.indicator});

  @override
  String toString() {
    return indicator!;
  }

}

class WithdrawalRequestErrorLoading extends AppState{
  final String? message;
  WithdrawalRequestErrorLoading({this.message});
}

class StudentFinancialBillLoading extends AppState{}

class StudentFinancialBillDoneState extends AppState{
  Mappable? model;
  final String? indicator;
  StudentFinancialBillDoneState({this.model , this.indicator});

  @override
  String toString() {
    return indicator!;
  }

}

class StudentFinancialBillErrorLoadingState extends AppState{
  Mappable? model;
  String? indicator;
  String? message;
  StudentFinancialBillErrorLoadingState({this.model,this.message,this.indicator});
  @override
  String toString() {
    return message!;
  }
}
