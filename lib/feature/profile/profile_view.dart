import 'package:flutter/material.dart';
import 'package:remindly/core/constants/layout_constants.dart';
import '../global/screens/avatar/select_avatar_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 22.0),
        ),
      ),
      body: Padding(
        padding: LayoutConstants.centralAllPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SizedBox(
                    width: 84.0,
                    height: 84.0,
                    child: GestureDetector(
                      onTap: _selectAvatar,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/avatars/0.png"),
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.edit, color: Colors.white, size: 18),
                      )),
                ],
              ),
            ),
            Text(
              "Buse Akyüz",
              style: TextStyle(fontSize: 28.0),
            ),
            Divider(
              indent: 12.0,
              endIndent: 12.0,
              thickness: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "20",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Text("hatırlatma notu",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black.withValues(alpha: 0.5),
                        ))
                  ],
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "12.12.2022",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    Text("tarihinde katıldı.",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black.withValues(alpha: 0.5)))
                  ],
                ),
              ],
            ),
            LayoutConstants.defaultEmptyHeight,
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text('Kullanıcı Bilgileri',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text('Bilgilerini düzenle.',
                      style: TextStyle(fontSize: 20.0)),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  title: Text('Şifre İşlemleri',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text('Şifreni değiştir.',
                      style: TextStyle(fontSize: 20.0)),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  title: Text('Kullanım Koşulları ve Şartmane',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text('Belgeleri incele.',
                      style: TextStyle(fontSize: 20.0)),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  title: Text('Çıkış Yap',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  trailing: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _selectAvatar() {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(44.0)),
        context: context,
        builder: (context) => SelectAvatarView());
  }
}
