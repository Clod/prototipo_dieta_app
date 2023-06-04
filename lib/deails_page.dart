import 'package:flutter/cupertino.dart';

class DetailsPage extends StatelessWidget {

  BuildContext context;

  DetailsPage({required BuildContext this.context});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Details'),
        previousPageTitle: 'Home',
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the details page!'),
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
