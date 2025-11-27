import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context, 
                  '/auth', 
                  (route) => false
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToPage(String pageName) {
    switch (pageName) {
      case 'Inventory':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InventoryPage()),
        );
        break;
      case 'Sales':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SalesPage()),
        );
        break;
      case 'Customers':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomersPage()),
        );
        break;
      case 'Reports':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReportsPage()),
        );
        break;
      case 'History':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HistoryPage()),
        );
        break;
      case 'Credits':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreditsPage()),
        );
        break;
      case 'Expenses':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ExpensesPage()),
        );
        break;
      case 'Settings':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('His Grace Drugshop Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome section with REAL logo
              Center(
                child: Column(
                  children: [
                    // Real business logo
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/logo2.jpg',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.medical_services,
                                size: 50,
                                color: Colors.blue,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Welcome to His Grace Drugshop!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Your Trusted Pharmacy Dashboard',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Quick actions grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildDashboardItem(
                      Icons.medication,
                      'Inventory',
                      Colors.green,
                    ),
                    _buildDashboardItem(
                      Icons.point_of_sale,
                      'Sales',
                      Colors.orange,
                    ),
                    _buildDashboardItem(
                      Icons.people,
                      'Customers',
                      Colors.purple,
                    ),
                    _buildDashboardItem(
                      Icons.analytics,
                      'Reports',
                      Colors.red,
                    ),
                    _buildDashboardItem(
                      Icons.history,
                      'History',
                      Colors.blue,
                    ),
                    _buildDashboardItem(
                      Icons.credit_card,
                      'Credits',
                      Colors.teal,
                    ),
                    _buildDashboardItem(
                      Icons.money_off,
                      'Expenses',
                      Colors.amber,
                    ),
                    _buildDashboardItem(
                      Icons.settings,
                      'Settings',
                      Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardItem(IconData icon, String title, Color color) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => _navigateToPage(title),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Inventory Page
class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Stock Overview'),
            _buildInfoCard('Total Products', '156', Icons.inventory),
            _buildInfoCard('Low Stock Items', '12', Icons.warning, color: Colors.orange),
            _buildInfoCard('Out of Stock', '3', Icons.error, color: Colors.red),
            
            const SizedBox(height: 20),
            _buildSectionHeader('Quick Actions'),
            Row(
              children: [
                Expanded(
                  child: _buildActionButton('Add Product', Icons.add, Colors.green),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildActionButton('Stock Take', Icons.checklist, Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Sales Page
class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Management'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSalesCard('Today\'s Sales', '\$1,245.50', Icons.today),
            _buildSalesCard('This Week', '\$8,765.20', Icons.calendar_today),
            _buildSalesCard('This Month', '\$32,189.75', Icons.calendar_month),
            
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('New Sale'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Customers Page
class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Management'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCustomerTile('John Doe', 'Regular Customer', '+1234567890'),
          _buildCustomerTile('Jane Smith', 'Credit Customer', '+1234567891'),
          _buildCustomerTile('Mike Johnson', 'New Customer', '+1234567892'),
          _buildCustomerTile('Sarah Wilson', 'VIP Customer', '+1234567893'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple,
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

// Reports Page
class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports & Analytics'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildReportItem('Sales Report', Icons.bar_chart),
            _buildReportItem('Inventory Report', Icons.pie_chart),
            _buildReportItem('Customer Report', Icons.people_alt),
            _buildReportItem('Financial Report', Icons.attach_money),
          ],
        ),
      ),
    );
  }
}

// History Page
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHistoryItem('Sale #001', '\$45.50', 'Today, 10:30 AM', Icons.shopping_cart),
          _buildHistoryItem('Sale #002', '\$120.25', 'Today, 11:15 AM', Icons.shopping_cart),
          _buildHistoryItem('Expense', '\$50.00', 'Today, 09:00 AM', Icons.money_off),
          _buildHistoryItem('Sale #003', '\$89.75', 'Yesterday, 03:45 PM', Icons.shopping_cart),
        ],
      ),
    );
  }
}

