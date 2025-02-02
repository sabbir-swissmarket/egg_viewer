import 'dart:io';

import 'package:epg_viewer/common_widgets/custom_appbar.dart';
import 'package:epg_viewer/common_widgets/custom_image_view.dart';
import 'package:epg_viewer/common_widgets/loader.dart';
import 'package:epg_viewer/locator/locator.dart';
import 'package:epg_viewer/models/channel_model/channel_model.dart';
import 'package:epg_viewer/routes/routes_name.dart';
import 'package:epg_viewer/screens/home/provider/home_provider.dart';
import 'package:epg_viewer/styles/app_colors.dart';
import 'package:epg_viewer/styles/app_styles.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:epg_viewer/utils/screen_config.dart';
import 'package:flutter/material.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channelData = ref.watch(homeScreenProvider);
    final selectedChannel = useState<ChannelModel?>(null);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: CustomAppBar(
        height: 70,
        isIOS: Platform.isIOS,
        title: "EPG Viewer",
        showLeadingIcon: false,
        centerTitle: true,
      ),
      body: channelData.when(
        data: (channelData) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Channels",
                  style: AppStyles.headline3,
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: _channelListSection(
                    context,
                    channels: channelData,
                    onTap: (value) {
                      selectedChannel.value = value;
                      Navigator.pushNamed(context, RoutesNames.programScreen,
                          arguments: value.programs);
                    },
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: Loader()),
        error: (error, _) => Center(
          child: Text(
            'Error: $error',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }

  Widget _channelListSection(BuildContext context,
      {required List<ChannelModel> channels,
      required Function(ChannelModel value) onTap}) {
    return channels.isNotEmpty
        ? ListView.separated(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: channels.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  onTap(channels[index]);
                },
                child: _channelItem(channel: channels[index]),
              );
            },
          )
        : Center(
            child: Text(
              "No channel available",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
  }

  Widget _channelItem({required ChannelModel channel}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.07),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImageView(
            imageUrl: channel.icon,
            height: 40,
            width: 40,
            radius: 40,
            boxfit: BoxFit.contain,
          ),
          SizedBox(
            width: locator.get<SizeConfig>().getProportionateWidth(60),
            child: Text(
              channel.name,
              style: AppStyles.headline4,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 32,
            color: AppColors.whiteColor,
          )
        ],
      ),
    );
  }
}
