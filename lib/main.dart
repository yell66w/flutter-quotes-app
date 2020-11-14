import 'package:flutter/material.dart';
import 'package:second_app/widgets/QuoteCard.dart';
import 'Quote.dart';

void main() => runApp(MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  final _formKey = GlobalKey<FormState>();
  final messageController = TextEditingController();
  final authorController = TextEditingController();

  List<Quote> quotes = [
    Quote(
        author: 'Nelson Mandela',
        text:
            'The greatest glory in living lies not in never falling, but in rising every time we fall'),
    Quote(
        author: 'Walt Disney',
        text: 'The way to get started is to quit talkin and begin doing'),
    Quote(
        author: 'Eleanor Roosevelt',
        text:
            'If life were predictable it would cease to be life, and be without flavor.'),
    Quote(
        author: 'Eleanor Roosevelt',
        text:
            'If life were predictable it would cease to be life, and be without flavor.'),
  ];
  Widget quoteTemplate(Quote quote) {
    return QuoteCard(quote: quote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quotes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[500],
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[50],
      body: Column(
          children: quotes.map((quote) {
        return QuoteCard(
            quote: quote,
            delete: () {
              setState(() {
                quotes.remove(quote);
              });
            });
      }).toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              child: SimpleDialog(
                title: const Text('Add Quote'),
                children: <Widget>[
                  SimpleDialogOption(
                      onPressed: () {},
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Message',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter a message';
                                }
                                return null;
                              },
                              controller: messageController,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Author',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please identify the author';
                                }
                                return null;
                              },
                              controller: authorController,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      quotes.add(Quote(
                                          author: authorController.text,
                                          text: messageController.text));
                                    });
                                    authorController.text = '';
                                    messageController.text = '';
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ));
        },
        backgroundColor: Colors.red[500],
        child: Icon(Icons.add),
      ),
    );
  }
}
