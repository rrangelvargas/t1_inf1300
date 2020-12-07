import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:t1_inf1300/utils/localizations.dart';
import 'package:t1_inf1300/model/Product.dart';
import 'package:t1_inf1300/AddProduct.dart';
import 'package:t1_inf1300/cartView.dart';
import 'package:t1_inf1300/style/StyledRaisedButtonLong.dart';
import 'controller/controller.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class NewRequest extends StatefulWidget {
  NewRequest();

  @override
  _NewRequestState createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  List<Product> _products = List<Product>();
  List<Product> _filteredList = List<Product>();

  TextEditingController textController = new TextEditingController();
  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
    initSpeechState();
    getProducts();
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);

    print(hasSpeech);
    setState(() {
      _hasSpeech = hasSpeech;
    });

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext buildContext) {
    final controller = Provider.of<Controller>(context);

    var width = MediaQuery.of(context).size.width * 0.8;
    print(controller.products.length);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  filterSearchResults(value);
                });
              },
              controller: textController,
              decoration: InputDecoration(
                  hintText: MyLocalizations.of(context).translate("search"),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: !_hasSpeech || speech.isListening
                        ? null
                        : startListening,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)))),
            ),
          ),
          _filteredList.isEmpty
              ? Container(
                  width: width,
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Text(
                    MyLocalizations.of(context).translate("searchHelp"),
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ))
              : Expanded(
                  child: ListView.builder(
                      itemCount: _filteredList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Product product = _filteredList[index];
                        return GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AddProduct(product: product);
                                  });
                            },
                            child: _buildRow(product));
                      }),
                ),
          _filteredList.isEmpty & controller.cartIsEmpty
              ? Text("")
              : Observer(
                  builder: (_) => StyledRaisedButtonLong(
                      title: MyLocalizations.of(context).translate("addToCart"),
                      callback: _navigateToCart,
                      isEnable: !controller.cartIsEmpty),
                )
        ],
      )),
    );
  }

  void getProducts() async {
    _products.add(new Product(
        10,
        "Dorflex",
        "20.0",
        "Medicamento destinado a para dores",
        "https://img.onofre.com.br/catalog/product/d/o/dorflex-com-10-comprimidos--7891058017392_hero1.jpg?width=265&height=265&quality=50&type=resize"));
    _products.add(new Product(
        100,
        "Dipirona",
        "10.0",
        "Medicamento destinado a para adultos",
        "https://drogariasp.vteximg.com.br/arquivos/ids/168973-500-500/7896422507066.JPG.jpg?v=635651364067870000"));

    setState(() {});
  }

  _buildRow(Product product) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
      child: Card(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image(
              image: NetworkImage(product.image),
              width: 50,
              height: 50,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(product.name),
                  Text(product.description)
                ]),
          ),
          Expanded(
            flex: 2,
            child: Text('RS ${product.price}'),
          ),
        ],
      )),
    );
  }

  void _navigateToCart() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => new CartView()));
  }

  void filterSearchResults(String query) {
    _filteredList.clear();
    if (query.isNotEmpty) {
      _products.forEach((element) {
        if (element.name.toLowerCase().contains(query.toLowerCase())) {
          _filteredList.add(element);
        }
      });
    }

    setState(() {});
  }

  void startListening() {
    lastWords = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 10),
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        localeId: "pt_BR",
        listenMode: ListenMode.confirmation);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      textController.text = "${result.recognizedWords}";
      filterSearchResults("${result.recognizedWords}");
    });
  }

  void errorListener(SpeechRecognitionError error) {
    print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    print(
        "Received listener status: $status, listening: ${speech.isListening}");
    setState(() {
      lastStatus = "$status";
    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }
}
