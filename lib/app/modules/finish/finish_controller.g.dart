// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finish_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $FinishController = BindInject(
  (i) => FinishController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FinishController on _FinishControllerBase, Store {
  final _$valueAtom = Atom(name: '_FinishControllerBase.value');

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

  final _$_FinishControllerBaseActionController =
      ActionController(name: '_FinishControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_FinishControllerBaseActionController.startAction(
        name: '_FinishControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_FinishControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
