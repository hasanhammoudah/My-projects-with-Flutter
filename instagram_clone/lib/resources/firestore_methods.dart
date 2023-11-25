import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String postUrl,
    String profImage,
  ) async {
    String res = "some error occured";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1();
      Post post = Post(
          description: description,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now().toString(),
          postUrl: postUrl,
          profImage: profImage,
          likes: []);
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (e) {
      return e.toString();
    }
    return res;
  }
}
