import 'dart:io';

import 'package:epg_viewer/common_widgets/custom_alert_dialog.dart';
import 'package:epg_viewer/common_widgets/custom_appbar.dart';
import 'package:epg_viewer/helper/debouncer.dart';
import 'package:epg_viewer/helper/enum_data.dart';
import 'package:epg_viewer/locator/locator.dart';
import 'package:epg_viewer/models/program_model/program_model.dart';
import 'package:epg_viewer/screens/program_screen/components/program_details.dart';
import 'package:epg_viewer/screens/program_screen/utils/program_utils.dart';
import 'package:epg_viewer/styles/app_colors.dart';
import 'package:epg_viewer/styles/app_styles.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:epg_viewer/utils/global_keys.dart';
import 'package:epg_viewer/utils/screen_config.dart';
import 'package:flutter/material.dart';

class ProgramScreen extends StatefulHookConsumerWidget {
  const ProgramScreen({super.key});

  @override
  ConsumerState<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends ConsumerState<ProgramScreen> {
  late List<ProgramModel> args;
  final sizeConfig = locator.get<SizeConfig>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as List<ProgramModel>;
  }

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final programList = useState<List<ProgramModel>>([]);
    final searchText = useState<String>("");
    final sortingOrder = useState<SortOrder>(SortOrder.none);
    final selectedDate = useState<DateTime>(DateTime.now());
    final programUtils = locator.get<ProgramUtils>();

    useEffect(() {
      final debouncer = Debouncer(milliseconds: 300);
      if (!debouncer.isActive) {
        programList.value = programUtils.searchPrograms(
            args, programList.value, searchText.value, sortingOrder.value);
      }
      debouncer.run(() {});

      return () {
        debouncer.dispose();
      };
    }, [searchText.value]);

    useEffect(() {
      if (sortingOrder.value != SortOrder.filterByDate) {
        programList.value = programUtils.sortPrograms(args, sortingOrder.value);
      } else {
        programList.value =
            programUtils.filterProgramsByDate(args, selectedDate.value);
      }
      return null;
    }, [sortingOrder.value, selectedDate.value]);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: CustomAppBar(
        height: 70,
        isIOS: Platform.isIOS,
        title: "Programs",
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _searchSection(
                    context,
                    searchController: searchController,
                    onChanged: (value) {
                      searchText.value = value;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _displayAlertDialog(
                      context,
                      ref,
                      sortingOrder: sortingOrder,
                      selectedDate: selectedDate,
                    );
                  },
                  icon: const Icon(
                    Icons.filter_alt,
                    color: AppColors.whiteColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Expanded(
              child: _programListSection(
                context,
                programs: searchText.value.isEmpty
                    ? sortingOrder.value == SortOrder.none
                        ? args
                        : programList.value
                    : programList.value,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchSection(BuildContext context,
      {required TextEditingController searchController,
      required Function(String)? onChanged}) {
    return TextField(
      controller: searchController,
      cursorColor: AppColors.whiteColor,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.cardColor,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        hintText: 'Search Programs',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: onChanged,
    );
  }

  Widget _programListSection(BuildContext context,
      {required List<ProgramModel> programs}) {
    return programs.isNotEmpty
        ? ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: programs.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return _programItem(context, program: programs[index]);
            },
          )
        : Center(
            child: Text(
              "No program available",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
  }

  Widget _programItem(BuildContext context, {required ProgramModel program}) {
    return GestureDetector(
      onTap: () {
        _showBottomSheet(context, program: program);
      },
      child: Container(
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
            SizedBox(
              width: sizeConfig.getProportionateWidth(60),
              child: Text(
                program.title,
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
      ),
    );
  }

  _displayAlertDialog(BuildContext context, WidgetRef ref,
      {required ValueNotifier<SortOrder> sortingOrder,
      required ValueNotifier<DateTime?> selectedDate}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          alignment: FractionalOffset.center,
          contentPadding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          content: SizedBox(
            height: sizeConfig.getFullHeight() * 0.4,
            width: sizeConfig.getProportionateWidth(70),
            child: _sortingSection(context,
                sortingOrder: sortingOrder, selectedDate: selectedDate),
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        sortingOrder.value = value;
      }
    });
  }

  Widget _sortingSection(BuildContext context,
      {required ValueNotifier<SortOrder> sortingOrder,
      required ValueNotifier<DateTime?> selectedDate}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        _sortingWidgets(
          context,
          text: "Newest to Oldest",
          icon: Icons.sort_by_alpha,
          onTap: () {
            Navigator.pop(context, SortOrder.newestToOldest);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        _sortingWidgets(
          context,
          text: "Oldest to Newest",
          icon: Icons.sort_by_alpha,
          onTap: () {
            Navigator.pop(context, SortOrder.oldestToNewest);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        _sortingWidgets(
          context,
          text: "Filter By Date",
          icon: Icons.calendar_month,
          onTap: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate.value,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              selectedDate.value = pickedDate;
              if (!mounted) {
                Navigator.pop(
                    navigatorKey.currentContext!, SortOrder.filterByDate);
              }
            } else {
              if (!mounted) {
                Navigator.pop(navigatorKey.currentContext!);
              }
            }
          },
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: () {
            sortingOrder.value = SortOrder.none;
            Navigator.pop(context);
          },
          child: Text(
            "RESET",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _sortingWidgets(BuildContext context,
      {required String text,
      required IconData icon,
      required Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.whiteColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }

  _showBottomSheet(BuildContext context, {required ProgramModel program}) {
    showModalBottomSheet(
      backgroundColor: AppColors.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      elevation: 0,
      isScrollControlled: true,
      context: context,
      constraints: BoxConstraints(
        maxWidth: sizeConfig.getFullWidth(),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: SingleChildScrollView(
            child: ProgramDetails(
              program: program,
            ),
          ),
        );
      },
    );
  }
}
