import 'package:supper_keep_money/presentation/transaction/models/category_model.dart';
import 'package:supper_keep_money/presentation/transaction/models/money_model.dart';

class RecordModel {
  String? id;
  int? createDate;
  CategoryModel? cagtegory;
  MoneyModel? money;
  String? note;
  double? amount;
  bool? isIncludReport;

  RecordModel(
      {this.id,
      this.createDate,
      this.cagtegory,
      this.money,
      this.note,
      this.amount,
      this.isIncludReport});
}

class RecordNormal extends RecordModel {
  String? id2;

  RecordNormal({String? id, this.id2});
}

class RecordCryto extends RecordModel {}
