//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'ParticleModel.dart';
//
// class ParticlePainter extends CustomPainter {
//   List<ParticleModel> particles;
//   Duration time;
//
//   ParticlePainter(this.particles, this.time);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = Colors.white.withAlpha(50);
//
//     particles.forEach((particle) {
//       final animation = particle.tween.transform(1);
//       final position =
//       Offset(animation["x"] * size.width, animation["y"] * size.height);
//       canvas.drawCircle(position, size.width * 0.2 * 10, paint);
//     });
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }