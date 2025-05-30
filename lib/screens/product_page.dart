import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final PageController _pageController = PageController();
  int selectedIndex = 0;

  final List<Color> bandColors = [
    Colors.deepPurple,
    Colors.orange,
    Colors.green,
    Colors.blueGrey,
    Colors.black,
    Colors.red,
  ];

  final List<String> watchImages = [
    'assets/images/apple.png',
    'assets/images/apple.png',
    'assets/images/apple.png',
    'assets/images/apple.png',
    'assets/images/apple.png',
    'assets/images/apple.png',
    'assets/images/apple.png',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEAFF),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: Get.width,
            height: Get.height,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30,),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.menu, color: Colors.purple),
                ),
                const SizedBox(height: 50),

                // PageView for 3D-like scrollable watch
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: watchImages.length,
                    onPageChanged: (index) {
                      setState(() => selectedIndex = index);
                    },
                    itemBuilder: (context, index) {
                      return Transform.scale(
                        scale: index == selectedIndex ? 1.1 : 0.9,
                        child: Image.asset(
                          watchImages[index],
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    watchImages.length,
                        (index) => _buildIndicator(index == selectedIndex),
                  ),
                ),

                const SizedBox(height: 30),

                Center(
                  child: const Text(
                    'Apple Watch SE',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'The aluminum case is lightweight and made from 100 percent recycled aerospace-grade alloy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 40),

                // Band Colors
                const Text('Band Colors', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(bandColors.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              _pageController.jumpToPage(index);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: bandColors[index],
                              child: selectedIndex == index
                                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                                  : null,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Price and Buy Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('\$299.99', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text('BUY NOW', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: isActive ? 30 : 10,
        height: 5,
        decoration: BoxDecoration(
          color: isActive ? Colors.purple : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}