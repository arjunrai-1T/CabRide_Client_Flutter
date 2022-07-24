import 'package:flutter/material.dart';

class TripInfo {
  String time;
  String carName;
  String amount;
  String source;
  String destination;
  String paymentType;
  String driverImages;

  TripInfo(
    this.time,
    this.carName,
    this.amount,
    this.source,
    this.destination,
    this.paymentType,
    this.driverImages,
  );

  static List<TripInfo> generateTripInfo() {
    return [
      TripInfo(
        "Today 9.21 am",
        "Suzuki Swift Dezire",
        "400 \u{20B9}",
        "Baguiati, Kolkata, West Bengal",
        "Howrah Railway Station, Howrah, West Bengal",
        "paid via wallet",
        "assets/images/1.jpeg",
      ),
      TripInfo(
        "Yesterday 11.01 pm",
        "Suzuki Swift Dezire",
        "189 \u{20B9}",
        "Baguiati, Kolkata, West Bengal",
        "Howrah Railway Station, Howrah, West Bengal",
        "paid via Cash",
        "assets/images/2.jpeg",
      ),
      TripInfo(
        "25 Jan 7.19 am",
        "Suzuki Swift Dezire",
        "166 \u{20B9}",
        "Baguiati, Kolkata, West Bengal",
        "Howrah Railway Station, Howrah, West Bengal",
        "paid via wallet",
        "assets/images/3.jpeg",
      ),
      TripInfo(
        "09 Jun 9.21 am",
        "Suzuki Swift Dezire",
        "369 \u{20B9}",
        "Baguiati, Kolkata, West Bengal",
        "Howrah Railway Station, Howrah, West Bengal",
        "paid via wallet",
        "assets/images/4.jpeg",
      ),
      TripInfo(
        "29 Feb 9.21 am",
        "Suzuki Swift Dezire",
        "278 \u{20B9}",
        "Baguiati, Kolkata, West Bengal",
        "Howrah Railway Station, Howrah, West Bengal",
        "paid via wallet",
        "assets/images/5.jpeg",
      ),
    ];
  }
}
