import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class AnimatedNavBarPage extends StatefulWidget {
  @override
  _AnimatedNavBarPageState createState() => _AnimatedNavBarPageState();
}

class _AnimatedNavBarPageState extends State<AnimatedNavBarPage> {
  final _items = <Widget>[
    const Icon(Icons.search),
    const Icon(Icons.favorite),
    const Icon(Icons.home),
    const Icon(Icons.settings),
    const Icon(Icons.person),
  ];

  final _screens = [
    _Page1(),
    _Page2(),
    _Page3(),
    _Page4(),
    _Page5(),
  ];

  int _index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_index],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue,
        backgroundColor: Colors.transparent,
        index: _index,
        items: _items,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}

class _Page1 extends StatefulWidget {
  @override
  __Page1State createState() => __Page1State();
}

class __Page1State extends State<_Page1> {
  @override
  void initState() {
    print('inicia estado de la pagina 1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: const Center(
        child: Text('para buscar'),
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: const Center(
        child: Text('Soy para favoritos'),
      ),
    );
  }
}

class _Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Soy las configs'),
      ),
    );
  }
}

class _Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('el perfil'),
      ),
    );
  }
}

class _Page3 extends StatefulWidget {
  @override
  __Page3State createState() => __Page3State();
}

class __Page3State extends State<_Page3> with AutomaticKeepAliveClientMixin {
  ScrollController _controller = ScrollController();

  _listeningScroll() {
    final position = _controller.position.pixels;
    final a = _controller.position.maxScrollExtent - 100;
    print('-----------');
    print(position);
    print(a);
    if (position >= a) {
      print('cargar datos');
    }
  }

  @override
  void initState() {
    this._controller.addListener(_listeningScroll);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listeningScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        children: [
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/05/06/10/32/dog-2289451__340.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://neliosoftware.com/es/wp-content/uploads/sites/3/2018/07/aziz-acharki-549137-unsplash-1200x775.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://cdn2.mediotiempo.com/uploads/media/2021/02/13/las-imagenes-del-dia-del-11.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://estaticos.muyinteresante.es/media/cache/1140x_thumb/uploads/images/gallery/5f9a9dec5bafe87eb4bbcf9f/1-nubes-en-el-cielo_1.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/05/06/10/32/dog-2289451__340.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/05/06/10/32/dog-2289451__340.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/05/06/10/32/dog-2289451__340.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/05/06/10/32/dog-2289451__340.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/05/06/10/32/dog-2289451__340.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/05/06/10/32/dog-2289451__340.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/05/06/10/32/dog-2289451__340.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/05/06/10/32/dog-2289451__340.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://www.muycomputer.com/wp-content/uploads/2021/02/android.jpg',
            ),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/05/06/10/32/dog-2289451__340.jpg',
            ),
            fit: BoxFit.contain,
          ),
          // SizedBox(height: 60),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
