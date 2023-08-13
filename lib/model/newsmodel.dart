



class BreakingNewsModel{

  String? id;
  String? name;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;




  BreakingNewsModel({
    required this.id,
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });



  BreakingNewsModel.fromjson(Map<String, dynamic> element){

    
    id =element["source"]["id"];
    name =element["source"]["name"];
    author =element["author"] ?? 'Alex';
    title =element["title"];
    description =element["description"] ?? 'dont hava description';
    url =element["url"] ?? '';
    urlToImage =element["urlToImage"] ?? 'https://static.digiato.com/digiato/2023/07/image-4-910x600.jpg';
    publishedAt =element["publishedAt"];
    content =element["content"] ?? 'dont hava description';
  }

}