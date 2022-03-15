class Slider1Model {
  String imageUrl;
  String title;
  String subtitle;
  int rating;

  Slider1Model({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.rating,
  });
}

final List<Slider1Model> listSlider1 = [
  Slider1Model(
    imageUrl:
        "https://i0.wp.com/foodandpleasure.com/wp-content/uploads/2021/04/palenques-mezcaleros-oaxaca-graciasadiosmezcal3.jpg?fit=1080%2C720&ssl=1",
    title: "Palenque mil amores",
    subtitle: "San Martín, Oaxaca",
    rating: 3,
  ),
  Slider1Model(
    imageUrl:
        "https://i0.wp.com/www.turimexico.com/wp-content/uploads/2017/01/Palenque-Mal-de-Amor-Oaxaca.jpeg?fit=1271%2C721&ssl=1",
    title: "Mal de amores",
    subtitle: "Matatlán Oaxaca",
    rating: 1,
  ),
  Slider1Model(
    imageUrl:
        "https://www.turimexico.com/wp-content/uploads/2017/01/Palenque-El-Mitle%C3%B1o-Oaxaca.jpg",
    title: "El burrito sabanero",
    subtitle: "Santo Tomás Jalieza, Oaxaca",
    rating: 5,
  ),
  Slider1Model(
    imageUrl:
        "https://travesiasdigital.com/wp-content/uploads/2021/01/mezcal-paulina-figueroa-3.jpg",
    title: "Sabor de mii tierra",
    subtitle: "San Juan Bautista, Oaxaca",
    rating: 2,
  ),
];
