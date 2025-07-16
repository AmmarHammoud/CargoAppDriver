import 'package:flutter/material.dart';
import 'setting_component.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop(); // الرجوع إلى الشاشة السابقة
              } else {}
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(
          "الاعدادات",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff65253E),
      ),
      body: Column(
        children: [
          SettingsComponent(
            icon: Icons.person,
            subtitle: "First name,last name,mobile number",
            title: "Personal details",
            trailingIcon: Icons.navigate_next_sharp,
            onTap: () {},
          ),
          SettingsComponent(
            title: "Delivery addresses",
            subtitle: "Add,edit and delete addresses",
            icon: Icons.location_on_sharp,
            onTap: () {},
            trailingIcon: Icons.navigate_next_rounded,
          ),
          SettingsComponent(
            title: "Language",
            subtitle: "Arabic/English",
            icon: Icons.settings,
            onTap: () {},
            trailingIcon: Icons.navigate_next_rounded,
          ),
          SettingsComponent(
            title: "Track orders",
            subtitle: "Track your orders",
            icon: Icons.location_on,
            onTap: () {},
            trailingIcon: Icons.navigate_next_rounded,
          ),
          SettingsComponent(
            title: "Notification",
            subtitle: "You have new notifications",
            icon: Icons.location_on,
            onTap: () {},
            trailingIcon: Icons.navigate_next_rounded,
          ),
          SettingsComponent(
            title: "Notification",
            subtitle: "You have new notifications",
            icon: Icons.location_on,
            onTap: () {},
            trailingIcon: Icons.navigate_next_rounded,
          ),
          SettingsComponent(
            title: "Delete Account",
            subtitle: "",
            icon: Icons.delete,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
