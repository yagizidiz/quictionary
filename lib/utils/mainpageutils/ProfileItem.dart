import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[300], shape: BoxShape.circle),
                child: const CircleAvatar(
                  backgroundImage:
                  NetworkImage('https://picsum.photos/200/300'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Row(
                children: const [
                  Text('Hi, ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.normal)),
                  Text(
                    'Swoxy',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
