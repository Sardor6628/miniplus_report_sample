class ExerciseData {
  int? totalScore;
  String? totalGrade;
  String? comment;
  PushPullRot? push;
  PushPullRot? pull;
  PushPullRot? rot;
  PushPullRot? upcode;
  PushPullRot? lowcode;

  ExerciseData({
    this.totalScore,
    this.totalGrade,
    this.comment,
    this.push,
    this.pull,
    this.rot,
    this.upcode,
    this.lowcode,
  });

  factory ExerciseData.fromJson(Map<String, dynamic> json) {
    return ExerciseData(
      totalScore: json['total_score'],
      totalGrade: json['total_grade'],
      comment: json['comment'],
      push: json['push'] != null ? PushPullRot.fromJson(json['push']) : null,
      pull: json['pull'] != null ? PushPullRot.fromJson(json['pull']) : null,
      rot: json['rot'] != null ? PushPullRot.fromJson(json['rot']) : null,
      upcode: json['upcode'] != null ? PushPullRot.fromJson(json['upcode']) : null,
      lowcode: json['lowcode'] != null ? PushPullRot.fromJson(json['lowcode']) : null,
    );
  }
}

class PushPullRot {
  String? displayRenderingElement;
  String? partRenderingElement;
  String? defaultForceLeft;
  String? defaultForceRight;
  List<int>? forceDataL;
  List<int>? forceDataR;
  List<int>? forceDataRReps;
  List<int>? forceDataLReps;
  List<double>? comparision1;
  List<double>? comparision2;
  String? position;
  String? positionKr;
  double? percent;
  String? grade;
  int? score;
  DateTime date;

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
    required this.date,
  });

  factory PushPullRot.fromJson(Map<String, dynamic> json) {
    return PushPullRot(
      displayRenderingElement: json['display_rendering_element'] ?? 'Unknown',
      partRenderingElement: json['part_rendering_element'] ?? 'Unknown',
      defaultForceLeft: json['default_force_left'] ?? 'Unknown',
      defaultForceRight: json['default_force_right'] ?? 'Unknown',
      forceDataL: (json['force_data_l'] as List?)?.cast<int>(),
      forceDataR: (json['force_data_r'] as List?)?.cast<int>(),
      forceDataRReps: (json['force_data_r_reps'] as List?)?.cast<int>(),
      forceDataLReps: (json['force_data_l_reps'] as List?)?.cast<int>(),
      comparision1: (json['comparision1'] as List?)?.cast<double>(),
      comparision2: (json['comparision2'] as List?)?.cast<double>(),
      position: json['position'] ?? 'Unknown',
      positionKr: json['position_kr'] ?? 'Unknown',
      percent: json['percent']?.toDouble(),
      grade: json['grade'] ?? 'Unknown',
      score: json['score']??0,
      date: DateTime.now(),
    );
  }
}