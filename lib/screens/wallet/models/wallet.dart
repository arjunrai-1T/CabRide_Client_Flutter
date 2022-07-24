class WalletInfo {
  String time;
  String carName;
  String amount;
  String source;
  String destination;
  String paymentType;
  String reason;
  String iconImage;

  WalletInfo(
    this.time,
    this.carName,
    this.amount,
    this.source,
    this.destination,
    this.paymentType,
    this.reason,
    this.iconImage,
  );

  static List<WalletInfo> generateWalletInfo() {
    return [
      WalletInfo(
        "Today 9.21 am",
        "Suzuki Swift Dezire",
        "- 400 \u{20B9}",
        "Baguiati, Kolkata, West Bengal",
        "Howrah Railway Station, Howrah, West Bengal",
        "paid via wallet",
        "Paid for Ride",
        "assets/images/1.jpeg",
      ),
      WalletInfo(
        "Yesterday 11.01 pm",
        "Suzuki Swift Dezire",
        "+ 150 \u{20B9}",
        "",
        "",
        "paid via Cash",
        "Assed to Wallet",
        "assets/images/bank.png",
      ),
      WalletInfo(
        "25 Jan 7.19 am",
        "Suzuki Swift Dezire",
        "- 166 \u{20B9}",
        "Baguiati, Kolkata, West Bengal",
        "Howrah Railway Station, Howrah, West Bengal",
        "paid via wallet",
        "Paid for Ride",
        "assets/images/2.jpeg",
      ),
      WalletInfo(
        "09 Jun 9.21 am",
        "Suzuki Swift Dezire",
        "- 369 \u{20B9}",
        "Baguiati, Kolkata, West Bengal",
        "Howrah Railway Station, Howrah, West Bengal",
        "paid via wallet",
        "Paid for Ride",
        "assets/images/3.jpeg",
      ),
      WalletInfo(
        "29 Feb 9.21 am",
        "Suzuki Swift Dezire",
        "- 278 \u{20B9}",
        "Baguiati, Kolkata, West Bengal",
        "Howrah Railway Station, Howrah, West Bengal",
        "paid via wallet",
        "Paid for Ride",
        "assets/images/4.jpeg",
      ),
      WalletInfo(
        "29 Feb 9.21 am",
        "Suzuki Swift Dezire",
        "- 278 \u{20B9}",
        "Baguiati, Kolkata, West Bengal",
        "Howrah Railway Station, Howrah, West Bengal",
        "paid via wallet",
        "Paid for Ride",
        "assets/images/5.jpeg",
      ),
    ];
  }
}
