import 'package:flutter/material.dart';
import 'package:flutter_mk/blocs/read/read_bloc.dart';
import 'package:flutter_mk/common/commons.dart';
import 'package:flutter_mk/models/user_book.dart';
import 'package:flutter_mk/pages/stat/stat_page.dart';
import 'package:flutter_mk/views/read/book_detail_card.dart';
import 'package:flutter_mk/views/read/book_stat_card.dart';
import 'package:flutter_mk/views/read/read_excerpt_card.dart';
import 'package:flutter_mk/views/read/read_progress_card.dart';

class BookDetailPage extends StatefulWidget {
  final UserBook userBook;

  BookDetailPage(this.userBook);

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userBook.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                      BookDetailCard(widget.userBook.id),
                      BookStatCard(widget.userBook),
                      ReadProgressCard(widget.userBook),
                      ReadExcerptCard(
                          userBook: widget.userBook,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                              RaisedButton(
                                  onPressed: removeBook,
                                  child: Text("删除本书"),
                              ),
                              RaisedButton(
                                  onPressed: bookEdit,
                                  child: Text("书籍选项"),
                              ),
                          ],
                      )
                  ],
              ),
        ),
      ),
    );
  }

  void removeBook() {
  }

  void bookEdit() {
      Navigator.push(context, MaterialPageRoute(builder: (context){
          return StatChart.withSampleData();
      }));
  }
}
