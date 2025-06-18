import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Song extends StatelessWidget {
  const Song({super.key});

  Future<List<Map<String, dynamic>>> fetchSongs() async {
    final snapshot = await FirebaseFirestore.instance.collection('songs').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Songs")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchSongs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final songs = snapshot.data;

          if (songs == null || songs.isEmpty) {
            return const Center(child: Text("No songs found"));
          }

          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return ListTile(
                title: Text(song['title'] ?? 'No Title'),
                subtitle: Text(song['artist'] ?? 'Unknown Artist'),
                trailing: const Icon(Icons.play_arrow),
                onTap: () {
                  print("Playing ${song['title']}");
                  // Optionally: playAudio(song['url']);
                },
              );
            },
          );
        },
      ),
    );
  }
}
