import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/services/notification_service.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/search_bar.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      centerTitle: true,
      title: Text(
        'Todo List App ',
        style: context.textTheme.titleLarge!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.53,
        ),
      ),
      leading: InkWell(
        onTap: () {},
        child: const Icon(
          size: 32,
          Icons.subject,
          color: Colors.white,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            showSearch(context: context, delegate: MyCustomSearch());
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
        // ElevatedButton(
        //   child: const Text('Show notifications'),
        //   onPressed: () {
        //     // NotificationService.scheduledNotification(
        //     //     title: 'Sample title', body: 'It works!');
        //   },
        // ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(110.0),
        child: getAppBottomView(),
      ),
    );
  }

  Widget getAppBottomView() {
    // Implement your bottom view here
    return Container(
      padding: const EdgeInsets.only(left: 20, bottom: 20),

      child: Row(
        children: [
          getProfileView(),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Khoa Nguyen',
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'nguyenthoaidangkhoa.@gmail.com',
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '+84903861515',
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Your bottom view content
    );
  }

  Widget getProfileView() {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 32,
          backgroundColor: Colors.red,
          backgroundImage: AssetImage('assets/images/captain.jpg'),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: const Icon(
              Icons.edit,
              color: Colors.deepPurple,
              size: 16,
            ),
          ),
        )
      ],
    );
  }
}
