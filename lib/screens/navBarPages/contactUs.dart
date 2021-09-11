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
                MouseRegion(
                  onEnter: (point) async {
                    await SheetsBackend.init();
                  },
                  child: CustomTextField(
                    header: "Name",
                    controller: name,
                    hint: "Please enter your name",
                    textInputType: TextInputType.text,
                    size: size,
                    height: size.height * 0.2,
                  ),
                ),
                CustomTextField(
                  header: "Email",
                  controller: email,
                  hint: "Please enter your email",
                  textInputType: TextInputType.emailAddress,
                  size: size,
                  height: size.height * 0.2,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(size.height * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey[400]!,
                          width: 0.7,
                        ),
                      ),
                      width: size.width * 0.85,
                      height: size.height * 0.07,
                      child: Center(
                        child: Text(
                          "Submit",
                        ),
                      ),
                    ),
                    onTap: () async {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email.text.trim());
                      if (emailValid &&
                          name.text.trim().length >= 1 &&
                          email.text.trim().length >= 1) {
                        final submission = {
                          "name": name.text.trim(),
                          "email": email.text.trim(),
                        };
                        await SheetsBackend.insert([submission]);
                        name.clear();
                        email.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
