import 'package:flutter/material.dart';

class BankGridWidget extends StatelessWidget {
  final List<String> imagePaths;
  final Function(String imagePath) onTap;

  const BankGridWidget({
    Key? key,
    required this.imagePaths,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green[100]),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          for (int i = 0; i < imagePaths.length; i += 4)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: imagePaths
                    .skip(i)
                    .take(4)
                    .map((path) => _buildBankImage(path))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }

  Widget _buildBankImage(String path) {
    return GestureDetector(
      onTap: () => onTap(path),
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(0.1),
        alignment: Alignment.center,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              path,
              height: 80,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
