import 'package:flutter/material.dart';

class WebSearchBar extends StatelessWidget {
  const WebSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(),
      child: Row(
        children: [],
      ),
    );
  }
}
