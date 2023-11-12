import 'package:flutter/material.dart';
import 'package:gook_toon/models/webtoon.dart';
import 'package:gook_toon/service/api_service.dart';
import 'package:gook_toon/widget/webtoon_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Today's Webtoon!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(child: makeToonList(snapshot)),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView makeToonList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      itemCount: snapshot.data!.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 25,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Hero(
          tag: webtoon.id,
          child: WebtoonCard(
              id: webtoon.id, title: webtoon.title, thumbnail: webtoon.thumb),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 25),
    );
  }
}
