class Products {
  String imageUrl;
  String productName;
  String description;
  String price;
  bool isAdded;

  Products({
    required this.imageUrl,
    required this.productName,
    required this.description,
    required this.price,
    this.isAdded = false,
  });
}

var productsList = [
  Products(
      imageUrl:
          'https://images.unsplash.com/photo-1575024357670-2b5164f470c3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      productName: 'KiBook Pro 2023',
      description: 'Best Laptop in 2023 and Biggest RAM',
      price: 'Rp.1.7500.000'),
  Products(
      imageUrl:
          'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1587&q=80',
      productName: 'Local Predator',
      description: 'Very Smooth for Playing Games',
      price: 'Rp.2.650.000'),
  Products(
      imageUrl:
          'https://images.unsplash.com/photo-1593642702821-c8da6771f0c6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80',
      productName: 'ROH Techpad 2019',
      description: 'Number One Laptop for Programming',
      price: 'Rp.8.650.000'),
  Products(
      imageUrl:
          'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80',
      productName: 'Simisang',
      description: 'With Perfect Camera and Flexible',
      price: 'Rp.5.250.000'),
  Products(
      imageUrl:
          'https://images.unsplash.com/photo-1588702547923-7093a6c3ba33?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      productName: 'Lanivi',
      description: 'Small RAM but Perfect in 2021',
      price: 'Rp.2.950.000'),
  Products(
      imageUrl:
          'https://images.unsplash.com/photo-1603302576837-37561b2e2302?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1468&q=80',
      productName: 'Advun',
      description: 'Funny Laptop and Have Small Size',
      price: 'Rp.2.050.000'),
];
