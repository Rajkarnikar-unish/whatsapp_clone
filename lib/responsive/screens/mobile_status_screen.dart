import 'package:flutter/material.dart';

class MobileStatusScreen extends StatelessWidget {
  const MobileStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Stack(
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg',
                    ),
                    radius: 22,
                  ),
                  Positioned(
                    bottom: 0,
                    right: -2,
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.green,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'My status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Tap to add status update',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
