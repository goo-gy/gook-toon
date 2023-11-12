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

  void switchWebtoonDetail(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebtoonDetail(
          id: id,
          title: title,
          thumbnail: thumbnail,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switchWebtoonDetail(context);
      },
      child: Container(
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
      ),
    );
  }
}
