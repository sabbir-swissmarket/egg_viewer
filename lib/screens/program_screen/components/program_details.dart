import 'package:epg_viewer/locator/locator.dart';
import 'package:epg_viewer/models/program_model/program_model.dart';
import 'package:epg_viewer/services/notification_services.dart';
import 'package:epg_viewer/styles/app_colors.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:epg_viewer/utils/screen_config.dart';
import 'package:epg_viewer/utils/utils.dart';
import 'package:flutter/material.dart';

class ProgramDetails extends ConsumerWidget {
  const ProgramDetails({super.key, required this.program});
  final ProgramModel program;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utils = locator.get<Utils>();
    DateTime startTime = utils.convertToUTC(program.startTime);
    DateTime endTime = utils.convertToUTC(program.endTime);
    bool isDatePast = utils.isDatePast(startTime);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(32, 12, 32, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildButtons(
            alignment: Alignment.centerRight,
            icon: Icons.close,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: locator.get<SizeConfig>().getProportionateWidth(65),
                child: _buildTitleSection(context, program.title,
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              isDatePast
                  ? const SizedBox.shrink()
                  : _buildButtons(
                      icon: Icons.alarm_add,
                      onPressed: () {
                        locator
                            .get<NotificationServices>()
                            .scheduleNotification(program);
                      },
                    ),
            ],
          ),
          const SizedBox(height: 24),
          _buildTitleSection(context, "Program Details:",
              style: Theme.of(context).textTheme.headlineSmall),
          Text(program.description,
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 12),
          _buildTimeInfo(context, "Start Date & Time",
              "${utils.getFormattedDate(startTime)} ${utils.getFormattedTime(startTime)}"),
          _buildTimeInfo(context, "End Date & Time",
              "${utils.getFormattedDate(endTime)} ${utils.getFormattedTime(endTime)}"),
        ],
      ),
    );
  }

  Widget _buildButtons(
      {AlignmentGeometry? alignment,
      required Function()? onPressed,
      IconData? icon}) {
    return Container(
      alignment: alignment,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 32,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }

  Widget _buildTitleSection(BuildContext context, String title,
      {TextStyle? style}) {
    return Text(
      title,
      style: style,
    );
  }

  Widget _buildTimeInfo(BuildContext context, String label, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        "$label: $time",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
