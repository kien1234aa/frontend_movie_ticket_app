import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool faceIdEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Avatar + Name + Contact
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // Avatar
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  const SizedBox(width: 15),
                  // Name + contact
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Angelina",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.phone, color: Colors.grey, size: 16),
                            SizedBox(width: 5),
                            Text(
                              "(704) 555-0127",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Icon(Icons.email, color: Colors.grey, size: 16),
                            SizedBox(width: 5),
                            Text(
                              "angelina@example.com",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Edit icon
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Menu items
            _buildMenuItem(Icons.confirmation_number_outlined, "My ticket"),
            _buildMenuItem(Icons.shopping_cart_outlined, "Payment history"),
            _buildMenuItem(Icons.language, "Change language"),
            _buildMenuItem(Icons.lock_outline, "Change password"),

            // Face ID toggle
            ListTile(
              leading: const Icon(
                Icons.face_retouching_natural,
                color: Colors.white,
              ),
              title: const Text(
                "Face ID / Touch ID",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              trailing: Switch(
                value: faceIdEnabled,
                activeColor: Colors.amber,
                onChanged: (value) {
                  setState(() {
                    faceIdEnabled = value;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  faceIdEnabled = !faceIdEnabled;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
      onTap: () {},
    );
  }
}
