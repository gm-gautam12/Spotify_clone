import 'package:flutter/material.dart';
import 'package:soptify/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? titleLogo;
  const BasicAppBar({
    this.titleLogo,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: titleLogo ?? Text(''),
      leading: IconButton(
        onPressed: (){
         Navigator.pop(context);
        },
        icon: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: context.isDarkMode ? Color.fromRGBO(255, 255, 255, 0.03) : Color.fromRGBO(0, 0, 0, 0.03),
            shape: BoxShape.circle
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        )
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}