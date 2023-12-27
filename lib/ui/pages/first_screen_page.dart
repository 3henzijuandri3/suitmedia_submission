import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_submission/shared/theme.dart';
import 'package:suitmedia_submission/shared/values.dart';
import 'package:suitmedia_submission/ui/widgets/button_custom.dart';
import 'package:suitmedia_submission/ui/widgets/input_form_custom.dart';

class FirstScreenPage extends StatelessWidget {
  const FirstScreenPage({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: 32),
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
                  ),

                  const SizedBox(height: 20),

                  // Palindrome Input Custom
                  FilledInputCustom(
                    hintText: 'Palindrome',
                  ),

                  const SizedBox(height: 45),

                  // Check Button
                  FilledButtonCustom(
                      width: double.infinity,
                      height: 50,
                      label: 'CHECK',
                      onTap: (){

                      }
                  ),

                  const SizedBox(height: 15),

                  // Next Button
                  FilledButtonCustom(
                      width: double.infinity,
                      height: 50,
                      label: 'NEXT',
                      onTap: (){
                       Get.toNamed('/second');
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

























