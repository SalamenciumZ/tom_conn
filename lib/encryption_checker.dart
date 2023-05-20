import 'package:tom_conn/utilities/auth_page.dart';
import 'package:tom_conn/aboutUs.dart';
import 'package:tom_conn/editPW.dart';
import 'package:tom_conn/settings.dart';
import 'package:tom_conn/utilities/getWH.dart';
import 'package:tom_conn/contactUs.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:tom_conn/utilities/encryption.dart';

class encryptionCheck extends StatefulWidget {
  const encryptionCheck({Key? key}) : super(key: key);

  @override
  State<encryptionCheck> createState() => _settingsCheck();
}

class _settingsCheck extends State<encryptionCheck> {
  TextEditingController tec = TextEditingController();
  var encryptedText, plainText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Encryption'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: tec,
              ),
            ),
            Column(
              children: [
                Text(
                  'Plain Text',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue[400],
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(plainText == null ? "" : plainText),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'Encrypted Text',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue[400],
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(encryptedText == null ? "" : encryptedText is encrypt.Encrypted ? encryptedText.base64 : encryptedText),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                  plainText = tec.text;
                  setState(() {
                    encryptedText = cryptography.encryptBOTH(plainText);
                  });
                },
                    child: Text('Encrypt'),),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      encryptedText = cryptography.decryptTWO(encryptedText);
                      print("Type: " + encryptedText.runtimeType.toString());
                    });
                },
                  child: Text('Decrypt'),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
