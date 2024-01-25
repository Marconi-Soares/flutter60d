class DocumentInfo {
  final String author;
  final DateTime createdDate;

  DocumentInfo(this.author, this.createdDate);
}

class Document {
  final String title;
  final DocumentInfo documentInfo;

  Document(this.title, this.documentInfo);

  void printInfo() {
    print('Document: $title');
    print('Author: ${documentInfo.author}');
    print('Created Date: ${documentInfo.createdDate}');
    print('---');
  }
}

void main() {
  var start = DateTime.now().millisecondsSinceEpoch;

  var authors = ["A", "B", "C"];

  final docs = [
    DocumentInfo(authors[0], DateTime(2023, 1, 0)),
    DocumentInfo(authors[1], DateTime(2023, 1, 1)),
    DocumentInfo(authors[2], DateTime(2023, 1, 2)),
  ];

  for (int i = 0; i <= 10000000; i++) {
    Document('Report $i', docs[i % 3]);
  }

  var end = DateTime.now().millisecondsSinceEpoch;
  print(end - start);
}
