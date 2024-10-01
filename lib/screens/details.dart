import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../constants/app_image.dart';
import '../constants/app_size.dart';
import '../models/map_point.dart';
import '../widgets/app_bar.dart';

class Details extends StatefulWidget {
  MapPoint point;
  Details({super.key, required this.point});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    AppSize size = AppSize(context);
    TextTheme theme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.point.alignment,
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Material(
                  color: widget.point.color,
                  child: VideoPlayer(widget.point.controller!)),
            ),
          ),
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 0.5, 1.0],
                colors: [
                  Color.fromARGB(165, 0, 0, 0),
                  Colors.transparent,
                  Colors.transparent
                ],
              ),
            ),
          )),
          const Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Hero(
                tag: "appBar",
                child: CustomAppBar(),
              ),
            ),
          ),
          Align(
              alignment: const Alignment(0, .7),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.scale(
                          scale: value,
                          child: SizedBox(
                            height: size.height * .1,
                            width: size.height * .1,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(AppImage.map),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Positioned.fill(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          const Color.fromARGB(255, 5, 36, 83)
                                              .withOpacity(.5)),
                                )),
                                Align(
                                    child: Container(
                                        height: size.height * .02,
                                        width: size.height * .02,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color.fromARGB(
                                              255, 42, 255, 234),
                                          border: Border.all(
                                              color: Colors.white, width: 2.0),
                                        ))),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                      padding: EdgeInsets.all(size.small),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        widget.point.emoji,
                                        style: theme.titleMedium,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: size.medium),
                  TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 500),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0.0, -10 + (value * 10)),
                            child: Column(
                              children: [
                                Text(
                                  widget.point.name,
                                  style: theme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: size.small),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.small),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 4, 52, 92),
                                          borderRadius: BorderRadius.circular(
                                              size.medium)),
                                      child: Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style: const TextStyle(height: 1),
                                              children: [
                                                TextSpan(
                                                  text: "L",
                                                  style: theme.titleMedium
                                                      ?.copyWith(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                TextSpan(
                                                    text: ".",
                                                    style: TextStyle(
                                                        fontSize: size.medium,
                                                        color: const Color
                                                            .fromARGB(255, 33,
                                                            236, 243))),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: size.small),
                                    Text("9.1",
                                        style: theme.titleMedium?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: size.medium),
                                    Text("\$ ${widget.point.price}",
                                        style: theme.titleMedium?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      })
                ],
              )),
        ],
      ),
    );
  }
}
