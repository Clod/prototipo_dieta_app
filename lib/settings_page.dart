import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {

  BuildContext context;

  SettingsPage({required BuildContext this.context});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
        previousPageTitle: 'Home',
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the settings page!'),
            SizedBox(height: 20),
            CupertinoButton(
              child: Text('Go Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