// Credits Page
class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Management'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCreditSummary('Total Credit Given', '\$2,450.00'),
            _buildCreditSummary('Pending Payments', '\$1,230.50'),
            _buildCreditSummary('Overdue', '\$450.25', isOverdue: true),
            
            const SizedBox(height: 20),
            const Text(
              'Credit Customers:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildCreditCustomer('John Doe', '\$250.00', 'Due: 15 Dec'),
            _buildCreditCustomer('Mike Johnson', '\$500.50', 'Due: 20 Dec'),
          ],
        ),
      ),
    );
  }
}

// Expenses Page
class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracking'),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildExpenseSummary('Monthly Expenses', '\$1,850.75'),
            _buildExpenseSummary('Today\'s Expenses', '\$125.00'),
            
            const SizedBox(height: 20),
            _buildExpenseCategory('Supplies', '\$450.00', Icons.inventory),
            _buildExpenseCategory('Utilities', '\$280.50', Icons.bolt),
            _buildExpenseCategory('Salaries', '\$900.00', Icons.people),
            _buildExpenseCategory('Other', '\$220.25', Icons.miscellaneous_services),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}

// Settings Page
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingItem('Business Profile', Icons.business),
          _buildSettingItem('User Management', Icons.people),
          _buildSettingItem('Tax Settings', Icons.calculate),
          _buildSettingItem('Backup & Restore', Icons.backup),
          _buildSettingItem('Notifications', Icons.notifications),
          _buildSettingItem('Security', Icons.security),
          _buildSettingItem('About', Icons.info),
        ],
      ),
    );
  }
}

// Helper Widgets for all pages
Widget _buildSectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _buildInfoCard(String title, String value, IconData icon, {Color color = Colors.green}) {
  return Card(
    child: ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      trailing: Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    ),
  );
}

Widget _buildActionButton(String text, IconData icon, Color color) {
  return ElevatedButton.icon(
    onPressed: () {},
    icon: Icon(icon),
    label: Text(text),
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      foregroundColor: Colors.white,
    ),
  );
}

Widget _buildSalesCard(String period, String amount, IconData icon) {
  return Card(
    child: ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(period),
      trailing: Text(amount, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
    ),
  );
}

Widget _buildCustomerTile(String name, String type, String phone) {
  return Card(
    child: ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(name),
      subtitle: Text('$type • $phone'),
      trailing: const Icon(Icons.arrow_forward_ios),
    ),
  );
}

Widget _buildReportItem(String title, IconData icon) {
  return Card(
    child: ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(title),
      trailing: const Icon(Icons.download),
    ),
  );
}

Widget _buildHistoryItem(String transaction, String amount, String time, IconData icon) {
  return Card(
    child: ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(transaction),
      subtitle: Text(time),
      trailing: Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
    ),
  );
}

Widget _buildCreditSummary(String title, String amount, {bool isOverdue = false}) {
  return Card(
    color: isOverdue ? Colors.red.shade50 : null,
    child: ListTile(
      title: Text(title),
      trailing: Text(amount, 
        style: TextStyle(
          fontSize: 18, 
          fontWeight: FontWeight.bold,
          color: isOverdue ? Colors.red : Colors.black
        ),
      ),
    ),
  );
}

Widget _buildCreditCustomer(String name, String amount, String dueDate) {
  return Card(
    child: ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(name),
      subtitle: Text(dueDate),
      trailing: Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
    ),
  );
}

Widget _buildExpenseSummary(String title, String amount) {
  return Card(
    child: ListTile(
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      trailing: Text(amount, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
    ),
  );
}

Widget _buildExpenseCategory(String category, String amount, IconData icon) {
  return Card(
    child: ListTile(
      leading: Icon(icon, color: Colors.amber),
      title: Text(category),
      trailing: Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
    ),
  );
}

Widget _buildSettingItem(String title, IconData icon) {
  return Card(
    child: ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
    ),
  );
}