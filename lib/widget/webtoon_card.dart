import 'package:flutter/material.dart';
import 'package:gook_toon/screen/webtoon_detail.dart';

class WebtoonCard extends StatelessWidget {
  final String title, thumbnail, id;

  const WebtoonCard({
    super.key,
    required this.title,
    required this.thumbnail,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(5, 5),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      width: 300,
      child: Image.network(thumbnail, headers: const {
        "User-Agent":
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
      }),
    );
  }
}
