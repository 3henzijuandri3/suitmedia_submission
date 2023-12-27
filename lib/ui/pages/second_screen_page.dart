import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class SecondScreenPage extends StatelessWidget {
  const SecondScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text('Second Screen'),
        leading: Icon(Icons.chevron_left),
      ),

      body: ListView(
        padding: EdgeInsets.all(22),
        children: [

          // Welcome Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: blackTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: regular
                ),
              ),

              const SizedBox(height: 2),

              Text(
                'Jhon Doe',
                style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold
                ),
              ),
            ],
          ),

          // Selected User Name
          Center(
            child: Text(
              'Selected User Name',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold
              ),
            ),
          )

        ],
      ),
    );
  }
}
