import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_submission/shared/theme.dart';
import 'package:suitmedia_submission/shared/values.dart';
import 'package:suitmedia_submission/ui/widgets/button_custom.dart';
import 'package:suitmedia_submission/ui/widgets/input_form_custom.dart';

class FirstScreenPage extends StatefulWidget {
  const FirstScreenPage({super.key});

  @override
  State<FirstScreenPage> createState() => _FirstScreenPageState();
}

class _FirstScreenPageState extends State<FirstScreenPage> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController palindromeController = TextEditingController(text: '');

  bool validate(){
    if(nameController.text.isEmpty){
      return false;
    }

    return true;
  }

  bool validatePalindrome(){
    if(palindromeController.text.isEmpty){
      return false;
    }

    return true;
  }

  bool checkPalindrome(String text) {
    String palindromeText = text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    return palindromeText == palindromeText.split('').reversed.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background First Screen
          Image.asset(
            bgFirstPage,
            fit: BoxFit.cover,
          ),

          // First Screen Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // Icon Photo
                  Container(
                    width: 150,
                    height: 150,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(icPhoto),
                      ),
                    ),
                  ),

                  const SizedBox(height: 51),

                  // Name Input Form
                  FilledInputCustom(
                    hintText: 'Name',
                    controller: nameController,
                  ),

                  const SizedBox(height: 20),

                  // Palindrome Input Custom
                  FilledInputCustom(
                    hintText: 'Palindrome',
                    controller: palindromeController,
                  ),

                  const SizedBox(height: 45),

                  // Check Button
                  FilledButtonCustom(
                      width: double.infinity,
                      height: 50,
                      label: 'CHECK',
                      onTap: (){
                        if(validatePalindrome()){
                          showDialog(context: context, builder: (context) => MoreDialog(
                            isPalindrome: checkPalindrome(palindromeController.text),
                            text: palindromeController.text,
                          ));

                        } else {
                          Get.snackbar(
                            'Empty Field',
                            "Please do not leave the palindrome input empty",
                            colorText: Colors.white,
                            backgroundColor: Colors.red,
                            icon: Icon(Icons.warning_amber_outlined, color: whiteColor, size: 26),
                          );
                        }
                      }
                  ),

                  const SizedBox(height: 15),

                  // Next Button
                  FilledButtonCustom(
                      width: double.infinity,
                      height: 50,
                      label: 'NEXT',
                      onTap: (){
                        if(validate()){
                          Get.toNamed('/second', arguments: nameController.text);
                        } else {
                          Get.snackbar(
                            'Empty Field',
                            "Please do not leave the name input empty",
                            colorText: Colors.white,
                            backgroundColor: Colors.red,
                            icon: Icon(Icons.warning_amber_outlined, color: whiteColor, size: 26),
                          );
                        }
                      }
                  ),


                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}


class MoreDialog extends StatelessWidget {
  final bool isPalindrome;
  final String text;

  const MoreDialog({super.key, required this.isPalindrome, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,

      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 180,

        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                isPalindrome == true
                    ?
                '$text\nIs Palindrome'
                    :
                '$text\nNot Palindrome',
                style: blackTextStyle.copyWith(
                    fontSize: 22,
                    fontWeight: semiBold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}