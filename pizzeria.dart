import 'dart:io';
import 'pizza.dart';

void main() {
  String? seleccionUsuario;
  String? cantidadString;
  int? cantidadNumerica;
  double precioSmall = 10.00,
      precioMedium = 20.00,
      precioBig = 30.00,
      auxPrecio = 0; // definicion de precios
  // Definición de menu principal
  Map<String, String> miMenu = {
    '1': "Pizza Grande",
    '2': "Pizza Mediana",
    '3': "Pizza Pequeña",
    '4': "Salir"
  };
//
  print("Bienvenido a la Pizzería de Carlos");
  Pizza miPizza = Pizza({});
  do {
    print("         Menu Principal");
    do {
      imprimeMenu(miMenu, precioBig, precioMedium, precioSmall);
      print('Ingrese una opción del menú');
      seleccionUsuario = stdin.readLineSync(); //pide un input al usuario
    } while (seleccionUsuario == null ||
        seleccionUsuario.isEmpty ||
        !miMenu.containsKey(seleccionUsuario));
    if (seleccionUsuario == '4') {
      print('Gracias por visitarnos..');
      exit(0);
    }
    print("Ha seleccionado ${miMenu[seleccionUsuario]}");
    do {
      print('Cuantas pizzas quiere?');
      cantidadString = stdin.readLineSync();
      try {
        if (cantidadString != null)
          cantidadNumerica = int.parse(cantidadString);
      } catch (e) {
        print('La entrada no es un número válido.');
      }
      if (cantidadNumerica != null && cantidadNumerica <= 0) {
        print('Debe ingresar una cantidad mayor a cero(0).');
      } else {
        switch (seleccionUsuario) {
          case '1': //pizza grande
            auxPrecio = precioBig;
            break;
          case '2': //pizza mediana
            auxPrecio = precioMedium;
            break;
          case '3': //pizza pequena
            auxPrecio = precioSmall;
            break;
        }
      }
    } while (cantidadNumerica == null || cantidadNumerica <= 0);
    //Instancio objeto pizza
    miPizza.setmiPizza = {
      'precio': auxPrecio,
      'tamanio': miMenu['$seleccionUsuario'],
      'cantidad': cantidadNumerica
    };
    print(miPizza.totalPedido());

    print("Desea realizar otro pedido s/n ?");
    seleccionUsuario = stdin.readLineSync();
  } while (seleccionUsuario != null && seleccionUsuario.toLowerCase() == 's');
  print("¡Gracias por su compra!");
}

///
///Funcion que imprime el menú definido en mi mapa
///
void imprimeMenu(
    Map menu, double precioBig, double precioMedium, double precioSmall) {
  menu.forEach((key, value) {
    switch (key) {
      case '1':
        print("$key: $value  \$ $precioBig");
        break;
      case '2':
        print("$key: $value \$ $precioMedium");
        break;
      case '3':
        print("$key: $value \$ $precioSmall");
        break;
      case '4':
        print("$key: $value");
        break;
    }
  });
}

//////

