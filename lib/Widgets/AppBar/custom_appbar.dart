import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget  implements PreferredSizeWidget{
  const CustomAppbar({super.key});

    Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
      ),
      title: SizedBox(
        height: 40,
        child: Image.asset("assets/logo.png", fit: BoxFit.contain),
      ),
      centerTitle: true,
    );
  }
}
