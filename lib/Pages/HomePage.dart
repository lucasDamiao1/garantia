import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Buttons(),
            Container(
              color: Colors.grey,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 50, left: 20, bottom: 20, right: 20),
                child: CardNoticias(),
              ),
            ),
          ],
        )
      ],
    ));
  }
}

void teste() {
  print('Teste');
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: teste,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: const Size(85, 85),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: teste,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: const Size(85, 85),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: teste,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: const Size(85, 85),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('esportes'),
                const SizedBox(
                  width: 60,
                ),
                Text('esportes'),
                const SizedBox(
                  width: 65,
                ),
                Text('esportes'),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: teste,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: const Size(85, 85),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: teste,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: const Size(85, 85),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: teste,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: const Size(85, 85),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('esportes'),
                const SizedBox(
                  width: 60,
                ),
                Text('esportes'),
                const SizedBox(
                  width: 65,
                ),
                Text('esportes'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardNoticias extends StatefulWidget {

  @override
  State<CardNoticias> createState() => _CardNoticiasState();
}

class _CardNoticiasState extends State<CardNoticias> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  var _listSlider = [
    {'id' : 0, 'image': 'images/bandeiras/bandeira-da-alemanha.png'},
    {'id' : 1, 'image': 'images/bandeiras/bandeira-da-espanha.png'},
    {'id' : 2, 'image': 'images/bandeiras/bandeira-da-italia.png'}
  ];

  @override
  void initState() {
    _pageController.addListener(() {
     // int next = _pageController.page.round();
      int next = 0;
     if(_currentPage != next){
       setState(() {
         _currentPage = next;
       });
     }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 334,
      width: 352,
      color: Colors.white,
      child: Column(
        children: <Widget>[
         Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _listSlider.length,
                itemBuilder: (_, currentIndex){
                  bool activePage = currentIndex == _currentPage;
                  return SliderTitle(
                    activePage: activePage
                  );
                },
              ),
            ),
          _buildBullets()
        ],
      ),
    );
  }

  Widget _buildBullets() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _listSlider.map((i){
            return  Container(
              margin: EdgeInsets.all(10),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: _currentPage == i['id'] ?Colors.red : Colors.grey),
            );
          }).toList(),
        )
    );
  }
}

class SliderTitle extends StatelessWidget {

  final bool activePage;
  // final String image;

  const SliderTitle({Key? key, required this.activePage, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Padding(padding: EdgeInsets.only(top: 15,bottom: 25,right: 20, left: 20),
       child:Column(
        children: [
          Container(
            height: 150,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            child: Text('Bom dia boa tarde boa noite Bom dia boa tarde boa noite '
                'Bom dia boa tarde boa noite Bom dia boa tarde boa noite '
                'Bom dia boa tarde boa noite'),
          ),
        ],
      ),
    ),
    );
  }
}



