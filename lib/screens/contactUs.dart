import 'package:bookshelf_website/components/emailList.dart';
import 'package:bookshelf_website/components/navbar.dart';
import 'package:bookshelf_website/components/textField.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => true,
      child: Title(
        color: Colors.white,
        title: "Contact Us",
        child: Scaffold(
          appBar: navbar(size, context),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: size.height * 0.05,
            ),
            child: Column(
              children: [
                CustomTextField(
                  header: "Name",
                  controller: name,
                  hint: "Please enter your name",
                  textInputType: TextInputType.text,
                  size: size,
                  height: size.height * 0.2,
                ),
                CustomTextField(
                  header: "Email",
                  controller: email,
                  hint: "Please enter your email",
                  textInputType: TextInputType.emailAddress,
                  size: size,
                  height: size.height * 0.2,
                ),
                TextButton(
                    onPressed: () async {
                      final submission = {
                        "name": name.text,
                        "email": email.text,
                      };
                      await SheetsBackend.init();
                      await SheetsBackend.insert([submission]);
                    },
                    child: Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
