import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foody/utils/constants.dart';
import 'package:foody/widgets/big_text.dart';
import 'package:foody/widgets/icon_text.dart';
import 'package:foody/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.getHeight(250);
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print('Current value is: ${_currPageValue}');
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //The Page View
        Container(
          // color: Colors.redAccent,
          margin: const EdgeInsets.only(top: 15),
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        //The Dots--->
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: Size.square(Dimensions.getHeight(9.0)),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        //The popular text--------->
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.getWidth(20),
            top: Dimensions.getHeight(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: 'Popular',
                size: Dimensions.getHeight(35),
              ),
              SmallText(
                text: '.',
                size: 20,
              ),
              SmallText(text: 'Food pairing'),
            ],
          ),
        ),
        //The List under Popular text------>
        Container(
          height: 1400,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return _ListItem(index);
              }),
        ),
      ],
    );
  }

  Widget _ListItem(int position) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.getWidth(10), bottom: Dimensions.getHeight(10)),
      child: Row(
        children: [
          Container(
            width: Dimensions.getWidth(125),
            height: Dimensions.getHeight(125),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/food1.jpg'))),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: Dimensions.getWidth(8)),
              padding: EdgeInsets.only(
                top: Dimensions.getHeight(7),
                left: Dimensions.getWidth(5),
                right: Dimensions.getWidth(15),
              ),
              height: Dimensions.getHeight(100),
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigText(
                    text: 'Nutritious Fruit Meal indian',
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  SmallText(text: 'With Chinese Characteristics'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconText(
                        iconData: Icons.food_bank,
                        text: 'Normal',
                        iconColor: Colors.orange,
                        iconsSize: 18,
                        textSize: 13,
                      ),
                      IconText(
                        iconData: Icons.place_outlined,
                        text: '1.7KM',
                        iconColor: Colors.greenAccent,
                        iconsSize: 18,
                        textSize: 13,
                      ),
                      IconText(
                        iconData: Icons.timelapse_sharp,
                        text: '32min',
                        iconColor: Colors.redAccent,
                        iconsSize: 18,
                        textSize: 13,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageItem(int position) {
    Matrix4 matrix = new Matrix4.identity();
    late var currScale;
    late var currTrans;
    if (position == _currPageValue.floor()) {
      currScale = 1 - (_currPageValue - position) * (1 - _scaleFactor);
      currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currPageValue.floor() + 1) {
      currScale =
          _scaleFactor + (_currPageValue - position + 1) * (1 - _scaleFactor);
      currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currPageValue.floor() - 1) {
      currScale = 1 - (_currPageValue - position) * (1 - _scaleFactor);
      currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            // width: double.infinity,
            height: Dimensions.getHeight(220),
            decoration: BoxDecoration(
              color: position.isEven ? Colors.amber : Colors.blue,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/food${position + 1}.jpg',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              padding: const EdgeInsets.only(
                  left: 12, top: 12, right: 12, bottom: 20),
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      spreadRadius: 0.8,
                      offset: Offset(0, 5),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: 'Chinese Side'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.blueAccent,
                                )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: '4.5'),
                      SizedBox(
                        width: 15,
                      ),
                      SmallText(text: '1287 comments'),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconText(
                          iconData: Icons.food_bank,
                          text: 'Normal',
                          iconColor: Colors.orange),
                      IconText(
                        iconData: Icons.place_outlined,
                        text: '1.7KM',
                        iconColor: Colors.greenAccent,
                      ),
                      IconText(
                          iconData: Icons.timelapse_sharp,
                          text: '32min',
                          iconColor: Colors.redAccent)
                    ],
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
