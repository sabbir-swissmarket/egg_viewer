import 'package:epg_viewer/api_services/api_services.dart';
import 'package:epg_viewer/locator/locator.dart';
import 'package:epg_viewer/models/channel_model/channel_model.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:epg_viewer/utils/shared_prefs_keys.dart';
import 'package:epg_viewer/utils/shared_prefs_manager.dart';
import 'package:epg_viewer/utils/utils.dart';
import 'package:flutter/material.dart';

final homeScreenProvider = FutureProvider<List<ChannelModel>>((ref) async {
  final sharedPrefManager = locator.get<SharedPrefManager>();
  final utils = locator.get<Utils>();
  final apiServices = locator.get<ApiServices>();

  final currentTime = DateTime.now().millisecondsSinceEpoch;
  final cachedData =
      await sharedPrefManager.getStringValue(SharedPrefKeys.cacheKey);
  final lastUpdated =
      await sharedPrefManager.getIntValue(SharedPrefKeys.lastUpdatedKey) ?? 0;
  const cacheDuration = 86400000; // 24 hours in milliseconds

  if (cachedData != null && (currentTime - lastUpdated) < cacheDuration) {
    return utils.parseEPG(cachedData);
  }

  try {
    final response = await apiServices.getXMLFileRequest();

    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      final xmlData = response.data;
      await sharedPrefManager.saveStringValue(SharedPrefKeys.cacheKey, xmlData);
      await sharedPrefManager.saveIntValue(
          SharedPrefKeys.lastUpdatedKey, currentTime);
      return utils.parseEPG(xmlData);
    }
  } catch (error) {
    debugPrint("ERROR - $error");
  }

  if (cachedData != null) {
    return utils.parseEPG(cachedData);
  }

  throw Exception('Failed to load EPG data and no cache available');
});
