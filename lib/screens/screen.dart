import 'package:flutter/material.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 90),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/premium-vector/royal-vintage-gothic-horizontal-background-green-with-classic-baroque-pattern-rococo_619989-997.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  painter: CirclePainter(
                    borderColor: Colors.grey.shade800,
                    borderWidth: 32.0,
                  ),
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: ClipOval(
                      child: Image.network(
                        'https://i.pinimg.com/originals/9b/e0/0e/9be00e66e1ae4466d5e83b84958bc5cd.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 90,
                  child: Image.network(
                    'https://i.ibb.co/GMT7PY8/Screenshot-2024-06-26-020134-removebg-preview.png',
                    width: 490,
                    height: 490,
                  ),
                ),
                Positioned(
                  bottom: -560,
                  right: 23,
                  left: 35,
                  child: Image.network(
                    'https://i.ibb.co/S7Ycq8m/Screenshot-2024-06-26-015303-removebg-preview.png',
                    width: 800,
                    height: 800,
                  ),
                ),
                Positioned(
                  left: 60,
                  child: RotationTransition(
                      turns: _controller,
                      child: Image.asset(
                        'assets/images/arrow.png',
                        height: 130,
                      )),
                ),
                Positioned(
                    left: 70,
                    child: Image.asset(
                      'assets/images/arrow.png',
                      height: 100,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;

  CirclePainter({required this.borderColor, this.borderWidth = 12.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..color = borderColor;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
