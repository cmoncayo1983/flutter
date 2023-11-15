class Pizza {
  late Map<String, dynamic> _miPizza;

  Pizza(Map<String, dynamic> miPizza) {
    _miPizza = miPizza;
  }

  Map<String, dynamic> get getmiPizza {
    return this._miPizza;
  }

  void set setmiPizza(Map<String, dynamic> inputPizza) {
    this._miPizza = inputPizza;
  }

  //Funcion para calcular el total
  String totalPedido() {
    double cantidad = this._miPizza['cantidad'].toDouble();
    double precio = this._miPizza['precio'].toDouble();
    double totalOrden = cantidad * precio;
    return "Su pedido es de ${cantidad.toInt()} ${this._miPizza['tamanio']} con un valor total de \$ $totalOrden";
  }
}
