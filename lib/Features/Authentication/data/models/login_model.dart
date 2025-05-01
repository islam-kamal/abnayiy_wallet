import 'package:abnayiy_wallet/Shared/Base/network/network-mappers.dart';

class LoginModel extends BaseMappable {
  User? user;
  Guardian? guardian;
  Null? student;
  Null? teacher;
  Null? driver;
  Null? sponsor;
  Null? admin;
  int? type;
  Null? workTime;
  List<Permissions>? userPermissions;
  String? accessToken;
  String? message;
  Token? token;

  LoginModel(
      {this.user,
      this.guardian,
      this.student,
      this.teacher,
      this.driver,
      this.sponsor,
      this.admin,
      this.type,
      this.workTime,
      this.userPermissions,
      this.accessToken,
        this.message,
      this.token});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.guardian != null) {
      data['guardian'] = this.guardian!.toJson();
    }
    data['student'] = this.student;
    data['message'] = this.message;
    data['teacher'] = this.teacher;
    data['driver'] = this.driver;
    data['sponsor'] = this.sponsor;
    data['admin'] = this.admin;
    data['type'] = this.type;
    data['work_time'] = this.workTime;
    if (this.userPermissions != null) {
      data['user_permissions'] =
          this.userPermissions!.map((v) => v.toJson()).toList();
    }
    data['access_token'] = this.accessToken;
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    data['message'] = this.message;

    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    message = json['message'];

    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    guardian = json['guardian'] != null
        ? new Guardian.fromJson(json['guardian'])
        : null;
    student = json['student'];
    teacher = json['teacher'];
    driver = json['driver'];
    sponsor = json['sponsor'];
    admin = json['admin'];
    type = json['type'];
    workTime = json['work_time'];
    if (json['user_permissions'] != null) {
      userPermissions = <Permissions>[];
      json['user_permissions'].forEach((v) {
        userPermissions!.add(new Permissions.fromJson(v));
      });
    }
    accessToken = json['access_token'];
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    return LoginModel(
      accessToken: accessToken,
      admin: admin,
      driver: driver,
      guardian: guardian,
      sponsor: sponsor,
      student: student,
      teacher: teacher,
      token: token,
      type: type,
      user: user,
      userPermissions: userPermissions,
      workTime: workTime,
      message: message
    );
  }
}

class User {
  var id;
  var fullName;
  var fullNameLatin;
  var email;
  var fcmToken;
  var phone;
  var countryId;
  var profilePhotoPath;
  var twoFactorSecret;
  var twoFactorRecoveryCodes;
  var twoFactorConfirmedAt;
  var emailVerifiedAt;
  var active;
  var createdBy;
  var updatedBy;
  var lastLogin;
  var createdAt;
  var updatedAt;
  var deletedAt;
  var viban;
  var resetCode;
  var acceptTermsFlag;
  var type;
  Guardian? guardian;
  var student;
  var teacher;
  var driver;
  var sponsor;
  var admin;
  List<Permissions>? permissions;
  List<Roles>? roles;

