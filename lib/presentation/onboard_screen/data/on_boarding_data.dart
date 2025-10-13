import '../../../utils/k_images.dart';

class OnBoardingData{
  final String image;
  final String title;
  final String subTitle;

  const OnBoardingData({
    required this.image,
    required this.title,
    required this.subTitle,
  });

}

final List<OnBoardingData> data = [
  const OnBoardingData(
    image: KImages.onboardOne,
    title: '20% Discount New Arrival Product',
    subTitle:
        'Publish up your selfies to make yourself more beautiful with this app.',
  ),
  const OnBoardingData(
    image: KImages.onboardTwo,
    title: 'Take Advantage Of The Offer Shopping',
    subTitle:
        'Publish up your selfies to make yourself more beautiful with this app.',
  ),
  const OnBoardingData(
    image: KImages.onboardThree,
    title: 'All Types Offers Within your Reach',
    subTitle:
        'Publish up your selfies to make yourself more beautiful with this app.',
  ),

];
