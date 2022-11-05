import 'package:etracker/theming/app_dimms.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimms.defaultBorderRadius,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppDimms.defaultBorderRadius,
        ),
        child: Container(
          height: 300,
          width: 200,

        ),
      ),
    );
  }
}
