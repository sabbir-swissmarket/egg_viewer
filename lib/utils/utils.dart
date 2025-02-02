import 'package:epg_viewer/models/channel_model/channel_model.dart';
import 'package:epg_viewer/models/program_model/program_model.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:flutter/material.dart';

class Utils {
  /// Parse XML File
  List<ChannelModel> parseEPG(String xmlData) {
    var channelsMap = <String, ChannelModel>{};

    try {
      final document = XmlDocument.parse(xmlData);

      for (var element
          in document.rootElement.children.whereType<XmlElement>()) {
        if (element.name.local == 'channel') {
          /// Parse channel
          final channelId = element.getAttribute('id')!;
          final channelName =
              element.findElements('display-name').first.innerText;
          final channelIcon =
              element.findElements('icon').firstOrNull?.getAttribute('src') ??
                  '';
          final channelUrl =
              element.findElements('url').firstOrNull?.innerText ?? '';

          channelsMap[channelId] = ChannelModel(
            id: channelId,
            name: channelName,
            url: channelUrl,
            icon: channelIcon,
            programs: [],
          );
        } else if (element.name.local == 'programme') {
          /// Parse program
          final channelId = element.getAttribute('channel') ?? "";
          final title =
              element.findElements('title').firstOrNull?.innerText ?? '';
          final description =
              element.findElements('desc').firstOrNull?.innerText ?? '';
          final startTime = element.getAttribute('start') ?? "";
          final endTime = element.getAttribute('stop') ?? "";

          final program = ProgramModel(
            channel: channelId,
            title: title,
            description: description,
            startTime: startTime,
            endTime: endTime,
          );

          /// Assign program to respective channel
          if (channelsMap.containsKey(channelId)) {
            channelsMap[channelId] = channelsMap[channelId]!.copyWith(
              programs: [...channelsMap[channelId]!.programs, program],
            );
          }
        }
      }
    } catch (e) {
      debugPrint('XML parsing error: $e');
    }

    return channelsMap.values.toList();
  }

  /// Show toast messages
  void showToast(String message, bool isError, bool isIOS) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: isIOS ? ToastGravity.TOP : ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: isError ? Colors.red[900] : Colors.grey[700],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  /// Convert time to UTC Timestamp
  DateTime convertToUTC(String time) {
    String datePart = time.substring(0, 8);
    String timePart = time.substring(8, 14);
    String timezonePart = time.substring(15);

    String isoFormat = "${datePart}T$timePart$timezonePart";

    DateTime localDateTime = DateTime.parse(isoFormat);

    DateTime utcDateTime = localDateTime.toUtc();

    return utcDateTime;
  }

  /// Get formatted date time for individual chat
  String getFormattedDate(DateTime date) {
    DateTime sendingDate = date.toLocal();
    DateFormat formatter = DateFormat('d MMM, y');
    String formatted = formatter.format(sendingDate);
    return formatted;
  }

  /// Get formatted time
  String getFormattedTime(DateTime dateTime) {
    DateTime time = dateTime.toLocal();
    DateFormat formatter = DateFormat('h:mma');
    String formattedTime = formatter.format(time);
    return formattedTime;
  }

  /// Check the date is past
  bool isDatePast(DateTime date) {
    DateTime currentDate = DateTime.now();
    return date.isBefore(currentDate);
  }
}
