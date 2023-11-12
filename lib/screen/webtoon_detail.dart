import 'package:flutter/material.dart';
import 'package:gook_toon/models/webtoon_detail.dart';
import 'package:gook_toon/service/api_service.dart';
import 'package:gook_toon/widget/webtoon_card.dart';

class WebtoonDetail extends StatefulWidget {
  final String id, title, thumbnail;

  const WebtoonDetail({
    super.key,
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  @override
  State<WebtoonDetail> createState() => _WebtoonDetailState();
}

class _WebtoonDetailState extends State<WebtoonDetail> {
  late Future<WebtoonDetailModel> webtoon;

  @override
  void initState() {
    webtoon = ApiService.getToonById(widget.id);
    super.initState();
  }

  Widget webtoonFutureBuilder(context, snapshot) {
    if (snapshot.hasData) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 15,
        ),
        child: Text(
          snapshot.data!.about,
          style: const TextStyle(fontSize: 16),
        ),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          elevation: 1,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: WebtoonCard(
                        title: widget.title,
                        thumbnail: widget.thumbnail,
                        id: widget.id),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: webtoon,
                builder: webtoonFutureBuilder,
              )
            ],
          ),
        ));
  }
}
