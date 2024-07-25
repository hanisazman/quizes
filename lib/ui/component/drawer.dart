import 'package:flutter/material.dart';

import '../../core/exports.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key, this.onLogout, this.onScoreHistory}) : super(key: key);
  final Function()? onLogout, onScoreHistory;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.secondaryColor),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.close),
                      color: AppColors.white,
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.score, color: AppColors.white),
            title: const Text(
              "Score History",
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            onTap: widget.onScoreHistory,
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: AppColors.white),
            title: const Text("Logout",
                style: TextStyle(
                  color: AppColors.white,
                )),
            onTap: widget.onLogout,
          ),
        ],
      ),
    );
  }
}
