import 'package:flutter/material.dart';

// Sample Booking Model
class Booking {
  final String id;
  final String date;
  final String time;
  final String technician;
  final String status;

  Booking({
    required this.id,
    required this.date,
    required this.time,
    required this.technician,
    required this.status,
  });
}

// Main BookingHistory Widget
class BookingHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking History',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: BookingHistoryPage(),
    );
  }
}

// BookingHistoryPage Widget
class BookingHistoryPage extends StatelessWidget {
  // Sample bookings list
  final List<Booking> bookings = [
    Booking(id: '001', date: '2023-10-20', time: '10:00 AM', technician: 'John Doe', status: 'Completed'),
    Booking(id: '002', date: '2023-10-21', time: '02:00 PM', technician: 'Jane Smith', status: 'Pending'),
    Booking(id: '003', date: '2023-10-22', time: '11:30 AM', technician: 'Alice John', status: 'Cancelled'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking History'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: bookings.isEmpty
          ? Center(
        child: Text(
          'No bookings found.',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5.0,
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: Icon(
                Icons.build,
                color: Colors.blueAccent,
                size: 40.0,
              ),
              title: Text(
                'Booking ID: ${booking.id}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 16.0, color: Colors.grey),
                      SizedBox(width: 8.0),
                      Text('Date: ${booking.date}'),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16.0, color: Colors.grey),
                      SizedBox(width: 8.0),
                      Text('Time: ${booking.time}'),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(Icons.person, size: 16.0, color: Colors.grey),
                      SizedBox(width: 8.0),
                      Text('Technician: ${booking.technician}'),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(
                        booking.status == 'Completed'
                            ? Icons.check_circle
                            : booking.status == 'Pending'
                            ? Icons.pending
                            : Icons.cancel,
                        color: booking.status == 'Completed'
                            ? Colors.green
                            : booking.status == 'Pending'
                            ? Colors.orange
                            : Colors.red,
                        size: 16.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Status: ${booking.status}',
                        style: TextStyle(
                          color: booking.status == 'Completed'
                              ? Colors.green
                              : booking.status == 'Pending'
                              ? Colors.orange
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.info, color: Colors.blueAccent),
                    onPressed: () {
                      // Implement view details logic
                      _showDetails(context, booking);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel, color: Colors.red),
                    onPressed: () {
                      // Implement cancel booking logic
                      _showCancelConfirmation(context, booking);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDetails(BuildContext context, Booking booking) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Booking Details: ${booking.id}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date: ${booking.date}'),
              Text('Time: ${booking.time}'),
              Text('Technician: ${booking.technician}'),
              Text('Status: ${booking.status}'),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showCancelConfirmation(BuildContext context, Booking booking) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Cancel Booking'),
          content: Text('Are you sure you want to cancel booking ID: ${booking.id}?'),
          actions: [
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                // Implement cancel logic
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Booking ID: ${booking.id} has been canceled.'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
