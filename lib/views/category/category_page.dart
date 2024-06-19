import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:wabiz/theme.dart';

class CategoryPage extends StatefulWidget {
  final String categoryId;

  const CategoryPage({
    super.key,
    required this.categoryId,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카테고리'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/home_outlined.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          /// 최상위 프로젝트
          SizedBox(
            height: 240,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[800],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Spacer(),
                  Text(
                    '최고의 이어폰 | 전문가가 만든 완벽한 이어폰',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Gap(12),
                  Text(
                    '전문가가 만든 이어폰 하나둘셋넷다섯,전문가가 만든 이어폰 하나둘셋넷다섯,',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(16),
                  Container(
                    height: 4,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 탭
          Container(
            height: 110,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: IntrinsicWidth(
                    child: Column(
                      children: [
                        Gap(8),
                        CircleAvatar(
                          radius: 16,
                        ),
                        Gap(12),
                        Text('테크'),
                        Gap(12),
                        Container(
                          height: 6,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(
            height: 0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        DropdownButton(
                          items: const [
                            DropdownMenuItem(
                              child: Text('전체'),
                            ),
                          ],
                          onChanged: (value) {},
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          underline: SizedBox.shrink(),
                        ),
                        Gap(24),
                        DropdownButton(
                          items: const [
                            DropdownMenuItem(
                              child: Text('추천순'),
                            ),
                          ],
                          onChanged: (value) {},
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          underline: SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: Row(
                              children: [
                                Container(
                                  height: 120,
                                  width: 164,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: 2,
                                        top: 2,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite_border,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '[내 손안의 와이파이] 6G 라우터로 어디서든 빠르게',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Gap(8),
                                      Text(
                                        '류지영',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.wabizGray[500],
                                        ),
                                      ),
                                      Gap(8),
                                      Text(
                                        '1,000 명 참여',
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Gap(8),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.bg,
                                        ),
                                        child: Text(
                                          '1,000원',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
