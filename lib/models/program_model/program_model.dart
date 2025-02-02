import 'package:epg_viewer/utils/core.dart';
part 'program_model.freezed.dart';
part 'program_model.g.dart';

@freezed
class ProgramModel with _$ProgramModel {
  const factory ProgramModel({
    required String channel,
    required String title,
    required String startTime,
    required String endTime,
    required String description,
  }) = _ProgramModel;

  factory ProgramModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramModelFromJson(json);
}
