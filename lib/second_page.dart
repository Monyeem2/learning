import 'package:flutter/material.dart';

class Image_page extends StatefulWidget {
  const Image_page({super.key});

  @override
  State<Image_page> createState() => _Image_pageState();
}

class _Image_pageState extends State<Image_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Image"),
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              height: 200,
                width: 200,
                image: AssetImage("images/abc.png"),
            ),

            Image(
              height: 200,
                width: 200,
                image: NetworkImage("https://miro.medium.com/v2/resize:fit:828/format:webp/1*OohqW5DGh9CQS4hLY5FXzA.png"),
            )
          ],
        ),
      ),

    );
  }
}
