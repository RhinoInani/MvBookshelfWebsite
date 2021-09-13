import 'package:bookshelf_website/components/emailList.dart';
import 'package:bookshelf_website/components/navbar.dart';
import 'package:bookshelf_website/components/textField.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class JoinUs extends StatefulWidget {
  JoinUs({Key? key}) : super(key: key);

  @override
  _JoinUsState createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController hear = TextEditingController();
  TextEditingController ques = TextEditingController();

  bool sheets = false;

  String selectedGrade = "9";

  String errorTextEmail = "";
  String errorTextName = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => true,
      child: Title(
        color: Colors.white,
        title: "Join Us",
        child: Scaffold(
          appBar: navbar(size, context),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: size.height * 0.05,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "  Join us",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                        fontSize: size.longestSide * 0.024,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                MouseRegion(
                  onEnter: (point) async {
                    if (!sheets) {
                      sheets = await SheetsBackend.init();
                    }
                  },
                  child: Container(
                    height: size.height * 0.2,
                    padding: EdgeInsets.all(size.longestSide * 0.02),
                    child: TextFormField(
                      controller: name,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        labelText: "Name *",
                        hintText: "Please enter your full name",
                        labelStyle: TextStyle(
                            color: secondColor,
                            fontSize: size.longestSide * 0.015),
                        hintStyle: TextStyle(
                            color: secondColor,
                            fontSize: size.longestSide * 0.015),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1,
                          vertical: size.height * 0.03,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: mainColor,
                          ),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: mainColor),
                          gapPadding: 10,
                        ),
                        errorText: errorTextName == "" ? null : errorTextName,
                        errorStyle: TextStyle(color: Colors.red[400]),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.red[400]!,
                          ),
                          gapPadding: 10,
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.red[400]!,
                          ),
                          gapPadding: 10,
                        ),
                      ),
                      onEditingComplete: () {
                        setState(() {
                          name.text.trim().length < 1
                              ? errorTextName = "Please fill out this field"
                              : errorTextName = "";
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.055,
                        ),
                        Container(
                          height: size.height * 0.2,
                          width: size.width * 0.6,
                          padding: EdgeInsets.all(size.longestSide * 0.02),
                          child: TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Email *",
                              hintText: "Please enter your email",
                              labelStyle: TextStyle(
                                  color: secondColor,
                                  fontSize: size.longestSide * 0.015),
                              hintStyle: TextStyle(
                                  color: secondColor,
                                  fontSize: size.longestSide * 0.015),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.1,
                                vertical: size.height * 0.03,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: mainColor,
                                ),
                                gapPadding: 10,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: mainColor),
                                gapPadding: 10,
                              ),
                              errorText:
                                  errorTextEmail == "" ? null : errorTextEmail,
                              errorStyle: TextStyle(color: Colors.red[400]),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.red[400]!,
                                ),
                                gapPadding: 10,
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.red[400]!,
                                ),
                                gapPadding: 10,
                              ),
                            ),
                            onChanged: (string) {
                              try {
                                bool emailValid;
                                emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(string.trim());
                                emailValid
                                    ? setState(() {
                                        errorTextEmail = "";
                                      })
                                    : setState(() {
                                        errorTextEmail =
                                            "Please enter a valid email";
                                      });
                              } catch (FormatException) {
                                setState(() {
                                  errorTextEmail = "Please enter a valid email";
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          right: size.width * 0.09,
                          top: -size.height * 0.055,
                          child: Container(
                            child: Text(
                              "Grade *",
                              style: TextStyle(
                                fontSize: size.longestSide * 0.015,
                                color: secondColor,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: size.width * 0.05,
                                right: size.width * 0.05),
                            decoration: BoxDecoration(
                                border: Border.all(color: mainColor),
                                borderRadius: BorderRadius.circular(15)),
                            child: DropdownButton<String>(
                              iconSize: size.height * 0.04,
                              icon: Icon(Icons.arrow_drop_down),
                              iconEnabledColor: mainColor,
                              iconDisabledColor: secondColor,
                              elevation: 5,
                              underline: Container(),
                              dropdownColor: Colors.grey[100],
                              value: selectedGrade,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedGrade = value!;
                                });
                              },
                              style: TextStyle(
                                  color: secondColor,
                                  fontSize: size.longestSide * 0.015),
                              items: <String>[
                                '9',
                                '10',
                                '11',
                                '12'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                CustomTextField(
                  header: "How did you hear about us?",
                  controller: hear,
                  hint: "Let us know how you heard about Mv Bookshelf!",
                  textInputType: TextInputType.text,
                  size: size,
                  height: size.height * 0.25,
                ),
                CustomTextField(
                  header: "Any questions or comments",
                  controller: ques,
                  hint: "Do you have any questions or comments?",
                  textInputType: TextInputType.text,
                  size: size,
                  height: size.height * 0.25,
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
                          "grade": selectedGrade,
                          "hear": hear.text.trim(),
                          "ques": ques.text.trim(),
                        };
                        await SheetsBackend.insert([submission]);
                        setState(() {
                          recentSignUp = name.text.trim();
                        });
                        Navigator.of(context).pushNamed('/join/thank-you');
                        name.clear();
                        email.clear();
                        hear.clear();
                        ques.clear();
                        setState(() {
                          selectedGrade = "9";
                        });
                      } else {
                        setState(() {
                          email.text.trim().length < 1
                              ? errorTextEmail = "Please fill out this field"
                              : errorTextEmail = "";
                          name.text.trim().length < 1
                              ? errorTextName = "Please fill out this field"
                              : errorTextName = "";
                        });
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
