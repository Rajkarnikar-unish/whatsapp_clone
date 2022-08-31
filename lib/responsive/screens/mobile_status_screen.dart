import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';

class MobileStatusScreen extends StatelessWidget {
  const MobileStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg',
                      ),
                      radius: 24,
                    ),
                    Positioned(
                      bottom: 0,
                      right: -2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: tabColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: backgroundColor,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
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
          const Text(
            'Recent updates',
            style: TextStyle(
              color: Colors.white24,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(),
              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: tabColor,
              //       width: 2,
              //     ),
              //   ),
              //   child: Text('UNISH'),
              // ),
              const SizedBox(width: 10),
              const Text(
                'WhatsApp',
                style: TextStyle(
                  color: tabColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 16,
              )
            ],
          ),
        ],
      ),
    );
  }
}
