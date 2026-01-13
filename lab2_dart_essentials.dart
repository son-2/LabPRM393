import 'dart:async';

void main() async {
  print('LAB 2 - TA NAM SON - HE181601');
  print('');

  print('===== EXERCISE 1 =====');
  exercise1();
  print('');

  print('===== EXERCISE 2 =====');
  exercise2();
  print('');

  print('===== EXERCISE 3 =====');
  exercise3();
  print('');

  print('===== EXERCISE 4 =====');
  exercise4();
  print('');

  print('===== EXERCISE 5 =====');
  await exercise5();
  print('');

  print('END OF LAB 2');
}

// Ex1
void exercise1() {
  // Khai bao bien kieu so nguyen
  int age = 20;

  // Khai bao bien kieu so thuc
  double gpa = 3.5;

  // Khai bao bien kieu chuoi
  String name = 'Son';

  // Khai bao bien kieu dung / sai
  bool isStudent = true;

  // In gia tri ra console
  print('Ten sinh vien: $name');
  print('Tuoi hien tai: $age');
  print('Diem GPA: $gpa');
  print('La sinh vien hay khong: $isStudent');

  // String interpolation voi bieu thuc
  print('Tuoi nam sau se la: ${age + 1}');
}

// Ex2
void exercise2() {
  // Tao mot danh sach so nguyen (List)
  List<int> numbers = [1, 2, 3,4];

  // Them phan tu vao List
  numbers.add(4);

  // Xoa phan tu khoi List
  numbers.remove(1);

  // In List ra man hinh
  print('Danh sach numbers la j: $numbers');

  // Truy cap phan tu dau tien trong List
  print('Phan tu dau tien cua List: ${numbers[0]}');

  // Khai bao hai bien so nguyen
  int a = 10;
  int b = 5;

  // Su dung cac toan tu co ban
  print('Tong a + b = ${a + b}');
  print('Hieu a - b = ${a - b}');
  print('a bang b hay khong = ${a == b}');
  print('a lon hon b va b lon hon 0 = ${a > b && b > 0}');

  // Tao Set (k cho phep gia tri trung lap)
  Set<int> numberSet = {1, 2, 2, 3};

  // In Set ra man hinh
  print('Gia tri trong Set: $numberSet');

  // Tao Map voi cap key - value
  Map<String, int> scores = {
    'Math': 90,
    'English': 85,
  };

  // Them mot cap key - value moi vao Map
  scores['Science'] = 88;

  // In Map ra man hinh
  print('Danh sach diem: $scores');

  // Lay gia tri bang key
  print('Diem mon Math: ${scores['Math']}');
}

// Ex3
void exercise3() {
  // Kiem tra diem bang if / else
  int score = 75;

  if (score >= 80) {
    print('Xep loai: Gioi');
  } else if (score >= 60) {
    print('Xep loai: Kha');
  } else {
    print('Xep loai: Trung binh');
  }

  // Su dung switch case
  int day = 3;

  switch (day) {
    case 1:
      print('Hom nay la Thu Hai');
      break;
    case 2:
      print('Hom nay la Thu Ba');
      break;
    case 3:
      print('Hom nay la Thu Tu');
      break;
    default:
      print('Ngay khong xac dinh');
  }

  // Tao danh sach de lap
  List<int> list = [1, 2, 3];

  // Lap bang for thong thuong
  for (int i = 0; i < list.length; i++) {
    print('Gia tri (for): ${list[i]}');
  }

  // Lap bang for-in
  for (int item in list) {
    print('Gia tri (for-in): $item');
  }

  // Lap bang forEach
  list.forEach((item) {
    print('Gia tri (forEach): $item');
  });

  // Goi ham thong thuong
  int sum = add(3, 4);
  print('Ket qua ham add: $sum');

  // Goi ham arrow
  int product = multiply(3, 4);
  print('Ket qua ham multiply: $product');
}

// Ham cong hai so
int add(int x, int y) {
  return x + y;
}

// Ham nhan hai so (arrow function)
int multiply(int x, int y) => x * y;

// Ex4
void exercise4() {
  // Tao doi tuong Car bang constructor thuong
  Car car1 = Car('Toyota');
  car1.run();

  // Tao doi tuong Car bang named constructor
  Car car2 = Car.named('Honda');
  car2.run();

  // Tao doi tuong ElectricCar (ke thua Car)
  ElectricCar eCar = ElectricCar('Tesla');
  eCar.run();
}

// Lop Car
class Car {
  // Thuoc tinh cua lop
  String brand;

  // Constructor
  Car(this.brand);

  // Named constructor
  Car.named(this.brand);

  // Phuong thuc
  void run() {
    print('Xe $brand dang chay');
  }
}

// Lop ElectricCar ke thua tu lop Car
class ElectricCar extends Car {
  // Constructor cua lop con
  ElectricCar(String brand) : super(brand);

  // Ghi de phuong thuc run
  @override
  void run() {
    print('Xe dien $brand dang chay rat la em ai');
  }
}

// Ex5
Future<void> exercise5() async {
  // Goi ham bat dong bo
  print('Dang tai du lieu...');
  String data = await loadData();
  print(data);

  // Vi du ve null safety
  String? name;

  // Neu name la null thi in gia tri mac dinh
  print(name ?? 'Gia tri name dang null');

  // Gan gia tri cho bien name
  name = 'Flutter';

  // Dung dau ! khi chac chan bien khong con null
  print(name!.toUpperCase());

  // Tao va lang nghe Stream
  Stream<int> stream = countStream();
  stream.listen((value) {
    print('Gia tri tu Stream: $value');
  });
}

// Ham bat dong bo tra ve Future
Future<String> loadData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Tai du lieu thanh cong';
}

// Ham tao Stream so nguyen
Stream<int> countStream() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
