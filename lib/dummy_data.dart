import './models/hotel.dart';

var DUMMY_HOTELS = [
  Hotel(
      id: '1',
      name: "Dummy April Glamping",
      starRating: 3,
      price: Price(amount: 639618, currency: 'IDR'),
      imageUrl:
          "https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/t_htl-mble/tix-hotel/images-web/2020/10/11/6346db58-a478-40a6-93d4-125bf9faae2f-1602371723641-cd3b969479bf7dfe785677fe9f737135.jpg",
      location: Location(
          area: "Kemayoran",
          address:
              "Jalan Bungur Besar Raya No.79-81, Kemayoran, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta, Indonesia",
          city: "Jakarta Pusat",
          country: "Indonesia")),
  Hotel(
      id: '2',
      name: "Dummy May Resort",
      starRating: 2,
      price: Price(amount: 200000, currency: 'IDR'),
      imageUrl:
          "https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/t_htl-mble/tix-hotel/images-web/2021/03/12/0f36ae56-058d-4352-bd04-b04f67a8c635-1615558045950-601523081007e7b3ea8ddfe97e41ab72.jpg",
      location: Location(
          area: "Kemayoran",
          address:
              "Jl. Mangga Besar VIII No.15D, RT.11/RW.1, Kota Tua, Kec. Taman Sari, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta",
          city: "Jakarta Pusat",
          country: "Indonesia")),
  Hotel(
      id: '3',
      name: "Dummy June Hotel",
      starRating: 3,
      price: Price(amount: 1798285, currency: 'IDR'),
      imageUrl:
          "https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/t_htl-mble/tix-hotel/images-web/2020/11/16/655ad163-3686-4b91-80d7-90cee6c5d9c6-1605507261957-7e053da933d88ff69734e77d2a88a0af.jpg",
      location: Location(
          area: "Kemayoran",
          address:
              "Jalan Palagan Tentara Pelajar, Sariharjo, Ngaglik, Sariharjo, Ngaglik, Kabupaten Sleman, Daerah Istimewa Yogyakarta 05581, Indonesia",
          city: "Sleman",
          country: "Indonesia")),
];
