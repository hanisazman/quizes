import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/exports.dart';

import '../../riverpod/auth/auth_provider.dart';
import '../component/drawer.dart';
import 'auth/login_page.dart';

class RootApp extends ConsumerStatefulWidget {
  const RootApp({
    Key? key,
    required this.body,
    this.frmKey,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  final Widget body;
  final Key? frmKey;
  final bool? resizeToAvoidBottomInset;

  static const routeName = '/root';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootAppState();
}

class _RootAppState extends ConsumerState<RootApp> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(authProvider.notifier);
    return Scaffold(
      backgroundColor: const Color(0xffFBFAFF),
      key: widget.frmKey,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      drawer: AppDrawer(
        onLogout: () => notifier.logout(
            goToLogin: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                )),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0, // Set elevation to 0 to avoid shadow under the AppBar
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: AppColors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 6,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
          ),
          widget.body,
        ],
      ),
    );
  }
}
