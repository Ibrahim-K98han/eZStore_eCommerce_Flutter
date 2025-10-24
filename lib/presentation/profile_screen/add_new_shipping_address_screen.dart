import 'package:ezstore/presentation/order_confirm/order_confirm_screen.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/custom_form.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AddNewShippingAddressScreen extends StatefulWidget {
  const AddNewShippingAddressScreen({super.key});

  @override
  State<AddNewShippingAddressScreen> createState() =>
      _AddNewShippingAddressScreenState();
}

class _AddNewShippingAddressScreenState
    extends State<AddNewShippingAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Add New Address",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 96.h,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: Utils.symmetric(v: 23.h),
          child: PrimaryButton(
            bgColor: secondaryColor,
            minimumSize: Size(double.infinity, 44.h),
            borderRadiusSize: 0.0,
            text: 'Save Address',
            onPressed: () {
              // Navigator.pushNamed(
              //   context,
              //   RouteNames.addNewShippingAddressScreen,
              // );
            },
          ),
        ),
      ),
      body: AddNewAddressForm(),
    );
  }
}

class AddNewAddressForm extends StatefulWidget {
  const AddNewAddressForm({super.key});

  @override
  State<AddNewAddressForm> createState() => _AddNewAddressFormState();
}

class _AddNewAddressFormState extends State<AddNewAddressForm> {
  String selectedCountry = 'us';

  final Map<String, Map<String, String>> countries = {
    'us': {'flag': '🇺🇸', 'name': 'United States'},
    'uk': {'flag': '🇬🇧', 'name': 'United Kingdom'},
    'ca': {'flag': '🇨🇦', 'name': 'Canada'},
    'bd': {'flag': '🇧🇩', 'name': 'Bangladesh'},
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Utils.symmetric(v: 0.0),
        child: Column(
          children: [
            CustomFormWidget(
              label: 'Contact Name',
              bottomSpace: 12.sp,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: greyColor.withOpacity(0.2),
                      width: 0.5,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF8FAFC),
                  hintText: 'Full Name',
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Phone Number'),
                Utils.verticalSpace(8.h),
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {},
                  selectorConfig: SelectorConfig(
                    setSelectorButtonAsPrefixIcon: true,
                    leadingPadding: 20,
                    trailingSpace: false,
                    useEmoji: true,
                  ),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
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
                Utils.verticalSpace(10.h),
                CustomText(text: 'Country'),
                Utils.verticalSpace(8.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffF8FAFC),
                    border: Border.all(color: borderColor),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCountry,
                      isDense: true,
                      isExpanded: true,
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.shade700,
                        size: 16.sp,
                      ),
                      items:
                          countries.entries.map((entry) {
                            return DropdownMenuItem<String>(
                              value: entry.key,
                              child: Row(
                                children: [
                                  Text(
                                    entry.value['flag']!,
                                    style: TextStyle(fontSize: 20.sp),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    entry.value['name']!,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() => selectedCountry = newValue);
                        }
                      },
                    ),
                  ),
                ),
                Utils.verticalSpace(10.h),
                CustomFormWidget(
                  label: 'State',
                  bottomSpace: 12.sp,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                          color: greyColor.withOpacity(0.2),
                          width: 0.5,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xffF8FAFC),
                      hintText: 'State/ Province',
                    ),
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: CustomFormWidget(
                        label: 'City',
                        bottomSpace: 12.sp,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                color: greyColor.withOpacity(0.2),
                                width: 0.5,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xffF8FAFC),
                            hintText: 'State/ Province',
                          ),
                        ),
                      ),
                    ),
                    Utils.horizontalSpace(10.w),
                    Expanded(
                      child: CustomFormWidget(
                        label: 'Zip Code',
                        bottomSpace: 12.sp,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                color: greyColor.withOpacity(0.2),
                                width: 0.5,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xffF8FAFC),
                            hintText: 'State/ Province',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomFormWidget(
                  label: 'Address',
                  bottomSpace: 12.sp,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                          color: greyColor.withOpacity(0.2),
                          width: 0.5,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xffF8FAFC),
                      hintText: 'Street, house unit',
                    ),
                  ),
                ),
                Utils.verticalSpace(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Set as default shipping address',
                      fontWeight: FontWeight.w500,
                    ),
                    SwitchWidget(initialValue: false, onToggle: (value) {}),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
