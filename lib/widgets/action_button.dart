import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/res/colors.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ActionButton({Key key, @required this.title, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      minWidth: 200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onPressed: onTap,
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          color: Color(0XFFFFFFFF),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      color: AppColors.actionButtonBackgroundColor.withOpacity(0.5),
    );
  }
}
