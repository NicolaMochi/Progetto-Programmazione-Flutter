import 'package:flutter/material.dart';

class DettaglioEvento extends StatefulWidget {
  Map events = Map(); // map of events that we will receive from homepage events

  DettaglioEvento({Key? key, required this.events}) : super(key: key);

  @override
  State<DettaglioEvento> createState() => _DettaglioEventoState();
}

class _DettaglioEventoState extends State<DettaglioEvento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dettaglio evento'),
        elevation: 20.0,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  //image:DecorationImage(image: )
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.events['titolo'],
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.euro,
                          color: Colors.orangeAccent,
                        ),
                        Text(
                          widget.events['costo'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.event,
                          color: Colors.orangeAccent,
                        ),
                        Text(
                          widget.events['data_evento'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.category,
                          color: Colors.orangeAccent,
                        ),
                        Text(
                          widget.events['categoria'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.where_to_vote,
                          color: Colors.orangeAccent,
                        ),
                        Text(
                          widget.events['citta'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ', ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.events['indirizzo'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Descrizione:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.events['descrizione'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
