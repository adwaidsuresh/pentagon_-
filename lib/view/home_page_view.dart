import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pentagon_1/components/text_components.dart';
import 'package:pentagon_1/provider/api_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(getpostProvider);
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          title: const Text('Back'),
        ),
        body: api.when(
          data: (data) {
            if (data == null) {
              return const Center(
                child: CircleAvatar(),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              'Verification page',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 30),
                            ),
                            Text('Fill your personal information'),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Personal Info [Form 1]',
                              style: TextStyle(
                                  color: Color(0xBAE91E62),
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'First name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      CustomizedTextfield(
                        hinttext: 'Enter your name:${data[index].id}',
                        label: '',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Last name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      CustomizedTextfield(
                        hinttext: 'Enter last name:${data[index].description}',
                        label: '',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'DOB ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      CustomizedTextfield(
                        hinttext: 'DD/MM/YY:${data[index].price}',
                        label: '',
                        icon: Icons.calendar_month,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Upload a photo or take selfie ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          width: 360,
                          height: 50,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xAFF4F0F0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Choose File',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xE4E91E62),
                                  shape: const ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'No File Selected',
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: TextButton.styleFrom(
                                    // backgroundColor: Color(0xE4E91E62),
                                    shape: const ContinuousRectangleBorder()),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Continue',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: TextButton.styleFrom(
                            minimumSize: const Size(350, 45),
                            backgroundColor:
                                const Color.fromARGB(227, 224, 13, 84),
                            shape: const ContinuousRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text('error'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
