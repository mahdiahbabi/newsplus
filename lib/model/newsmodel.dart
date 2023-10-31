



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
     this.id,
     this.name,
     this.author,
     this.title,
     this.description,
     this.url,
     this.urlToImage,
     this.publishedAt,
     this.content,
  });



  BreakingNewsModel.fromjson(Map<String, dynamic> element){

    
    id =element["source"]["id"] ?? 'cnn';
    name =element["source"]["name"] ?? 'cnn.com';
    author =element["author"] ?? 'Alex';
    title =element["title"] ?? 'dont have title';
    description =element["description"] ?? 'dont hava description';
    url =element["url"] ?? '';
    urlToImage =element["urlToImage"] ?? 'https://static.digiato.com/digiato/2023/07/image-4-910x600.jpg';
    publishedAt =element["publishedAt"] ?? '2023/07/14 ';
    content =element["content"] ?? 'dont hava description';
  }

}