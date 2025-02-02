import 'package:epg_viewer/helper/enum_data.dart';
import 'package:epg_viewer/locator/locator.dart';
import 'package:epg_viewer/models/program_model/program_model.dart';
import 'package:epg_viewer/utils/utils.dart';

class ProgramUtils {
  /// Search program function
  List<ProgramModel> searchPrograms(List<ProgramModel> args,
      List<ProgramModel> programList, String text, SortOrder sortOrder) {
    List<ProgramModel> programs = [];
    if (sortOrder == SortOrder.none) {
      programs = args;
    } else {
      programs = programList;
    }
    if (text.isNotEmpty) {
      final result = programs
          .where((element) =>
              element.title.toLowerCase().contains(text.toLowerCase()))
          .toList();
      if (result.isNotEmpty) {
        return result;
      }
    }
    return [];
  }

  /// Sort programs by newest to oldest or oldest to newest
  List<ProgramModel> sortPrograms(
      List<ProgramModel> args, SortOrder sortOrder) {
    final utils = locator.get<Utils>();
    return List.from(args)
      ..sort((a, b) {
        final aDate = utils.convertToUTC(a.startTime);
        final bDate = utils.convertToUTC(b.startTime);
        return sortOrder == SortOrder.newestToOldest
            ? bDate.compareTo(aDate)
            : aDate.compareTo(bDate);
      });
  }

  /// Filter program by date
  List<ProgramModel> filterProgramsByDate(
      List<ProgramModel> args, DateTime selectedDate) {
    return args.where((program) {
      final utils = locator.get<Utils>();
      final programDate = utils.convertToUTC(program.startTime).toLocal();
      return programDate.year == selectedDate.year &&
          programDate.month == selectedDate.month &&
          programDate.day == selectedDate.day;
    }).toList();
  }
}
