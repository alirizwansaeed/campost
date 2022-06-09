import 'package:flutter/material.dart';

class WaveAnimaitonOnOvalShape extends StatelessWidget {
  const WaveAnimaitonOnOvalShape({
    Key? key,
    required Animation<Alignment> alignmentTween,
  })  : _alignmentTween = alignmentTween,
        super(key: key);

  final Animation<Alignment> _alignmentTween;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 400, minHeight: 250),
                child: AspectRatio(
                  aspectRatio: .8,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(800, 1000)),
                        border: Border.all(color: Color(0xFFFDD400), width: 2)),
                    child: Stack(
                      alignment: _alignmentTween.value,
                      children: [
                        Container(
                          height: 8,
                          clipBehavior: Clip.hardEdge,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.yellow.shade400.withOpacity(.01),
                                Colors.yellow.shade400,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        )
                      ],
                    ),
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

class BlackMaskWithOvalShape extends StatelessWidget {
  const BlackMaskWithOvalShape({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.5),
        BlendMode.srcOut,
      ), // This one will create the magic
      child: Stack(
        //  fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              backgroundBlendMode: BlendMode.dstOut,
            ), // This one  will handle background + difference out
          ),
          SafeArea(
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: 400, minHeight: 250),
                      child: AspectRatio(
                        aspectRatio: .8,
                        child: ClipOval(
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
