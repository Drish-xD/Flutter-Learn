import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late Animation<double> catAnimation;
  late AnimationController catController;
  late Animation<double> flapAnimation;
  late AnimationController flapController;

  @override
  void initState() {
    super.initState();

    // Cat Animation controller and tween
    catController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    catAnimation = Tween(begin: -40.0, end: -125.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );
    // Flap Animation Controller And tween
    flapController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    flapAnimation = Tween(begin: 0.3, end: 0.4).animate(
      CurvedAnimation(
        parent: flapController,
        curve: Curves.easeInOut,
      ),
    );

    flapAnimation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          flapController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          flapController.forward();
        }
      },
    );
    flapController.forward();
  }

// Play Animations according to the status of the current anim
  playAnimation() {
    if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
      flapController.stop();
    } else if (catController.status == AnimationStatus.completed) {
      catController.reverse();
      flapController.forward();
    } else if (catController.status == AnimationStatus.reverse) {
      catController.forward();
    } else if (catController.status == AnimationStatus.forward) {
      catController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: playAnimation,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            buildCatAnimation(),
            catBox(),
            boxLeftFlap(),
            boxRightFlap(),
          ],
        ),
      ),
    );
  }

  // Cat Image animation
  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          right: 0,
          left: 0,
          top: catAnimation.value,
          child: child!,
        );
      },
      child: Image.network(
        'https://i.imgur.com/QwhZRyL.png',
      ),
    );
  }

  // Cat box Animation
  Widget catBox() {
    return Container(
      height: 250,
      width: 300,
      decoration: const BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14))),
    );
  }

  Widget boxLeftFlap() {
    return Positioned(
      left: 3,
      child: AnimatedBuilder(
        animation: flapAnimation,
        builder: (context, child) {
          return Transform.rotate(
            alignment: Alignment.topLeft,
            angle: flapAnimation.value,
            child: child,
          );
        },
        child: Container(
          height: 120,
          width: 15,
          color: Colors.brown,
        ),
      ),
    );
  }

  Widget boxRightFlap() {
    return Positioned(
      right: 0,
      child: AnimatedBuilder(
        animation: flapAnimation,
        builder: (context, child) {
          return Transform.rotate(
            alignment: Alignment.topRight,
            angle: -flapAnimation.value - 0.1,
            child: child,
          );
        },
        child: Container(
          height: 120,
          width: 15,
          color: Colors.brown,
        ),
      ),
    );
  }
}
