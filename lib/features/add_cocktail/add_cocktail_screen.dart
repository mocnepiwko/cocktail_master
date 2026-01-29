import 'dart:io';
import 'package:cocktail_master/core/lang/app_strings.dart';
import 'package:cocktail_master/data/database/local_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class AddCocktailScreen extends ConsumerStatefulWidget {
  const AddCocktailScreen({super.key});

  @override
  ConsumerState<AddCocktailScreen> createState() => _AddCocktailScreenState();
}

class _AddCocktailScreenState extends ConsumerState<AddCocktailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? _selectedImagePath;

  @override
  Widget build(BuildContext context) {
    // Получаем словарь
    final currentLang = ref.watch(languageNotifierProvider);
    final strings = AppStrings(currentLang);

    return Scaffold(
      appBar: AppBar(title: Text(strings.get('new_cocktail'))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormBuilderTextField(
                  name: 'name',
                  decoration: InputDecoration(
                    labelText: strings.get('name_label'),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.local_bar),
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? strings.get('name_error')
                      : null,
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'instructions',
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: strings.get('recipe_label'),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.description),
                  ),
                ),
                const SizedBox(height: 16),
                FormBuilderDateTimePicker(
                  name: 'date',
                  inputType: InputType.date,
                  decoration: InputDecoration(
                    labelText: strings.get('date_label'),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.calendar_today),
                  ),
                  initialValue: DateTime.now(),
                ),
                const SizedBox(height: 24),
                if (_selectedImagePath != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(_selectedImagePath!),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                OutlinedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.camera_alt),
                  label: Text(_selectedImagePath == null
                      ? strings.get('add_photo')
                      : strings.get('change_photo')),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => _saveCocktail(strings), // Передаем strings
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(strings.get('save_btn'),
                      style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImagePath = image.path;
      });
    }
  }

  Future<void> _saveCocktail(AppStrings strings) async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;
      final name = values['name'] as String;
      final instructions = values['instructions'] as String?;
      final date = values['date'] as DateTime;

      await ref.read(localRepositoryProvider).saveCocktail(
        name: name,
        date: date,
        imagePath: _selectedImagePath,
        instructions: instructions,
        ingredients: ['Custom'],
      );

      if (mounted) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(strings.get('saved_success'))),
        );
      }
    }
  }
}
