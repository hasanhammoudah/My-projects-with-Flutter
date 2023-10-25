import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            'https://media.istockphoto.com/id/1465188429/photo/business-performance-monitoring-concept-businessman-using-smartphone-online-survey-filling.webp?b=1&s=170667a&w=0&k=20&c=QJ2XWQVsbaB3Rzjk8tXv1csVlvyDvtww1NXK8yHzNl0=',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'fgxzdfzdfdzfzfzdzsfsdzfdfsefsfdsfdsfdsfdsfdssdfdsfxzfdfx',

          /* 'Overflow' */
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'dfsfsfdfdsfsdfsdf',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        )
      ],
    );
  }
}
