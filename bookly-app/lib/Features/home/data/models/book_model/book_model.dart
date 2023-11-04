import 'package:booklyapp/Features/home/data/models/book_model/access_info.dart';
import 'package:booklyapp/Features/home/data/models/book_model/sale_info.dart';
import 'package:booklyapp/Features/home/data/models/book_model/search_info.dart';
import 'package:booklyapp/Features/home/data/models/book_model/volume_info.dart';

import 'item.dart';

class BookModel {
  String? kind;
  int? totalItems;
  List<Item>? items;
  VolumeInfo? volumeInfo;
  SearchInfo? searchInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;

  BookModel(
      {this.kind,
      this.totalItems,
      this.items,
      this.volumeInfo,
      this.searchInfo,
      this.saleInfo,
      this.accessInfo});

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        kind: json['kind'] as String?,
        totalItems: json['totalItems'] as int?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        volumeInfo: json['volumeInfo'] == null
            ? null
            : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
        searchInfo: json['searchInfo'] == null
            ? null
            : SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>),
        saleInfo: json['saleInfo'] == null
            ? null
            : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
        accessInfo: json['accessInfo'] == null
            ? null
            : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'totalItems': totalItems,
        'items': items?.map((e) => e.toJson()).toList(),
        'volumeInfo': volumeInfo?.toJson(),
        'searchInfo': searchInfo?.toJson(),
        'saleInfo': saleInfo?.toJson(),
                'accessInfo': accessInfo?.toJson(),

      };
}
