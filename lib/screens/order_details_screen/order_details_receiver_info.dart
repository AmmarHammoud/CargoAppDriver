import 'package:flutter/material.dart';

class OrderDetailsReceiverInfo extends StatelessWidget {
  const OrderDetailsReceiverInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color(0xFFCFCFCF),
        ),
      ),
      child: Column(
        children: [
          Text('معلومات المستلم', style: Theme.of(context).textTheme.titleMedium,),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.call),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('حسام زينه'),
                        Text('01202772849'),
                      ],
                    ),
                    SizedBox(width: 5,),
                    CircleAvatar(
                      radius: 20.0,
                      child: ClipOval(child: Image.asset('assets/images/husam.jpg')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
