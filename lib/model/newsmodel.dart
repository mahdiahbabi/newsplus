



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
    description =element["description"];
    url =element["url"];
    urlToImage =element["urlToImage"];
    publishedAt =element["publishedAt"];
    content =element["content"] ?? 'General';
  }

}