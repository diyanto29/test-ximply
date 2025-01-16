// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final bool? status;
  final String? message;
  final dynamic errors;
  final PaginationProduct? data;

  ProductModel({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  ProductModel copyWith({
    bool? status,
    String? message,
    dynamic errors,
    PaginationProduct? data,
  }) =>
      ProductModel(
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        data: data ?? this.data,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        message: json["message"],
        errors: json["errors"],
        data: json["data"] == null
            ? null
            : PaginationProduct.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "errors": errors,
        "data": data?.toJson(),
      };
}

class PaginationProduct {
  final int? currentPage;
  final List<DataProduct>? dataProduct;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  PaginationProduct({
    this.currentPage,
    this.dataProduct,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  PaginationProduct copyWith({
    int? currentPage,
    List<DataProduct>? dataProduct,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    dynamic nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      PaginationProduct(
        currentPage: currentPage ?? this.currentPage,
        dataProduct: dataProduct ?? this.dataProduct,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        links: links ?? this.links,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory PaginationProduct.fromJson(Map<String, dynamic> json) =>
      PaginationProduct(
        currentPage: json["current_page"],
        dataProduct: json["data"] == null
            ? []
            : List<DataProduct>.from(
                json["data"]!.map((x) => DataProduct.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data_product": dataProduct == null
            ? []
            : List<dynamic>.from(dataProduct!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class DataProduct {
  final String? id;
  final String? sku;
  final String? name;
  final String? description;
  final String? price;
  final String? priceMember;
  final int? stock;
  final String? categoryId;
  final Category? category;
  final List<dynamic>? variants;
  final List<Image>? images;
  final Shipping? shipping;
  final List<dynamic>? options;
  final List<Shipper>? shippers;

  DataProduct({
    this.id,
    this.sku,
    this.name,
    this.description,
    this.price,
    this.priceMember,
    this.stock,
    this.categoryId,
    this.category,
    this.variants,
    this.images,
    this.shipping,
    this.options,
    this.shippers,
  });

  DataProduct copyWith({
    String? id,
    String? sku,
    String? name,
    String? description,
    String? price,
    String? priceMember,
    int? stock,
    String? categoryId,
    Category? category,
    List<dynamic>? variants,
    List<Image>? images,
    Shipping? shipping,
    List<dynamic>? options,
    List<Shipper>? shippers,
  }) =>
      DataProduct(
        id: id ?? this.id,
        sku: sku ?? this.sku,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        priceMember: priceMember ?? this.priceMember,
        stock: stock ?? this.stock,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category,
        variants: variants ?? this.variants,
        images: images ?? this.images,
        shipping: shipping ?? this.shipping,
        options: options ?? this.options,
        shippers: shippers ?? this.shippers,
      );

  factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
        id: json["id"],
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        priceMember: json["price_member"],
        stock: json["stock"],
        categoryId: json["category_id"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        variants: json["variants"] == null
            ? []
            : List<dynamic>.from(json["variants"]!.map((x) => x)),
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        shipping: json["shipping"] == null
            ? null
            : Shipping.fromJson(json["shipping"]),
        options: json["options"] == null
            ? []
            : List<dynamic>.from(json["options"]!.map((x) => x)),
        shippers: json["shippers"] == null
            ? []
            : List<Shipper>.from(
                json["shippers"]!.map((x) => Shipper.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "name": name,
        "description": description,
        "price": price,
        "price_member": priceMember,
        "stock": stock,
        "category_id": categoryId,
        "category": category?.toJson(),
        "variants":
            variants == null ? [] : List<dynamic>.from(variants!.map((x) => x)),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "shipping": shipping?.toJson(),
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
        "shippers": shippers == null
            ? []
            : List<dynamic>.from(shippers!.map((x) => x.toJson())),
      };
}

class Category {
  final String? id;
  final String? name;
  final DateTime? createdAt;

  Category({
    this.id,
    this.name,
    this.createdAt,
  });

  Category copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
      };
}

class Image {
  final String? id;
  final String? productId;
  final String? imagePath;

  Image({
    this.id,
    this.productId,
    this.imagePath,
  });

  Image copyWith({
    String? id,
    String? productId,
    String? imagePath,
  }) =>
      Image(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        imagePath: imagePath ?? this.imagePath,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["product_id"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image_path": imagePath,
      };
}

class Shipper {
  final int? id;
  final String? name;
  final String? code;

  Shipper({
    this.id,
    this.name,
    this.code,
  });

  Shipper copyWith({
    int? id,
    String? name,
    String? code,
  }) =>
      Shipper(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
      );

  factory Shipper.fromJson(Map<String, dynamic> json) => Shipper(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
      };
}

class Shipping {
  final int? weight;
  final int? length;
  final int? width;
  final int? height;

  Shipping({
    this.weight,
    this.length,
    this.width,
    this.height,
  });

  Shipping copyWith({
    int? weight,
    int? length,
    int? width,
    int? height,
  }) =>
      Shipping(
        weight: weight ?? this.weight,
        length: length ?? this.length,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        weight: json["weight"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "weight": weight,
        "length": length,
        "width": width,
        "height": height,
      };
}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  Link copyWith({
    String? url,
    String? label,
    bool? active,
  }) =>
      Link(
        url: url ?? this.url,
        label: label ?? this.label,
        active: active ?? this.active,
      );

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
