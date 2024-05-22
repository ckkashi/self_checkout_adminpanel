import 'package:flutter/material.dart';

class AddStoreView extends StatelessWidget {
  const AddStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Store'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AddStoreForm(),
            ),
          ),
          VerticalDivider(width: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ExampleResponses(),
            ),
          ),
        ],
      ),
    );
  }
}

class AddStoreForm extends StatefulWidget {
  @override
  _AddStoreFormState createState() => _AddStoreFormState();
}

class _AddStoreFormState extends State<AddStoreForm> {
  final _formKey = GlobalKey<FormState>();
  final _storeNameController = TextEditingController();
  final _latlngController = TextEditingController();
  final _getApiController = TextEditingController();
  final _postApiController = TextEditingController();
  final _addedByController = TextEditingController(text: '0');

  @override
  void dispose() {
    _storeNameController.dispose();
    _latlngController.dispose();
    _getApiController.dispose();
    _postApiController.dispose();
    _addedByController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final formData = {
        "storename": _storeNameController.text,
        "latlng": _latlngController.text,
        "getapi": _getApiController.text,
        "postapi": _postApiController.text,
        "addedby": _addedByController.text,
      };
      print("Form Data: $formData");
      // Here you can send the form data to your backend or perform any action you need
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            controller: _storeNameController,
            decoration: InputDecoration(labelText: 'Store Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter store name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _latlngController,
            decoration: InputDecoration(labelText: 'Latitude, Longitude'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter latitude and longitude';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _getApiController,
            decoration: InputDecoration(labelText: 'GET API URL'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter GET API URL';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _postApiController,
            decoration: InputDecoration(labelText: 'POST API URL'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter POST API URL';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _addedByController,
            decoration: InputDecoration(labelText: 'Added By'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter added by';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Add Store'),
          ),
        ],
      ),
    );
  }
}

class ExampleResponses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('GET API Example Response',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Image.network(
            'https://drive.google.com/file/d/1rBO58c-X2rU2LO78wFYe1tbyiF9zF8gz/preview',
            fit: BoxFit.cover),
        SizedBox(height: 20),
        Text('POST API Example Response',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Image.network(
            'https://drive.google.com/file/d/1_pg7-bmNmewXTvRxJZseKzC6VD0S_PWe/view',
            fit: BoxFit.cover),
      ],
    );
  }
}
