import 'package:booklyapp/Features/home/data/models/book_model/access_info.dart';
import 'package:booklyapp/Features/home/data/models/book_model/sale_info.dart';
import 'package:booklyapp/Features/home/data/models/book_model/search_info.dart';
import 'package:booklyapp/Features/home/data/models/book_model/volume_info.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';

import 'item.dart';

class BookModel extends BookEntity {
  String? kind;
  int? totalItems;
  String? id;
  List<Item>? items;
  VolumeInfo? volumeInfo;
  SearchInfo? searchInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;

  // لم نعد بحاجة لتعريف الفئات هنا

  BookModel({
    this.kind,
    this.totalItems,
    this.items,
    this.volumeInfo,
    this.searchInfo,
    this.saleInfo,
    this.accessInfo,
    this.id,
    required List<String> categories, // تمرير الفئات إلى `BookEntity`
  }) : super(
          bookId: id!,
          image: volumeInfo?.imageLinks?.thumbnail ?? '',
          authorName: volumeInfo?.authors?.first ?? 'No Name',
          price: 0.0,
          rating: volumeInfo!.averageRating,
          title: volumeInfo.title!,
          categories: categories, // تمرير الفئات إلى `BookEntity`
        );

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
        categories: (json['volumeInfo']['categories'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [], // استخراج الفئات من JSON وتمريرها إلى `BookEntity`
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
