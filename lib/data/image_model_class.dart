class ImageModel {
  final List<ImageModelItem> items;
  ImageModel({required this.items});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      items: (json['items'] as List)
          .map((item) => ImageModelItem.fromJson(item))
          .toList(),
    );
  }
}

class ImageModelItem {
  final String title, link;
  ImageModelItem({required this.title, required this.link});

  factory ImageModelItem.fromJson(Map<String, dynamic> json) {
    return ImageModelItem(title: json['title'], link: json['link']);
  }
}
