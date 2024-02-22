import 'package:flutter/material.dart';
import 'package:flutter_app_idcardnew/entity/quote.dart';


class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;

///构造函数
  const QuoteCard({
    super.key,required this.quote,required this.delete
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 5, 0, 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(quote.title,style: const TextStyle(color: Colors.amber,fontSize: 20),),
            const SizedBox(height: 8,),
            Text(quote.author,style: const TextStyle(color: Colors.amber,fontSize: 15),),
            const SizedBox(height: 8,),
            ElevatedButton(onPressed: (){
              delete();
            }, child:
              Row(
                children: [
                  Icon(Icons.delete),
                  Text('delete this quote')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}