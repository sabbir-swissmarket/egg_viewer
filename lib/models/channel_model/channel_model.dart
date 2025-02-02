import 'package:epg_viewer/models/program_model/program_model.dart';
import 'package:epg_viewer/utils/core.dart';
part 'channel_model.freezed.dart';
part 'channel_model.g.dart';

@freezed
class ChannelModel with _$ChannelModel {
  const factory ChannelModel({
    required String id,
    required String name,
    required String url,
    required String icon,
    required List<ProgramModel> programs,
  }) = _ChannelModel;

  factory ChannelModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelModelFromJson(json);
}
