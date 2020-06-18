class Food {
  String name;
  double price;
  double rate;
  int rateCount;
  String image;
  FoodTypes foodType;
  Food({this.name, this.price, this.image, this.rate, this.rateCount, this.foodType});
}

enum FoodTypes {
  Starter,
  All,
  Biryani,
  Burger,
  Pizza,
  Soup,
}

List<Food> foods = [
  Food(
    name: 'Chilli Potato',
    price: 30,
    rate: 4.0,
    rateCount: 18,
    image: 'https://s3.ap-south-1.amazonaws.com/mumbai.urbanpiper.com/media/bizmedia/l/2019/01/03/honey_chilli_potato.JPG',
    foodType: FoodTypes.Starter,
  ),
  Food(
    name: 'Panner Tikka',
    price: 100,
    rate: 4.5,
    rateCount: 25,
    image: 'https://www.magictadka.com/wp-content/uploads/2017/06/paneer-tikka.jpg',
    foodType: FoodTypes.Starter,
  ),
  Food(
    name: 'Tandoori Chicken',
    price: 150,
    rate: 3.5,
    rateCount: 67,
    image: 'https://media-cdn.tripadvisor.com/media/photo-s/14/11/6e/90/chicken-tikka-sizzling.jpg',
    foodType: FoodTypes.Starter,
  ),
  Food(
    name: 'Pasta',
    price: 120,
    rate: 4,
    rateCount: 29,
    image: 'https://www.thespruceeats.com/thmb/1xDU1K7Ev47T8P6_fs4tN_ur2k4=/735x0/GettyImages-885397466-5c0cc0634cedfd00012758a7.jpg',
    foodType: FoodTypes.Starter,
  ),
  Food(
    name: 'Cheese Pizza',
    price: 200,
    rate: 5,
    rateCount: 80,
    image: 'https://images.pexels.com/photos/2619967/pexels-photo-2619967.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    foodType: FoodTypes.Pizza,
  ),
];
