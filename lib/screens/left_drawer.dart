import 'package:flutter/material.dart';
import 'package:tasks/pages/completed_tasks_page.dart';
import 'package:tasks/pages/recycle_tasks_page.dart';
import 'package:tasks/pages/settings_page.dart';
import 'package:tasks/utils/custom_navigator.dart';
import 'package:tasks/widgets/private/left_drawer/card_list.dart';
import '../constants.dart';
import '../widgets/private/left_drawer/title_widget.dart';

class CustomLeftDrawer extends StatelessWidget {
  CustomLeftDrawer({Key? key}) : super(key: key);

  final _constants = LeftDrawerConstats();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          LeftDrawerTitleWidget(
            title: _constants.screenTitle,
          ),
          LeftDrawerCardList(
            icon: const Icon(Icons.check_box),
            title: _constants.completedPageTitle,
            onTap: () =>
                CustomNavigator.navigate(context, const CompletedTasksPage()),
          ),
          LeftDrawerCardList(
            icon: const Icon(Icons.delete),
            title: _constants.recylePageTitle,
            onTap: () =>
                CustomNavigator.navigate(context, const RecyleTasksPage()),
          ),
          LeftDrawerCardList(
            icon: const Icon(Icons.settings),
            title: _constants.settingsPageTitle,
            onTap: () =>
                CustomNavigator.navigate(context, const SettingsPage()),
          ),
        ],
      ),
    );
  }
}
