import 'package:flutter/material.dart';

class BulbChallenge extends StatefulWidget {
  @override
  _BulbChallengeState createState() => _BulbChallengeState();
}

class _BulbChallengeState extends State<BulbChallenge> {
  bool rs = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double top1 = (h - (h * 0.1)) * 0.5;
    double top2 = (h - (h * 0.1)) * 0.75;
    if (w < h) {
      h = w;
    }
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: h,
        width: w,
        color: rs ? Color(0xff26252e) : Colors.amber,
        child: Stack(
          children: [
            Positioned(
              right: (h - h * 0.08) * 0.093,
              top: (h - ((h - (h * 0.1)) * 0.40)) * 0.66,
              child: CustomPaint(
                painter: CapsulePainter(rs: rs),
                child: Container(
                  height: (h - (h * 0.1)) * 0.37,
                  width: h * 0.08,
                ),
              ),
            ),
            AnimatedPositioned(
              right: h * 0.1,
              top: rs ? top2 : top1,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInBack,
              child: GestureDetector(
                behavior: HitTestBehavior.deferToChild,
                onTap: () {
                  setState(() {
                    rs = !rs;
                  });
                },
                child: CustomPaint(
                  painter: RingPainter(),
                  child: Container(
                    height: h * 0.05,
                    width: h * 0.05,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: h * 0.125,
              child: AnimatedContainer(
                height: rs ? h * 0.70 : h * 0.50,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInBack,
                width: 1,
                color: Colors.white,
              ),
            ),
            Positioned(
              left: w * 0.1,
              top: (h - h * 0.2) * 0.5,
              child: SizedBox(
                width: w * 0.5,
                height: h * 0.2,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    rs
                        ? "TAP THE SWITCH TO TURN ON THE LIGHTS ."
                        : "TAP THE SWITCH TO TURN OFF THE LIGHTS .",
                    style: TextStyle(
                        color: rs ? Colors.white : Colors.black, fontSize: 50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double h = size.height;
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    Offset center = Offset(h / 2, h / 2);
    canvas.drawCircle(center, h / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CapsulePainter extends CustomPainter {
  bool rs;
  CapsulePainter({this.rs});
  @override
  void paint(Canvas canvas, Size size) {
    double h = size.height;
    double w = size.width;
    Paint paint = Paint()
      ..color = rs ? Colors.black : Colors.black.withOpacity(0.3)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    Path path = new Path();
    path.moveTo(0, w / 2);
    path.lineTo(0, h - w / 2);
    path.arcToPoint(
      Offset(w, h - w / 2),
      radius: Radius.circular(w / 2),
      clockwise: false,
    );
    path.lineTo(w, w / 2);
    path.arcToPoint(
      Offset(0, w / 2),
      radius: Radius.circular(w / 2),
      clockwise: false,
    );
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
