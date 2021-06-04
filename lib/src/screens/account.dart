import 'package:flutter/material.dart';

import '../../generated/i18n.dart';
import '../../services.dart';
import '../../theme.dart';
import '../../components.dart';

class AccountScreen extends StatelessWidget {
  static const String route = '/account';

  final String _id = PreferenceService().getString('studentId')!;

  final String _firstName = PreferenceService().getString('firstName')!;

  final String _lastName = PreferenceService().getString('lastName')!;

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = BuildAppBar(
      title: I18n.of(context).accountTitle,
    );

    final Widget avatar = Align(
      alignment: Alignment.center,
      child: BuildAccountCircle(
        firstName: this._firstName,
        lastName: this._lastName,
      ),
    );

    final Widget user = Text(
      I18n.of(context).accountUser(
        this._firstName.toLowerCase() + ' ' + this._lastName.toLowerCase(),
      ),
      style: BuildTextStyle(type: TextStyleType.white).subtitle2,
      textAlign: TextAlign.center,
    );

    final Widget id = Text(
      I18n.of(context).accountId(
        this._id,
      ),
      style: BuildTextStyle(type: TextStyleType.white).subtitle2,
      textAlign: TextAlign.center,
    );

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 24.0, right: 8.0),
        child: Column(
          children: [
            avatar,
            const SizedBox(height: 16.0),
            user,
            const SizedBox(height: 8.0),
            id,
          ],
        ),
      ),
    );
  }
}