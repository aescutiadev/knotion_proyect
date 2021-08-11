// Mocks generated by Mockito 5.0.14 from annotations
// in the_series_db/test/data/repositories/serie_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:the_series_db/data/datasource/serie_datasouce.dart' as _i3;
import 'package:the_series_db/domain/entities/serie_entity.dart' as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeClient_0 extends _i1.Fake implements _i2.Client {}

/// A class which mocks [SerieDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockSerieDataSourceImpl extends _i1.Mock
    implements _i3.SerieDataSourceImpl {
  MockSerieDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client => (super.noSuchMethod(Invocation.getter(#client),
      returnValue: _FakeClient_0()) as _i2.Client);
  @override
  _i4.Future<List<_i5.SerieEntity>> getSerieList() => (super.noSuchMethod(
          Invocation.method(#getSerieList, []),
          returnValue: Future<List<_i5.SerieEntity>>.value(<_i5.SerieEntity>[]))
      as _i4.Future<List<_i5.SerieEntity>>);
  @override
  String toString() => super.toString();
}
