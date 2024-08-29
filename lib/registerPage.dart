import 'package:final_project/authentication.dart';
import 'package:final_project/custom_elevatedButton.dart';
import 'package:final_project/custom_text.dart';
import 'package:final_project/custom_textfield.dart';
import 'package:final_project/homeNav.dart';
import 'package:final_project/loginPage.dart';
import 'package:final_project/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  TextEditingController? emailRegController = TextEditingController();
  TextEditingController? passRegController = TextEditingController();
  TextEditingController? phoneRegController = TextEditingController();
  TextEditingController? nameRegController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isVisbility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(text: 'Register your account'),
              const SizedBox(
                height: 30,
              ),
              CustomText(
                Controller: emailRegController,
                validator: AppValidator.validateText,
                prefixIcon: const Icon(Icons.mail),
                hintText: 'Enter your Email',
                label: 'Email',
              ),
              const SizedBox(
                height: 30,
              ),
              CustomText(
                Controller: passRegController,
                validator: AppValidator.validateText,
                hintText: "Enter your Password",
                label: 'Password',
                obscureText: isVisbility,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: InkWell(
                    onTap: () {
                      isVisbility = !isVisbility;
                      setState(() {});
                    },
                    child: isVisbility
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility)),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomText(
                Controller: phoneRegController,
                validator: AppValidator.validateText,
                prefixIcon: const Icon(Icons.phone),
                hintText: 'Enter your Phone',
                label: 'Phone',
              ),
              const SizedBox(
                height: 30,
              ),
              CustomText(
                Controller: nameRegController,
                validator: AppValidator.validateText,
                prefixIcon: const Icon(Icons.person),
                hintText: 'Enter your Name',
                label: 'Name',
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                child: CustomElevated(
                  textButton: 'Register',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await Authentication.register(
                              email: emailRegController!.text,
                              password: passRegController!.text,
                              name: nameRegController!.text,
                              phone: phoneRegController!.text)
                          .then((value) {
                        if (value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => home()),
                              (route) => false);
                        }
                      });
                    }
                  },
                ),
              ),
              Align(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login(),
                          ),
                          (route) => false);
                    },
                    child: CustomTextField(
                      text: 'Already have an account?',
                      sizeText: 15,
                      colorText: Colors.black26,
                    )),
              )
            ],
          ),
        ),
      ),
    ));
    ;
  }
}
