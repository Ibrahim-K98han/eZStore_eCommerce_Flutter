import 'dart:ui';

import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';

class InnerCategoryItem {
  final String name;
  final String imageUrl;

  InnerCategoryItem({required this.name, required this.imageUrl});
}

final List<InnerCategoryItem> innerCategory = [
  InnerCategoryItem(name: "Women", imageUrl: KImages.women),
  InnerCategoryItem(name: "Gym", imageUrl: KImages.gym),
  InnerCategoryItem(name: "Mens", imageUrl: KImages.mens),
  InnerCategoryItem(name: "Shoes & Bags", imageUrl: KImages.shoes),
  InnerCategoryItem(name: "Dress", imageUrl: KImages.dress),
  InnerCategoryItem(name: "Sleepwear", imageUrl: KImages.sleepwear),
  InnerCategoryItem(name: "Home Living", imageUrl: KImages.homeLiving),
  InnerCategoryItem(name: "Jewelry", imageUrl: KImages.jewelry),
  InnerCategoryItem(name: "Mens", imageUrl: KImages.mens),
  InnerCategoryItem(name: "Home Living", imageUrl: KImages.homeLiving),
  InnerCategoryItem(name: "Dress", imageUrl: KImages.dress),
  InnerCategoryItem(name: "Mens", imageUrl: KImages.mens),
  InnerCategoryItem(name: "Health & Beauty", imageUrl: KImages.health),
];

final List<InnerCategoryItem> flashSales = [
  InnerCategoryItem(
    name: "Radiant Evening  Floral Accents",
    imageUrl: KImages.product1,
  ),
  InnerCategoryItem(
    name: "Charming Twilight A-Line Dress",
    imageUrl: KImages.product2,
  ),
  InnerCategoryItem(
    name: "Elegant Dusk Chiffon Dress",
    imageUrl: KImages.product3,
  ),
];

final List<InnerCategoryItem> hotSale = [
  InnerCategoryItem(name: "T-shirt Maxi", imageUrl: KImages.product1),
  InnerCategoryItem(name: "Vibrant Sunset", imageUrl: KImages.product2),
];

final List<InnerCategoryItem> productList = [
  InnerCategoryItem(
    name: "Radiant Evening  Floral Accents",
    imageUrl: KImages.product1,
  ),
  InnerCategoryItem(
    name: "Charming Twilight A-Line Dress",
    imageUrl: KImages.product2,
  ),
  InnerCategoryItem(
    name: "Vibrant Sunset Maxi Dress",
    imageUrl: KImages.product3,
  ),
  InnerCategoryItem(
    name: "Radiant Evening  Floral Accents",
    imageUrl: KImages.product4,
  ),
  InnerCategoryItem(
    name: "Charming Twilight A-Line Dress",
    imageUrl: KImages.product5,
  ),
  InnerCategoryItem(
    name: "Vibrant Sunset Maxi Dress",
    imageUrl: KImages.product6,
  ),
  InnerCategoryItem(name: "Elegant Dusk Chiffon", imageUrl: KImages.product7),
  InnerCategoryItem(
    name: "Charming Twilight A-Line Dress",
    imageUrl: KImages.product8,
  ),
  InnerCategoryItem(
    name: "Elegant Dusk Chiffon Dress",
    imageUrl: KImages.product4,
  ),
  InnerCategoryItem(
    name: "Charming Twilight A-Line Dress",
    imageUrl: KImages.product2,
  ),
];

class NotificationItem {
  final String title;
  final String imageUrl;
  final Color bg;

  NotificationItem({
    required this.title,
    required this.imageUrl,
    required this.bg,
  });
}

final List<NotificationItem> notification = [
  NotificationItem(
    title: "Order Shipped",
    imageUrl: KImages.notifications,
    bg: greenColor.withOpacity(0.1),
  ),
  NotificationItem(
    title: "Flash Sale Starts Now!",
    imageUrl: KImages.discountTag,
    bg: secondaryColor.withOpacity(0.1),
  ),
  NotificationItem(
    title: "Order Shipped",
    imageUrl: KImages.notifications,
    bg: greenColor.withOpacity(0.1),
  ),
  NotificationItem(
    title: "Flash Sale Starts Now!",
    imageUrl: KImages.discountTag,
    bg: secondaryColor.withOpacity(0.1),
  ),
];

class WishList {
  final String image;
  final String name;
  final double price;
  final double originalPrice;
  final double rating;
  final int reviewCount;
  final int soldCount;
  final int discount;
  bool isFavorite;

  WishList({
    required this.image,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.reviewCount,
    required this.soldCount,
    required this.discount,
    this.isFavorite = false,
  });
}

final List<WishList> wishlist = [
  WishList(
    image: KImages.product1,
    name: 'Bohemian Style Maxi Dress',
    price: 59.99,
    originalPrice: 89.99,
    rating: 4.8,
    reviewCount: 379,
    soldCount: 540,
    discount: 25,
  ),
  WishList(
    image: KImages.product2,
    name: 'Colorful Summer Gown',
    price: 59.99,
    originalPrice: 89.99,
    rating: 4.8,
    reviewCount: 379,
    soldCount: 540,
    discount: 25,
  ),
  WishList(
    image: KImages.product3,
    name: 'Floral Print Maxi Dress',
    price: 59.99,
    originalPrice: 89.99,
    rating: 4.8,
    reviewCount: 379,
    soldCount: 540,
    discount: 27,
  ),
  WishList(
    image: KImages.product4,
    name: 'Chic Evening Dress',
    price: 59.99,
    originalPrice: 89.99,
    rating: 4.8,
    reviewCount: 379,
    soldCount: 540,
    discount: 25,
  ),
  WishList(
    image: KImages.product5,
    name: 'Tropical Vibes Maxi Dress',
    price: 59.99,
    originalPrice: 89.99,
    rating: 4.8,
    reviewCount: 379,
    soldCount: 540,
    discount: 25,
  ),
];

class OrderItem {
  final String status;
  final String date;
  final String productName;
  final String color;
  final String size;
  final double price;
  final int quantity;
  final String image;
  final String trackingText;
  final String estimatedDelivery;

  OrderItem({
    required this.status,
    required this.date,
    required this.productName,
    required this.color,
    required this.size,
    required this.price,
    required this.quantity,
    required this.image,
    required this.trackingText,
    required this.estimatedDelivery,
  });
}

final List<OrderItem> orders = [
  OrderItem(
    status: 'Awaiting Delivery',
    date: 'Sep 16, 2025',
    productName: 'Vibrant Sunset Maxi Dress',
    color: 'Gray',
    size: 'M',
    price: 59.99,
    quantity: 1,
    image: KImages.product1,
    trackingText: 'Click to check tracking details',
    estimatedDelivery: 'Oct 23, 2025',
  ),
  OrderItem(
    status: 'Awaiting Delivery',
    date: 'Sep 16, 2025',
    productName: 'Vibrant Sunset Maxi Dress',
    color: 'Gray',
    size: 'M',
    price: 59.99,
    quantity: 1,
    image: KImages.product2,
    trackingText: 'Click to check tracking details',
    estimatedDelivery: 'Oct 23, 2025',
  ),
  OrderItem(
    status: 'Awaiting Delivery',
    date: 'Sep 16, 2025',
    productName: 'Vibrant Sunset Maxi Dress',
    color: 'Gray',
    size: 'M',
    price: 59.99,
    quantity: 1,
    image: KImages.product3,
    trackingText: 'Click to check tracking details',
    estimatedDelivery: 'Oct 23, 2025',
  ),
];