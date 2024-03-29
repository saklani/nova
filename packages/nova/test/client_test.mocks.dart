// Mocks generated by Mockito 5.3.2 from annotations
// in nova/test/client_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:json_rpc_2/src/client.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i2.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> get done => (super.noSuchMethod(
        Invocation.getter(#done),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  _i3.Future<dynamic> listen() => (super.noSuchMethod(
        Invocation.method(
          #listen,
          [],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
  @override
  _i3.Future<dynamic> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
  @override
  _i3.Future<dynamic> sendRequest(
    String? method, [
    dynamic parameters,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendRequest,
          [
            method,
            parameters,
          ],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
  @override
  void sendNotification(
    String? method, [
    dynamic parameters,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #sendNotification,
          [
            method,
            parameters,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void withBatch(dynamic Function()? callback) => super.noSuchMethod(
        Invocation.method(
          #withBatch,
          [callback],
        ),
        returnValueForMissingStub: null,
      );
}
