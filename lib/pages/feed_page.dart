import 'package:flutter/material.dart';
import 'package:new_ng_demo5/services/colors_srevice.dart';

import '../model/post_model.dart';
import '../model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
  ];

  List<Post> _posts = [
    Post(
        "Sylvester",
        "assets/images/user_2.jpeg",
        [
          "assets/images/feed_1.jpg",
          "assets/images/user_2.jpeg",
          "assets/images/feed_3.jpg"
        ],
        ""),
    Post(
        "Sylvester",
        "assets/images/feed_1.jpg",
        [
          "assets/images/user_2.jpeg",
          "assets/images/user_1.jpeg",
          "assets/images/feed_3.jpg"
        ],
        ""),
    Post(
        "Lavina",
        "assets/images/feed_1.jpg",
        [
          "assets/images/user_1.jpeg",
          "assets/images/feed_3.jpg",
          "assets/images/user_3.jpeg"
        ],
        ""),
  ];

  PageController? _pageController;
  int selectedItemIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),

              //stories
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Stories"), Text("watch all")],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 110,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _stories.map((story) {
                    return _itemStory(story);
                  }).toList(),
                ),
              ),

              Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _posts.length,
                    itemBuilder: (ctx, i) {
                      return _itemPost(_posts[i]);
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemStory(Story story) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                border: Border.all(width: 3, color: HexColor("FF8e44ad"))),
            child: Container(
              padding: EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image(
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  image: AssetImage(story.image!),
                ),
              ),
            )),
        Text("${story.name}")
      ],
    );
  }

  Widget _itemPost(Post post) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image(
                    image: AssetImage(post.userImage!),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(post.userName!)
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: (index) {
                setState(
                  () {
                    selectedItemIndex = index;
                  },
                );
              },
              children: post.postImage.map((image) {
                return FadeInImage(
                    fit: BoxFit.fitWidth,
                    placeholder: AssetImage("assets/images/placeholder.png"),
                    image: AssetImage(image));
              }).toList(),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.messenger_outline)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.send))
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.bookmark_border_rounded))
            ],
          ),

          //#tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.clip,
              text: TextSpan(children: [
                TextSpan(text: "hello", style: TextStyle(color: Colors.black))
              ]),
            ),
          ),

          // # caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(children: [
                TextSpan(text: "My name"),
                TextSpan(text: "My baby")
              ]),
            ),
          )
        ],
      ),
    );
  }
}
