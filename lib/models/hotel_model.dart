class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;
  String description;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
    this.description,
  });
}

List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Hotel Malibu',
    address: '404 Great St',
    price: 176,
    description: 'Enjoy your stay in our hotel. For any query contact our management support.',
  ),
   Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hotel Sea & Forks',
    address: '302a Queens',
    price: 300,
    description: 'Enjoy your stay in our hotel. For any query contact our management support.',
  ),
   Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Hotel Alabasta',
    address: 'Texas St 19 street',
    price: 240,
    description: 'Enjoy your stay in our hotel. For any query contact our management support.',
  ),
];