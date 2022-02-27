import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/provider/fetching_photos.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photos>>(
      future: getPhotosList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Photos',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: GridView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 500,
                // childAspectRatio: MediaQuery.of(context).size.width /
                //     (MediaQuery.of(context).size.height / 1.85),
              ),
              itemBuilder: (BuildContext context, int i) {
                return getUser(snapshot.data![i]);
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              'It may take a while!',
            ),
          ],
        );
      },
    );
  }

  Widget getUser(photo) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(15),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: ClipOval(
              child: Image.network(photo.url, fit: BoxFit.fill),
            ),
            title: Text(photo.title),
            subtitle: Text(
              'ID: ${photo.id}',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Image.network(photo.url, fit: BoxFit.fitWidth),
        ],
      ),
    );
  }
}
