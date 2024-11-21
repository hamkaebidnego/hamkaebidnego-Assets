import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ImageSliderScreen(),
    );
  }
}

class ImageSliderScreen extends StatefulWidget {
  const ImageSliderScreen({Key? key}) : super(key: key);

  @override
  _ImageSliderScreenState createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  // Gambar orang sungguhan sesuai peran
  final _images = [
    'https://i.pinimg.com/736x/07/a9/71/07a97153d4f31ffc9dae4e49d8f5bab3.jpg', // Data Analyst
    'https://i.pinimg.com/736x/38/66/01/3866014eabced08bc6bdd05b86442e89.jpg', // Data Engineer
    'https://i.pinimg.com/736x/67/33/3d/67333d2eb82bb597d58be530ae8e7766.jpg', // Data Administrator
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hamka Ebid Nego - Galeri Anak Rimba'),
        backgroundColor: const Color.fromARGB(255, 129, 199, 132),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: _images.length,
              itemBuilder: (context, index) => Image.network(
                _images[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_images.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? const Color.fromARGB(255, 76, 175, 80)
                      : Colors.grey,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
