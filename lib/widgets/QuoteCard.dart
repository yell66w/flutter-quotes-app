import 'package:flutter/material.dart';
import 'package:second_app/Quote.dart';

class QuoteCard extends StatefulWidget {
  final Quote quote;
  final Function delete;

  QuoteCard({this.quote,this.delete});
  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.format_quote_sharp),
              title: Text(widget.quote.author),
              subtitle: Text(widget.quote.text),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: widget.quote.liked ? Colors.red : Colors.grey,
                  ),
                  splashRadius: 20,
                  onPressed: () {
                    setState(() {
                      widget.quote.liked = !widget.quote.liked;
                      if (widget.quote.liked)
                        widget.quote.likes++;
                      else
                        widget.quote.likes--;
                    });
                  },
                ),
                IconButton(icon: Icon(Icons.delete), onPressed: widget.delete,
                  splashRadius: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
