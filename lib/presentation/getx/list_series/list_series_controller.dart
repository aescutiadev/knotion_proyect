import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:the_series_db/core/failure.dart';
import 'package:the_series_db/domain/entities/serie_entity.dart';
import 'package:the_series_db/domain/usecases/get_list_of_series_usecase.dart';

class ListSeriesController extends GetxController with StateMixin {
  final GetListUseCase getListUseCase;

  final serieList = <SerieEntity>[].obs;

  ListSeriesController(this.getListUseCase);

  @override
  void onInit() {
    super.onInit();
    change('cargando...', status: RxStatus.empty());
    fetchSeriesList();
  }

  void fetchSeriesList() async {
    change('Cargando...', status: RxStatus.loading());
    final failureOrUseEntity = await getListUseCase();
    _failureOrSerieList(failureOrUseEntity);
  }

  _failureOrSerieList(Either<Failure, List<SerieEntity>> either) {
    return either.fold(
      (failure) => _error(failure),
      (list) => _getListSeries(list),
    );
  }

  _getListSeries(List<SerieEntity> list) {
    serieList.value = list;
    update();
    change('Success', status: RxStatus.success());
  }

  _error(Failure failure) {
    String _errorMessage = _mapFailureToMessage(failure);
    change('Error', status: RxStatus.error(_errorMessage));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.message;
      default:
        return 'Error desconocido';
    }
  }
}
