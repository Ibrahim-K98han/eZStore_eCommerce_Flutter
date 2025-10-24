import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../utils/constraints.dart';
import '../../../utils/custom_form.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_dropdown_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/primary_button.dart';

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({super.key});

  @override
  State<MyProfileWidget> createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImage(),
            Utils.verticalSpace(16.h),
            Row(
              children: [
                Expanded(
                  child: CustomFormWidget(
                    label: 'First Name',
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'First Name'),
                    ),
                  ),
                ),
                Utils.horizontalSpace(16.w),
                Expanded(
                  child: CustomFormWidget(
                    label: 'Last Name',
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Last Name'),
                    ),
                  ),
                ),
              ],
            ),
            Utils.verticalSpace(12.h),
            CustomFormWidget(
              label: 'Email Address',
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
              ),
            ),
            Utils.verticalSpace(12.h),

            InputPhoneNumber(),

            Utils.verticalSpace(12.h),

            SelectCountryAndCity(),

            SelectStateAndZipCode(),

            Utils.verticalSpace(12.h),
            CustomFormWidget(
              label: 'Address',
              child: TextFormField(
                decoration: InputDecoration(hintText: 'San Francisco'),
              ),
            ),
            Utils.verticalSpace(47.h),
            PrimaryButton(
              bgColor: secondaryColor,
              borderRadiusSize: 0.r,
              minimumSize: Size(double.infinity, 44),
              text: 'Save Changes',
              onPressed: () {},
            ),
            Utils.verticalSpace(16.h),
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: Utils.vSize(71.h),
          width: Utils.vSize(71.w),
          decoration: BoxDecoration(
            color: secondaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: Utils.borderRadius(r: 50.r),
              child: CustomImage(
                path: KImages.person,
                width: 78.w,
                height: 78.h,
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: Utils.all(value: 5.0),
              height: Utils.vSize(24),
              width: Utils.vSize(24),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor,
              ),
              child: Center(
                child: CustomImage(path: KImages.camera, color: whiteColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InputPhoneNumber extends StatelessWidget {
  const InputPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: 'Phone Number'),
        Utils.verticalSpace(6.h),
        InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {},
          selectorConfig: SelectorConfig(
            setSelectorButtonAsPrefixIcon: true,
            leadingPadding: 20,
            trailingSpace: false,
            useEmoji: true,
          ),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          selectorTextStyle: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.bold,
          ),
          inputDecoration: InputDecoration(
            labelStyle: TextStyle(color: greyColor.withOpacity(0.5)),
            hintText: '707 797 0462',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
          ),
          spaceBetweenSelectorAndTextField: 16,
        ),
      ],
    );
  }
}

class SelectCountryAndCity extends StatefulWidget {
  const SelectCountryAndCity({super.key});

  @override
  State<SelectCountryAndCity> createState() => _SelectCountryAndCityState();
}

class _SelectCountryAndCityState extends State<SelectCountryAndCity> {
  String? selectedCountry;
  String? selectedCity;
  final List<String> country = ['Bangladesh', 'Pakistan'];
  final List<String> city = ['Dhaka', 'Islamabad'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Country'),
              Utils.verticalSpace(4.h),
              CustomDropdownButton(
                value: selectedCountry,
                hintText: 'Select Country',
                items: country,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
                itemBuilder: (country) => CustomText(text: country),
              ),
            ],
          ),
        ),
        Utils.horizontalSpace(16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'City'),
              Utils.verticalSpace(4.h),
              CustomDropdownButton(
                value: selectedCity,
                hintText: 'Select City',
                items: city,
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
                itemBuilder: (city) => CustomText(text: city),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SelectStateAndZipCode extends StatefulWidget {
  const SelectStateAndZipCode({super.key});

  @override
  State<SelectStateAndZipCode> createState() => _SelectStateAndZipCodeState();
}

class _SelectStateAndZipCodeState extends State<SelectStateAndZipCode> {
  String? selectedState;

  final List<String> state = ['Demra', 'Gulistan'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'State'),
              Utils.verticalSpace(4.h),
              CustomDropdownButton(
                value: selectedState,
                hintText: 'Select State',
                items: state,
                onChanged: (value) {
                  setState(() {
                    selectedState = value;
                  });
                },
                itemBuilder: (state) => CustomText(text: state),
              ),
            ],
          ),
        ),
        Utils.horizontalSpace(16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Zip Code'),
              Utils.verticalSpace(4.h),
              TextFormField(decoration: InputDecoration(hintText: '9002')),
            ],
          ),
        ),
      ],
    );
  }
}
