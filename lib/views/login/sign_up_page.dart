import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:wabiz/model/login/login_model.dart';
import 'package:wabiz/theme.dart';
import 'package:wabiz/view_model/login/login_view_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController password2TextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  bool validated = false;

  @override
  void dispose() {
    // TODO: implement dispose
    emailTextController.dispose();
    usernameTextController.dispose();
    passwordTextController.dispose();
    password2TextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '이메일 간편가입',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.wabizGray[900],
                  ),
                ),
                const Gap(20),
                const Text(
                  '이메일 계정',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(12),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: emailTextController,
                        decoration: const InputDecoration(
                          hintText: '아이디 입력',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '필수 입력 항목입니다.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Gap(12),
                    Consumer(builder: (context, ref, child) {
                      return GestureDetector(
                        onTap: () async {
                          final result = await ref
                              .read(loginViewModelProvider.notifier)
                              .checkEmail(
                                LoginModel(
                                  email: emailTextController.text.trim(),
                                ),
                              );

                          if (context.mounted) {
                            if (result) {
                              showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  content: Text('등록 가능한 아이디 입니다.'),
                                ),
                              );
                              validated = true;
                              return;
                            } else {
                              validated = false;
                              showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  content: Text(
                                    '등록 불가능한 아이디 입니다.\n이미 등록된 아이디가 있습니다.',
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        child: Container(
                          height: 56,
                          width: 90,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(.55),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              '인증하기',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                const Gap(20),
                const Text(
                  '이름',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(12),
                TextFormField(
                  controller: usernameTextController,
                  decoration: const InputDecoration(
                    hintText: '이름 입력',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '필수 입력 항목입니다.';
                    }
                    return null;
                  },
                ),
                const Gap(20),
                const Text(
                  '비밀번호',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(12),
                TextFormField(
                  controller: passwordTextController,
                  decoration: InputDecoration(
                    hintText: '비밀번호 입력',
                    filled: true,
                    fillColor: AppColors.newBg,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.visibility,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '필수 입력 항목입니다.';
                    }
                    return null;
                  },
                ),
                const Gap(12),
                TextFormField(
                  controller: password2TextController,
                  decoration: InputDecoration(
                    hintText: '비밀번호 확인',
                    filled: true,
                    fillColor: AppColors.newBg,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.visibility,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '필수 입력 항목입니다.';
                    }
                    if (value != passwordTextController.text.toString()) {
                      return '비밀번호가 다릅니다.';
                    }
                    return null;
                  },
                ),
                const Gap(20),
                Consumer(builder: (context, ref, child) {
                  return GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();
                        if (!validated) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: const Text('이메일 중복확인을 체크해주세요'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                      context.pop();
                                    },
                                    child: const Text(
                                      '확인',
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }
                        final result = await ref
                            .read(loginViewModelProvider.notifier)
                            .signUp(
                              LoginModel(
                                email: emailTextController.text.trim(),
                                password: passwordTextController.text.trim(),
                                username: usernameTextController.text.trim(),
                              ),
                            );

                        if (result) {
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: const Text('등록 성공: 로그인을 진행해주세요.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                      context.pop();
                                    },
                                    child: const Text(
                                      '확인',
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else {
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: const Text('신규 회원가입 실패'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        context.pop();
                                        context.pop();
                                      },
                                      child: const Text(
                                        '확인',
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(.55),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          '약관 동의 후 가입 완료하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
