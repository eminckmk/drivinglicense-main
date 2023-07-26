import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/client/datas/topic_datas.dart';
import '../helpers/custom_colors.dart';
import '../presentation/routes/lesson/lesson_selection.dart';
import '../presentation/routes/lesson/topic_bottom_list.dart';


class TopicSelecter extends ConsumerStatefulWidget {
  TopicSelecter({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.showDots = false,
    this.cardWidthRatio = 0.04,
    this.unSelectedMarginWidthRatio = 0.15,
    this.selectedMarginWidthRatio = 0.2,
    this.selectedCardHeightRatio = 0.33,
    this.unSelectedCardHeightRatio = 0.155,
  });

  final Widget Function(int index, int selectedIndex) itemBuilder;
  final int itemCount;
  final bool showDots;
  final double cardWidthRatio;
  final double unSelectedMarginWidthRatio;
  final double selectedCardHeightRatio;
  late double selectedMarginWidthRatio;
  final double unSelectedCardHeightRatio;

  @override
  _SystemSelecterState createState() => _SystemSelecterState();
}

class _SystemSelecterState extends ConsumerState<TopicSelecter> {

  ScrollController? _scrollController;
  int _selectedIndex = 0;
  late double parentWidth;
  double? parentHeight;

  @override
  void initState() {
    _scrollController = ScrollController();

    final topicModel = ref.read(selectedTopic);
    _selectedIndex = topicList!.indexOf(topicModel);

    final double fullCardWidth =
        widget.cardWidthRatio + widget.selectedMarginWidthRatio;
    _scrollController!.addListener(() {
      final double offset = _scrollController!.offset;

      double deltaReverse;
      double deltaForward;

      if (widget.itemCount == 2) {
        deltaReverse = (((_selectedIndex) * (fullCardWidth)) +
                widget.selectedMarginWidthRatio) *
            parentWidth;
        deltaForward = (((_selectedIndex) * (fullCardWidth)) +
                widget.selectedMarginWidthRatio) *
            parentWidth;
      } else {
        deltaReverse = (((_selectedIndex - 1) * (fullCardWidth)) +
                widget.selectedMarginWidthRatio) *
            parentWidth;
        deltaForward = (((_selectedIndex - 1) * (fullCardWidth)) +
                widget.selectedMarginWidthRatio) *
            parentWidth;
      }

      if (offset > deltaReverse &&
          _scrollController!.position.userScrollDirection ==
              ScrollDirection.reverse) {
        setState(() {
          if(_selectedIndex < topicList!.length){
            _animateButton(ref);
            _selectedIndex += 1;

          }
        });
      }
      if (offset < deltaForward &&
          _scrollController!.position.userScrollDirection ==
              ScrollDirection.forward) {
        setState(() {
          if(_selectedIndex < topicList!.length){
            _animateButton(ref);
            _selectedIndex -= 1;
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == 1) {
      widget.selectedMarginWidthRatio = 0.30;
    }
    return LayoutBuilder(builder: (context, constraints) {
      parentWidth = constraints.maxWidth;
      parentHeight = constraints.maxHeight;
      if (parentHeight == double.infinity) {
        final mediaQuery = MediaQuery.of(context);
        parentHeight = mediaQuery.size.height;
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: parentHeight! * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.itemCount,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _animateButton(ref);
                          var positionValue = (index) *
                              widget.unSelectedMarginWidthRatio *
                              parentHeight!;
                          _selectedIndex = index;
                          _scrollController?.animateTo(positionValue,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);

                    });
                  },
                  child: Row(
                    children: [
                      if (index == 0) ...[
                        SizedBox(width: parentWidth * 0.04),
                      ],
                      Stack(
                        children: [
                          AnimatedContainer(
                            width: _selectedIndex == index
                                ? widget.selectedMarginWidthRatio *
                                    parentHeight!
                                : widget.unSelectedMarginWidthRatio *
                                    parentHeight!,
                            height: _selectedIndex == index
                                ? widget.selectedCardHeightRatio *
                                    parentHeight!
                                : widget.unSelectedCardHeightRatio *
                                    parentHeight!,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(

                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomLeft,
                                  stops: [0.3, 1],
                                  colors: [
                                    if (_selectedIndex == index)
                                      Colors.white

                                    else
                                      CustomColors.editTextBackground
                                    ,
                                    if (_selectedIndex == index)
                                      Colors.white
                                    else
                                      Colors.white
                                  ]),
                            ),
                            duration: const Duration(milliseconds: 300),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              top: 0,
                              child: CustomPaint(
                                size: Size(
                                  parentWidth * widget.cardWidthRatio,
                                  _selectedIndex == index
                                      ? widget.selectedCardHeightRatio *
                                          parentHeight!
                                      : widget.unSelectedCardHeightRatio *
                                          parentHeight!,
                                ),
                              )),
                          Positioned.fill(
                              child:
                                  widget.itemBuilder(index, _selectedIndex))
                        ],
                      ),
                      SizedBox(width: parentWidth * 0.04)
                    ],
                  ),
                );
              },
            ),
          ),
            SizedBox(height: parentHeight! * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  List.generate(widget.itemCount, (index) => buildDot(index)),
            ),

        ],
      );
    });
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: parentHeight! * 0.008,
      margin: EdgeInsets.all(parentWidth * 0.01),
      width: _selectedIndex == index ? parentWidth * 0.05 : parentWidth * 0.015,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
    );
  }

  void _animateButton(WidgetRef ref) {
    ref.read(opacityLevel.state).state = 0.0;
    Future.delayed(Duration(milliseconds: 500), () {
      ref.read(opacityLevel.state).state = 1.0;
      ref.read(selectedTopic.state).state = topicList![_selectedIndex];
    });
  }

}
