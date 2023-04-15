import 'package:miniplus_report_sample/test_data/report_model.dart';
import 'package:miniplus_report_sample/test_data/user.dart';

// class TestData{

UserModel sampleUserData =UserModel.fromJson(data);
ExerciseData samplePercentData = ExerciseData.fromJson(percentData);
Map<String, dynamic> data = {
  "id": 100000003,
  "second_id": 50,
  "userid": "nochichi",
  "user_name": "노치범",
  "u_password": "4227",
  "rfid": "69fc66cc",
  "email": "nochichi@naver.com",
  "phone": "01046244227",
  "birthday": "1982-08-20",
  "gender": "Male",
  "keypad": "4227",
  "clubs_id": 1000,
  "workout_level": 3,
  "workout_target": 4,
  "seq_schedule": 1,
  "club_name": "Ronfic",
  "profile_url": "http://211.253.30.245/images/profile/100000003.jpg",
  "work_date": "2023-04-12",
  "height": "180.00",
  "weight": "90.00",
  "is_supervisor": 1,
  "is_expert": 0,
  "is_director": 1,
  "reg_date": "2020-02-03 12:13:30",
  "flag": 1
};
Map <String, dynamic>percentData= {
  "total_score": 30,
  "total_grade": "A",
  "comment":"근기능이 아주 좋아요!꾸준히 유지해볼까요",
  "push": {
    "display_rendering_element": "상체 전면 좌:우",
    "part_rendering_element": "L,R",
    "default_force_left":"65",
    "default_force_right":"65",
    "force_data_l": [
      0,
      0,
      0
    ],
    "force_data_r": [
      0,
      0,
      0
    ],
    "force_data_r_reps": [
      10,11,12,13,14
    ],
    "force_data_l_reps": [
      10,11,12,13,14
    ],
    "comparision1": [
      70.5,
      20.5
    ],
    "comparision2": [
      30.5,
      20.5
    ],
    "position": "right",
    "position_kr": "우",
    "percent": 10.5,
    "grade": "good",
    "score": 70
  },
  "pull": {
    "display_rendering_element": "상체 후면 좌:우",
    "part_rendering_element": "L,R",
    "default_force_left":"65",
    "default_force_right":"65",
    "force_data_l": [
      0,
      0,
      0
    ],
    "force_data_r": [
      0,
      0,
      0
    ],
    "force_data_r_reps": [
      10,11,12,13,14
    ],
    "force_data_l_reps": [
      10,11,12,13,14
    ],
    "comparision1": [
      70.5,
      20.5
    ],
    "comparision2": [
      30.5,
      20.5
    ],
    "position": "right",
    "position_kr": "우",
    "percent": 10.5,
    "grade": "good",
    "score": 60
  },
  "rot": {
    "display_rendering_element": "몸통 좌:우",
    "part_rendering_element": "L,R",
    "default_force_left":"65",
    "default_force_right":"65",
    "force_data_l": [
      0,
      0,
      0
    ],
    "force_data_r": [
      0,
      0,
      0
    ],
    "force_data_r_reps": [
      10,11,12,13,14
    ],
    "force_data_l_reps": [
      10,11,12,13,14
    ],
    "comparision1": [
      70.5,
      20.5
    ],
    "comparision2": [
      30.5,
      20.5
    ],
    "position": "right",
    "position_kr": "우",
    "percent": 10.5,
    "grade": "good",
    "score": 95
  },
  "upcode": {
    "display_rendering_element": "상체 전:후",
    "part_rendering_element": "F,B",
    "default_force_left":"65",
    "default_force_right":"65",
    "force_data_l": [
      0,
      0,
      0
    ],
    "force_data_r": [
      0,
      0,
      0
    ],
    "force_data_r_reps": [
      10,11,12,13,14
    ],
    "force_data_l_reps": [
      10,11,12,13,14
    ],
    "comparision1": [
      70.5,
      20.5
    ],
    "comparision2": [
      30.5,
      20.5
    ],
    "position": "right",
    "position_kr": "우",
    "percent": 10.5,
    "grade": "good",
    "score": 80
  },
  "lowcode": {
    "display_rendering_element": "하체 전:후",
    "part_rendering_element": "F,B",
    "default_force_left":"65",
    "default_force_right":"65",
    "force_data_l": [
      0,
      0,
      0
    ],
    "force_data_r": [
      0,
      0,
      0
    ],
    "force_data_r_reps": [
      10,11,12,13,14
    ],
    "force_data_l_reps": [
      10,11,12,13,14
    ],
    "comparision1": [
      70.5,
      20.5
    ],
    "comparision2": [
      30.5,
      20.5
    ],
    "position": "right",
    "position_kr": "우",
    "percent": 10.5,
    "grade": "good",
    "score": 0
  }
};
