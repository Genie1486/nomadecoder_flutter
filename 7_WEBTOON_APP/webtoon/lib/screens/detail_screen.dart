import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/services/api_service.dart';
import 'package:webtoon/widgets/episode_widget.dart';

// ApiService.getToonById(id) 메서드가
// 인자를 요구하기 때문에
// 웹툰 상세정보를 받아오는 작업이 HomeScreen 과 같이
// StatelessWidget에서는 불가하기 때문에
// StatefulWidget으로 변경하였다.
class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  // prefs 초기화 하는 부분
  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedToons', []);
    }
  }

  // initState는 build 보다 먼저 호출된다.
  @override
  void initState() {
    super.initState();
    // widget.id로 id에 접근하는 이유는
    // id가 우리가 작업하는 클래스와 다른
    // 별개의 클래스에 있기 때문이다.
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
    initPrefs();
  }

  // 사용자가 버튼을 누를 때마다
  // likedToons에 id를 담거나 빼려고 한다.
  // likedToons : [1, 2, 3, 4, 5]
  // 화면이 로딩될 때, 해당 Widget의 id가 likedToons에 있는지 확인한 후
  // 만약에 있다면 버튼에 반영할 것
  onHeartedTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, // 밑에 그림자
        backgroundColor: Colors.white, // AppBar의 배경색
        foregroundColor: Colors.green, // AppBar의 글자색 설정
        actions: [
          IconButton(
            onPressed: onHeartedTap,
            icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_outline_outlined),
          ),
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 250,
                      // clipBehavior는 자식의 부모 영역 침범을 제어하는 방법
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15, // 그림자가 얼마나 멀리까지 드리울지
                            offset: const Offset(10, 10), // 그림자가 어디에 위치할지
                            color: Colors.black.withOpacity(0.5),
                          )
                        ],
                      ),
                      child: Image.network(
                        widget.thumb,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        FutureBuilder(
                          future: episodes,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              // ListView나 ListViewBuilider는
                              // 아이템이 많거나 최적하가 중요할 때 사용한다.
                              return Column(
                                children: [
                                  for (var episode in snapshot.data!)
                                    Episode(
                                      episode: episode,
                                      webtoonId: widget.id,
                                    )
                                ],
                              );
                            }
                            return Container();
                          },
                        )
                      ],
                    );
                  }
                  return const Text("...");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
