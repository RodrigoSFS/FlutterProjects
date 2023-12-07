import 'dart:io';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// stf
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: null,
          icon: Icon(PhosphorIcons.regular.magnifyingGlass),
          color: Colors.black54,
        ),
        title: Text('Perfil',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(PhosphorIcons.regular.bell),
            color: Colors.black54,
          )
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.grey[200],
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                          imageFile != null ? FileImage(imageFile!) : null,
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 5,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(
                            PhosphorIcons.regular.pencilSimple,
                            color: Colors.grey[400],
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 30),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(
                      padding: const EdgeInsets.all(20),
                      label: Text('Viagens',
                          style: Theme.of(context).textTheme.titleSmall),
                      backgroundColor: Colors.white,
                    ),
                    Chip(
                      padding: const EdgeInsets.all(20),
                      label: Text('Eventos',
                          style: Theme.of(context).textTheme.titleSmall),
                      backgroundColor: Colors.white,
                    ),
                    Chip(
                      padding: const EdgeInsets.all(20),
                      label: Text('Informações',
                          style: Theme.of(context).textTheme.titleSmall),
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey[200],
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                          NetworkImage('https://picsum.photos/200'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Viagens',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                      Text('Recordações',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
