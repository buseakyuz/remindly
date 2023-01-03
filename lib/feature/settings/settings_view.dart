import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ayarlar',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'REMINDLY',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0),
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text('Kullanıcı Bilgileri',
                        style: TextStyle(
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
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: Text('Güncel oturumu kapat.',
                        style: TextStyle(fontSize: 20.0)),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
