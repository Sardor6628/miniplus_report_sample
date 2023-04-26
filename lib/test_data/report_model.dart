class ExerciseData {
  int? totalScore;
  String? comment;
  PushPullRot? push;
  PushPullRot? pull;
  PushPullRot? rot;
  PushPullRot? upcode;
  PushPullRot? lowcode;

  ExerciseData({
    this.totalScore,
    this.comment,
    this.push,
    this.pull,
    this.rot,
    this.upcode,
    this.lowcode,
  });

  factory ExerciseData.fromJson(Map<String, dynamic> json) {
    try {
      return ExerciseData(
        totalScore: json['score'],
        comment: json['grade_comment'],
        push: json['push'] != null ? PushPullRot.fromJson(json['push']) : null,
        pull: json['pull'] != null ? PushPullRot.fromJson(json['pull']) : null,
        rot: json['rot'] != null ? PushPullRot.fromJson(json['rot']) : null,
        upcode: json['upcode'] != null
            ? PushPullRot.fromJson(json['upcode'])
            : null,
        lowcode: json['lowcode'] != null
            ? PushPullRot.fromJson(json['lowcode'])
            : null,
      );
    } catch (e) {
      // Print the error and return a default instance of ExerciseData
      print('Error parsing JSON data: $e');
      return ExerciseData(
          totalScore: 0,
          comment: '',
          push: null,
          pull: null,
          rot: null,
          upcode: null,
          lowcode: null);
    }
  }

  @override
  String toString() {
    return 'ExerciseData{totalScore: $totalScore, comment: $comment, push: $push, pull: $pull, rot: $rot, upcode: $upcode, lowcode: $lowcode}';
  }
}

class PushPullRot {
  String? displayRenderingElement;
  String? partRenderingElement;
  int? defaultForceLeft;
  int? defaultForceRight;
  List<double>? forceDataL;
  List<double>? forceDataR;
  List<double>? forceDataRReps;
  List<double>? forceDataLReps;
  List<num>? comparision1;
  List<num>? comparision2;
  String? position;
  String? positionKr;
  double? percent;
  String? grade;
  int? score;
  DateTime? measureDate = DateTime.now();
  DateTime? defaultDate = DateTime.now();

  PushPullRot({
    this.displayRenderingElement,
    this.partRenderingElement,
    this.defaultForceLeft,
    this.defaultForceRight,
    this.forceDataL,
    this.forceDataR,
    this.forceDataRReps,
    this.forceDataLReps,
    this.comparision1,
    this.comparision2,
    this.position,
    this.positionKr,
    this.percent,
    this.grade,
    this.score,
    this.defaultDate,
    this.measureDate,
  });

  PushPullRot.fromJson(Map<String, dynamic> json) {
    displayRenderingElement = json['display_rendering_element'];
    partRenderingElement = json['part_rendering_element'];
    percent = json['percent']?.toDouble() ?? -99;
    defaultForceLeft = json['default_force_left'] ?? 0;
    defaultDate =
        DateTime.parse(json['default_date']?.toString() ?? "${DateTime.now()}");
    measureDate =
        DateTime.parse(json['measure_date']?.toString() ?? "${DateTime.now()}");
    defaultForceRight = json['default_force_right'] ?? 0;
    grade = json['grade']?.toString() ?? "";
    position = json['position']?.toString() ?? "";
    positionKr = json['position_kr']?.toString() ?? "";
    try {
      comparision2 = List<num>.from(json['comparison2']);
    } catch (e) {
      comparision2 = [0,0];
    }
    try {
      comparision1 = List<num>.from(json['comparison1']);
    } catch (e) {
      comparision1 = [0,0];
    }
    try {
      forceDataL = List<double>.from(json['force_data_l']);
    } catch (e) {
      forceDataL = [];
    }

    try {
      forceDataLReps = List<double>.from(json['force_data_l_reps']);
    } catch (e) {
      forceDataLReps = [];
    }

    try {
      forceDataR = List<double>.from(json['force_data_r']);
    } catch (e) {
      forceDataR = [];
    }

    try {
      forceDataRReps = List<double>.from(json['force_data_r_reps']);
    } catch (e) {
      forceDataRReps = [];
    }
  }

  @override
  String toString() {
    return 'PushPullRot{displayRenderingElement: $displayRenderingElement, partRenderingElement: $partRenderingElement, defaultForceLeft: $defaultForceLeft, defaultForceRight: $defaultForceRight, forceDataL: $forceDataL, forceDataR: $forceDataR, forceDataRReps: $forceDataRReps, forceDataLReps: $forceDataLReps, comparision1: $comparision1, comparision2: $comparision2, position: $position, positionKr: $positionKr, percent: $percent, grade: $grade, score: $score, measureDate: $measureDate, defaultDate: $defaultDate}';
  }
}
