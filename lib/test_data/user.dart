import 'dart:developer';

class UserModel {
  UserModel({
    required this.id,
    required this.secondId,
    required this.userid,
    required this.userName,
    required this.uPassword,
    required this.rfid,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.keypad,
    required this.clubsId,
    required this.workoutLevel,
    required this.workoutTarget,
    required this.seqSchedule, //--
    required this.clubName,
    required this.profileUrl,
    required this.workDate,
    required this.height,
    required this.weight,
    required this.isSupervisor,
    required this.isExpert,
    required this.isDirector,
    required this.regDate,
    required this.flag,
    this.group,
  });

  int id;
  int secondId;
  String userid;
  String userName;
  String uPassword;
  String rfid;
  String email;
  String phone;
  DateTime birthday;
  String gender;
  String keypad;
  int clubsId;
  int workoutLevel;
  int workoutTarget;
  int seqSchedule;
  String clubName;
  String profileUrl;
  String workDate;
  String height;
  double weight;
  int isSupervisor;
  int isExpert;
  int isDirector;
  String regDate;
  bool flag;
  String? group;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: int.parse("${json["id"] ?? '0'}"),
        secondId: int.parse("${json["second_id"] ?? '0'}"),
        userid: json["userid"] ?? "",
        userName: json["user_name"] ?? "",
        uPassword: json["u_password"] ?? "",
        rfid: json["rfid"] ?? "",
        email: json["email"] ?? "",
        phone: json["phone"] ?? "",
        birthday: DateTime.parse(json["birthday"]),
        gender: json["gender"] ?? "Male",
        keypad: json["keypad"] ?? "",
        clubsId: int.parse("${json["clubs_id"] ?? '0'}"),
        workoutLevel: int.parse("${json["workout_level"] ?? '0'}"),
        workoutTarget: int.parse("${json["workout_target"] ?? '0'}"),
        seqSchedule: int.parse("${json["seq_schedule"] ?? '0'}"),
        clubName: json["club_name"] ?? "Ronfic",
        profileUrl: json["profile_url"] ?? "",
        workDate: json["work_date"] ?? "",
        height: json["height"] ?? "",
        weight: double.parse(json["weight"] ?? "0"),
        isSupervisor: int.parse("${json["is_supervisor"] ?? '0'}"),
        isExpert: int.parse("${json["is_expert"] ?? '0'}"),
        isDirector: int.parse("${json["is_director"] ?? '0'}"),
        regDate: json["reg_date"] ?? "",
        flag: json["flag"].toString() == '1' ? true : false,
        group: hangulChosung(json["user_name"].toString()),
      );

  @override
  String toString() {
    return 'UserInformation: userid: $userid, id:$id userName: $userName, clubName: $clubName, group: $group';
  }
}

String hangulChosung(String mtext) {
  var rCho = [
    "ㄱ",
    "ㄲ",
    "ㄴ",
    "ㄷ",
    "ㄸ",
    "ㄹ",
    "ㅁ",
    "ㅂ",
    "ㅃ",
    "ㅅ",
    "ㅆ",
    "ㅇ",
    "ㅈ",
    "ㅉ",
    "ㅊ",
    "ㅋ",
    "ㅌ",
    "ㅍ",
    "ㅎ"
  ];
  double cho, jung, jong;
  try {
    var nTmp = mtext.codeUnitAt(0);
    if (nTmp >= int.parse("AC00", radix: 16) &&
        nTmp <= int.parse("D7A3", radix: 16)) {
      nTmp = nTmp - 0xAC00;
      jong = nTmp.toDouble() % 28; // 종성
      jung = ((nTmp.toDouble() - jong) / 28) % 21; // 중성
      cho = (((nTmp.toDouble() - jong) / 28) - jung) / 21; // 초성
      return rCho[cho.toInt()];
    }
    if (nTmp >= int.parse("41", radix: 16) &&
        nTmp <= int.parse("7A", radix: 16)) {
      return String.fromCharCode(nTmp).toUpperCase();
    }
    return "?";
  } catch (e) {
    log("ronficzoneError: $e");
    return "?";
  }
}
