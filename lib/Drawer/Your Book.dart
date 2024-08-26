import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ebooktest/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Your_Book extends StatefulWidget {
  const Your_Book({super.key});

  @override
  Your_BookState createState() => Your_BookState();
}

class Your_BookState extends State<Your_Book> {
  final TextEditingController _booktitleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _evaluateController = TextEditingController();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> _addBook() async {
    try {
      // Save user data to Firestore
      await db.collection('booklist').add({
        'booktitle': _booktitleController.text,
        'author': _authorController.text,
        'price': _priceController.text,
        'evaluate': _evaluateController.text,
      });

      if (!mounted) return;

      // Navigate to a new page on successful sign-up (optional)
      Navigator.pushNamed(context,'/Home');
    } catch (e) {
      // Handle error
      print('Failed to sign up: $e');
    }
  }

  Future<void> _deleteBookDocument(String documentId) async {
    try {
      await db.collection('booklist').doc(documentId).delete();
      print("Document with ID $documentId deleted");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Document deleted successfully')),
      );
    } catch (e) {
      print("Error deleting document $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete document: $e')),
      );
    }
  }

  Future<void> _getBookData(String documentId) async {
    try {
      DocumentSnapshot doc = await db.collection('booklist').doc(documentId).get();
      final data = doc.data() as Map<String, dynamic>;
      print("Document data: $data");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data retrieved: ${data['username']}')),
      );
    } catch (e) {
      print("Error getting document: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to get document: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book System"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Add your favourite books',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'booktitle',
              ),
              controller: _booktitleController,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'author',
              ),
              controller: _authorController,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'price',
              ),
              controller: _priceController,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'evaluate',
              ),
              controller: _evaluateController,
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _addBook,
                child: const Text('Add Book'),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Replace 'documentId' with the actual document ID you want to get
                  _getBookData('as18KuVTe6y4lC7wtzsc');
                },
                child: const Text('Get Book Data'),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _deleteBookDocument('bFcwe7CLKriT8YA391V5');
                },
                child: const Text('Delete Book Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
