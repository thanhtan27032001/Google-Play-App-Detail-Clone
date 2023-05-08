import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_play/my_video.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'CH Play',
        debugShowCheckedModeBanner: false,
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            const MyAppbar(),
            const MyAppInfo(),
            const MyAppEvaluate(),
            const MyInstallButton(),
            MyAppReview(),
            const MyAppDescription(),
            MyAppTag(),
          ],
        ),
      )
    );
  }
}

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => debugPrint("Quay lại"),
                icon: const Icon(Icons.arrow_back),
                splashRadius: 24,
              ),
            )
          ),
          IconButton(
            onPressed: () => debugPrint("Tìm kiếm"),
            icon: const Icon(Icons.search),
            splashRadius: 24,
          ),
          IconButton(
            onPressed: () => debugPrint("Thêm"),
            icon: const Icon(Icons.more_vert),
            splashRadius: 24,
          ),
        ],
      ),
    );
  }
}

class MyAppInfo extends StatelessWidget {
  const MyAppInfo({super.key});

  final double appLogoSize = 80;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          // app logo
          Container(
            width: appLogoSize,
            height: appLogoSize,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(1, 2),
                      blurRadius: 4)
                ]),
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              "assets/images/bing_logo.png",
              fit: BoxFit.contain,
            ),
          ),

          // app name, author, advertise
          Container(
            margin: const EdgeInsets.only(left: 16),
            width: MediaQuery.of(context).size.width - appLogoSize - 3 * 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // app name
                const Text(
                  "Bing - Your AI copilot",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),

                // author
                TextButton(
                  onPressed: () => {debugPrint("Xem nhà phát hành")},
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      minimumSize: const Size(50, 22),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: const Text(
                    "Microsoft Corporation",
                    style: TextStyle(color: Colors.green),
                  ),
                ),

                // is advertised
                const Text(
                  "Chứa quảng cáo",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyAppEvaluate extends StatelessWidget {
  const MyAppEvaluate({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle evaluateStyle = TextStyle(fontSize: 12, color: Colors.black87);

    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "4.5",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: const Text("308 N bài đánh giá", style: evaluateStyle)
                    ),
                    const Icon(Icons.info_outline, size: 12, color: Colors.black87)
                  ],
                )
              ],
            ),
            const VerticalDivider(),
            Column(
              children: const [
                Icon(
                  Icons.download_for_offline_outlined,
                  size: 16,
                ),
                Text("99 MB", style: evaluateStyle)
              ],
            ),
            const VerticalDivider(),
            Column(
              children: const [
                Icon(Icons.three_k_outlined, size: 16),
                Text("Phù hợp cho 3 tuổi trở lên", style: evaluateStyle)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyInstallButton extends StatelessWidget {
  const MyInstallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () => debugPrint("Cài đặt ứng dụng"),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.green
        ),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: const Text('Cài đặt')),
      ),
    );
  }
}

class MyAppReview extends StatelessWidget {

  MyAppReview({Key? key}) : super(key: key);

  final List<String> previewPaths = [
    "https://www.youtube.com/watch?v=jm3Y_UA2qUo",
    "assets/images/preview_1.png",
    "assets/images/preview_2.png",
    "assets/images/preview_3.png",
    "assets/images/preview_4.png",
    "assets/images/preview_5.png"
  ];
  final double previewHeight = 186;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: previewHeight,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: previewPaths.length,
        itemBuilder: (context, index){
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            height: previewHeight,
            margin: index == 0
            ? const EdgeInsets.only(left: 16)
            : (
              index == previewPaths.length - 1
              ? const EdgeInsets.fromLTRB(8, 0, 16, 0)
              : const EdgeInsets.only(left: 8)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: previewPaths[index].startsWith("https://www.youtube.com/")
                ? VideoPlayer(videoUrl: previewPaths[index])
                : Image.asset(previewPaths[index]),
            ),
          );
        },
      ),
    );

  }
}

class MyAppDescription extends StatelessWidget {
  const MyAppDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 0, 16),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text("Về ứng dụng này", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                iconSize: 20,
                splashRadius: 20,
                onPressed: () => {debugPrint("Xem mô tả chi tiết")},
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.centerLeft,
            child: Text("Giới thiệu Bing mới. Đặt câu hỏi thực sự. Nhận câu trả lời đầy đủ"),
          )
        ],
      ),
    );
  }

}

class MyAppTag extends StatelessWidget {

  MyAppTag({Key? key}) : super(key: key);

  final List<String> tags = ["Công cụ", "Trình duyệt"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 35,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, index) {
          return Container(
            margin: index > 0 ? const EdgeInsets.only(left: 8) : EdgeInsets.zero,
            child: TextButton(
              onPressed: () => debugPrint("Chọn tag ${tags[index]}"),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(
                    width: 0.6,
                    color: Colors.black45
                  )
                ),
              ),
              child: Text(
                tags[index],
                style: const TextStyle(
                  color: Colors.black54
                ),
              ),
            ),
          );
        },
      )
    );
  }
}

