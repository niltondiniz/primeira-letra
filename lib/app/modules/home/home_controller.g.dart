// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<ImageRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listImageAtom = Atom(name: '_HomeControllerBase.listImage');

  @override
  ObservableList<ImageModel> get listImage {
    _$listImageAtom.reportRead();
    return super.listImage;
  }

  @override
  set listImage(ObservableList<ImageModel> value) {
    _$listImageAtom.reportWrite(value, super.listImage, () {
      super.listImage = value;
    });
  }

  final _$actualImageAtom = Atom(name: '_HomeControllerBase.actualImage');

  @override
  ImageModel get actualImage {
    _$actualImageAtom.reportRead();
    return super.actualImage;
  }

  @override
  set actualImage(ImageModel value) {
    _$actualImageAtom.reportWrite(value, super.actualImage, () {
      super.actualImage = value;
    });
  }

  final _$valueAtom = Atom(name: '_HomeControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$acertosAtom = Atom(name: '_HomeControllerBase.acertos');

  @override
  int get acertos {
    _$acertosAtom.reportRead();
    return super.acertos;
  }

  @override
  set acertos(int value) {
    _$acertosAtom.reportWrite(value, super.acertos, () {
      super.acertos = value;
    });
  }

  final _$errosAtom = Atom(name: '_HomeControllerBase.erros');

  @override
  int get erros {
    _$errosAtom.reportRead();
    return super.erros;
  }

  @override
  set erros(int value) {
    _$errosAtom.reportWrite(value, super.erros, () {
      super.erros = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void addImage(ImageModel image) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addImage');
    try {
      return super.addImage(image);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActualImage(ImageModel image) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setActualImage');
    try {
      return super.setActualImage(image);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementAcertos() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.incrementAcertos');
    try {
      return super.incrementAcertos();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementErros() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.incrementErros');
    try {
      return super.incrementErros();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listImage: ${listImage},
actualImage: ${actualImage},
value: ${value},
acertos: ${acertos},
erros: ${erros}
    ''';
  }
}
