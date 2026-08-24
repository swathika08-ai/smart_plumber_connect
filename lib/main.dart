import 'package:flutter/material.dart';

void main() {
  runApp(const CallSchedulingApp());
}

class CallSchedulingApp extends StatelessWidget {
  const CallSchedulingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Scheduling App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      home: const LoginSignupScreen(),
    );
  }
}

// ------------------ LOGIN / SIGNUP ------------------
class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login / Signup")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.phone, size: 100, color: Colors.teal),
              const SizedBox(height: 30),
              const TextField(decoration: InputDecoration(labelText: "Email")),
              const TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password")),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const RoleSelectionScreen()));
                },
                child: const Text("Login"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Don't have an account? Sign up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------ ROLE SELECTION ------------------
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Role")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const CustomerDashboard()));
              },
              icon: const Icon(Icons.person),
              label: const Text("Customer"),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const PlumberDashboard()));
              },
              icon: const Icon(Icons.handyman),
              label: const Text("Plumber"),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ CUSTOMER DASHBOARD ------------------
class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const CustomerNotifications()));
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            DashboardTile(
              icon: Icons.search,
              label: "Search Plumber",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const SearchPlumberScreen())),
            ),
            DashboardTile(
              icon: Icons.book_online,
              label: "My Bookings",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const CustomerNotifications())),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ PLUMBER DASHBOARD ------------------
class PlumberDashboard extends StatelessWidget {
  const PlumberDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plumber Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PlumberNotifications()));
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            DashboardTile(
              icon: Icons.list_alt,
              label: "Job Requests",
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const JobRequestsScreen())),
            ),
            DashboardTile(
              icon: Icons.calendar_month,
              label: "Schedule",
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ScheduleScreen())),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ SEARCH PLUMBER ------------------
class SearchPlumberScreen extends StatelessWidget {
  const SearchPlumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Plumber")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (_, i) => Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text("Plumber ${i + 1}"),
            subtitle: const Text("Rating: 4.5 ⭐"),
            trailing: ElevatedButton(
              child: const Text("View"),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PlumberProfileScreen())),
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------ PLUMBER PROFILE ------------------
class PlumberProfileScreen extends StatelessWidget {
  const PlumberProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Plumber Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50, backgroundColor: Colors.teal),
            const SizedBox(height: 10),
            const Text("John Doe - Expert Plumber",
                style: TextStyle(fontSize: 18)),
            const Text("Experience: 5 Years"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const BookCallScreen())),
              child: const Text("Book a Call"),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ BOOK A CALL (with Date & Time Picker) ------------------
class BookCallScreen extends StatefulWidget {
  const BookCallScreen({super.key});

  @override
  State<BookCallScreen> createState() => _BookCallScreenState();
}

class _BookCallScreenState extends State<BookCallScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book a Call")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Select Date",
                hintText: selectedDate != null
                    ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                    : "Choose a date",
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              onTap: pickDate,
            ),
            const SizedBox(height: 20),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Select Time",
                hintText: selectedTime != null
                    ? selectedTime!.format(context)
                    : "Choose a time",
                suffixIcon: const Icon(Icons.access_time),
              ),
              onTap: pickTime,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: selectedDate != null && selectedTime != null
                  ? () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "Call booked on ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year} at ${selectedTime!.format(context)}"),
                ));
              }
                  : null,
              child: const Text("Confirm Booking"),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ CUSTOMER NOTIFICATIONS ------------------
class CustomerNotifications extends StatelessWidget {
  const CustomerNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Bookings & Notifications")),
      body: ListView(
        children: const [
          ListTile(
              leading: Icon(Icons.call),
              title: Text("Call with John Doe confirmed"),
              subtitle: Text("Tomorrow, 10 AM")),
        ],
      ),
    );
  }
}

// ------------------ JOB REQUESTS ------------------
class JobRequestsScreen extends StatelessWidget {
  const JobRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Job Requests")),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (_, i) => Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text("Request #${i + 1}"),
            subtitle: const Text("Customer: Alice | Issue: Tap Leakage"),
            trailing: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const JobDetailsScreen())),
              child: const Text("View"),
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------ JOB DETAILS ------------------
class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Job Details")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text("Customer: Alice\nIssue: Tap Leakage\nAddress: Hyderabad"),
      ),
    );
  }
}

// ------------------ SCHEDULE ------------------
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Schedule / Calendar")),
      body: const Center(child: Text("Your scheduled jobs will appear here.")),
    );
  }
}

// ------------------ PLUMBER NOTIFICATIONS ------------------
class PlumberNotifications extends StatelessWidget {
  const PlumberNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications (Plumber)")),
      body: const ListTile(
        leading: Icon(Icons.notifications_active),
        title: Text("You have a new booking from Alice"),
      ),
    );
  }
}

// ------------------ REUSABLES ------------------
class DashboardTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const DashboardTile(
      {super.key,
        required this.icon,
        required this.label,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("user@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.teal),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginSignupScreen()),
                    (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