  User(
      {this.id,
      this.fullName,
      this.fullNameLatin,
      this.email,
      this.fcmToken,
      this.phone,
      this.countryId,
      this.profilePhotoPath,
      this.twoFactorSecret,
      this.twoFactorRecoveryCodes,
      this.twoFactorConfirmedAt,
      this.emailVerifiedAt,
      this.active,
      this.createdBy,
      this.updatedBy,
      this.lastLogin,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.viban,
      this.resetCode,
      this.acceptTermsFlag,
      this.type,
      this.guardian,
      this.student,
      this.teacher,
      this.driver,
      this.sponsor,
      this.admin,
      this.permissions,
      this.roles});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    fullNameLatin = json['full_name_latin'];
    email = json['email'];
    fcmToken = json['fcm_token'];
    phone = json['phone'];
    countryId = json['country_id'];
    profilePhotoPath = json['profile_photo_path'];
    twoFactorSecret = json['two_factor_secret'];
    twoFactorRecoveryCodes = json['two_factor_recovery_codes'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    emailVerifiedAt = json['email_verified_at'];
    active = json['active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    lastLogin = json['last_login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    viban = json['viban'];
    resetCode = json['reset_code'];
    acceptTermsFlag = json['accept_terms_flag'];
    type = json['type'];
    guardian = json['guardian'] != null
        ? new Guardian.fromJson(json['guardian'])
        : null;
    student = json['student'];
    teacher = json['teacher'];
    driver = json['driver'];
    sponsor = json['sponsor'];
    admin = json['admin'];
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions!.add(v);
      });
    }
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['full_name_latin'] = this.fullNameLatin;
    data['email'] = this.email;
    data['fcm_token'] = this.fcmToken;
    data['phone'] = this.phone;
    data['country_id'] = this.countryId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['two_factor_secret'] = this.twoFactorSecret;
    data['two_factor_recovery_codes'] = this.twoFactorRecoveryCodes;
    data['two_factor_confirmed_at'] = this.twoFactorConfirmedAt;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['active'] = this.active;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['last_login'] = this.lastLogin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['viban'] = this.viban;
    data['reset_code'] = this.resetCode;
    data['accept_terms_flag'] = this.acceptTermsFlag;
    data['type'] = this.type;
    if (this.guardian != null) {
      data['guardian'] = this.guardian!.toJson();
    }
    data['student'] = this.student;
    data['teacher'] = this.teacher;
    data['driver'] = this.driver;
    data['sponsor'] = this.sponsor;
    data['admin'] = this.admin;
    if (this.permissions != null) {
      data['permissions'] = this.permissions!.map((v) => v).toList();
    }
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Guardian {
  var id;
  var nationalId;
  var userId;
  var address;
  var active;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;
  var deletedAt;
  var refund;
  var parentCategoryId;

  Guardian(
      {this.id,
      this.nationalId,
      this.userId,
      this.address,
      this.active,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.refund,
      this.parentCategoryId});

  Guardian.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nationalId = json['national_id'];
    userId = json['user_id'];
    address = json['address'];
    active = json['active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    refund = json['refund'];
    parentCategoryId = json['parent_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['national_id'] = this.nationalId;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['active'] = this.active;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['refund'] = this.refund;
    data['parent_category_id'] = this.parentCategoryId;
    return data;
  }
}

class Roles {
  var id;
  var name;
  var displayName;
  var guardName;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;
  var deletedAt;
  var pivot;
  List<Permissions>? permissions;

  Roles(
      {this.id,
      this.name,
      this.displayName,
      this.guardName,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.pivot,
      this.permissions});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['display_name'];
    guardName = json['guard_name'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions!.add(new Permissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    data['guard_name'] = this.guardName;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.permissions != null) {
      data['permissions'] = this.permissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot {
  String? modelType;
  int? modelId;
  int? roleId;

  Pivot({this.modelType, this.modelId, this.roleId});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelType = json['model_type'];
    modelId = json['model_id'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_type'] = this.modelType;
    data['model_id'] = this.modelId;
    data['role_id'] = this.roleId;
    return data;
  }
}

class Permissions {
  var id;
  var name;
  var displayName;
  var groupName;
  var guardName;
  var createdAt;
  var updatedAt;
  PermissionPivot? permissionPivot;

  Permissions(
      {this.id,
      this.name,
      this.displayName,
      this.groupName,
      this.guardName,
      this.createdAt,
      this.updatedAt,
      this.permissionPivot});

  Permissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['display_name'];
    groupName = json['group_name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    permissionPivot = json['pivot'] != null
        ? new PermissionPivot.fromJson(json['pivot'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    data['group_name'] = this.groupName;
    data['guard_name'] = this.guardName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.permissionPivot != null) {
      data['pivot'] = this.permissionPivot!.toJson();
    }
    return data;
  }
}

class PermissionPivot {
  var roleId;
  var permissionId;

  PermissionPivot({this.roleId, this.permissionId});

  PermissionPivot.fromJson(Map<String, dynamic> json) {
    roleId = json['role_id'];
    permissionId = json['permission_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role_id'] = this.roleId;
    data['permission_id'] = this.permissionId;
    return data;
  }
}

class Token {
  var accessToken;
  InternalToken? token;

  Token({this.accessToken, this.token});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    token = json['token'] != null
        ? new InternalToken.fromJson(json['token'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    return data;
  }
}

class InternalToken {
  var id;
  var userId;
  var clientId;
  var name;
  List<Null>? scopes;
  var revoked;
  var createdAt;
  var updatedAt;
  var expiresAt;

  InternalToken(
      {this.id,
      this.userId,
      this.clientId,
      this.name,
      this.scopes,
      this.revoked,
      this.createdAt,
      this.updatedAt,
      this.expiresAt});

  InternalToken.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clientId = json['client_id'];
    name = json['name'];
    if (json['scopes'] != null) {
      scopes = <Null>[];
      json['scopes'].forEach((v) {
        scopes!.add(v);
      });
    }
    revoked = json['revoked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['client_id'] = this.clientId;
    data['name'] = this.name;
    if (this.scopes != null) {
      data['scopes'] = this.scopes!.map((v) => v).toList();
    }
    data['revoked'] = this.revoked;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['expires_at'] = this.expiresAt;
    return data;
  }
}
