import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class UserCardCustom extends StatelessWidget {
  final String imgUrl;
  final String firstName;
  final String lastName;
  final String email;

  const UserCardCustom({super.key, required this.imgUrl, required this.email, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.only(bottom: 16),

      decoration: BoxDecoration(
        color: whiteColor,
        border: Border(bottom: BorderSide(
          color: lightGreyColor,
          width: 0.6,
        )),
      ),

      child: Row(
        children: [

          // User Image
          Container(
            width: 55,
            height: 55,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imgUrl),
              ),
            ),
          ),

          const SizedBox(width: 20),

          // User Name & Email
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Name
              Text(
                '$firstName $lastName',
                style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold
                ),
              ),

              // Email
              Text(
                email,
                style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
