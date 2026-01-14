To-Do List Online Web Application
A comprehensive Java web application for personal task management (To-Do List) featuring multi-user support, role-based access control, calendar visualization, and a clean modern interface using JSP, Servlets, TailwindCSS, and PostgreSQL database.

Features
Task Management: Create, edit, and delete daily tasks with deadlines.
Multi-User System: User registration and login with distinct workspaces.
Role-Based Access: Separated dashboards for Regular Users and Administrators.
Calendar View: Visual monthly calendar integration (FullCalendar) to track deadlines.
Dashboard Statistics: Real-time summary of total tasks, today's deadlines, and completion status.
Search & Filter: Quickly find tasks by keyword and filter active tasks vs. completed history.
Dark/Light Mode: Toggle between themes for comfortable usage.
Responsive Design: Fully optimized layout for mobile phones, tablets, and desktops.
PostgreSQL Database: Secure storage for user data, tasks, and relational integrity.
Technologies Used
Backend: Java Servlets, JSP (JavaServer Pages), Java 17
Frontend: TailwindCSS (via CDN), Google Material Icons, JavaScript (Vanilla & Fetch API)
Database: PostgreSQL (with JDBC Driver)
Build Tool: Apache Ant (via Apache NetBeans)
Server: Apache Tomcat 10.1+
Libraries: PostgreSQL JDBC Driver, FullCalendar.js
Prerequisites
Before running this application, make sure you have:

JDK 17 or higher installed.
Apache NetBeans IDE (for easy deployment) or a Servlet Container.
PostgreSQL installed and running (Tested on v10+).
Web Browser (Chrome, Firefox, Edge).
Setup Instructions
1. Database Setup
Create a new PostgreSQL database named todolist_database:

CREATE DATABASE todolist_database;
Run the SQL schema provided in this repository (create file schema.sql or paste manually) to create necessary tables (users and produk) and set up Foreign Keys.

Default Admin Credentials:

Username: admin@todo.com
Password: 123456789

2. Configuration
Open project in Apache NetBeans.
Navigate to: Source Packages > util > KoneksiDB.java.
Update database connection strings to match your local PostgreSQL setup:

String url = "jdbc:postgresql://localhost:5432/todolist_database";
String user = "postgres"; // Your DB Username
String pass = "123456789";    // Your DB Password

Ensure PostgreSQL JDBC Driver is added to project libraries. (Usually: Right-click Libraries > Add JAR/Folder > Select postgresql-xx.x.jar).
3. Build and Run Project
Since this is a NetBeans project, deployment is handled via the IDE:

Open NetBeans.
Open Project: File > Open Project > Select project folder.
Clean & Build: Right-click project > Clean and Build.
Run Project: Right-click project > Run (or press F6).
NetBeans will start Apache Tomcat and open your browser automatically to http://localhost:8080/ProjectAkhirPBO/ (or your context path).

Application Structure
ProjectAkhirPBO/
├── src/
│   ├── java/
│   │   ├── controller/
│   │   │   ├── AuthServlet.java       # Handles Login & Logout
│   │   │   ├── RegisterServlet.java   # Handles User Registration
│   │   │   ├── TodoServlet.java       # Handles Task CRUD & Search
│   │   │   ├── AdminServlet.java      # Handles Admin Dashboard & User Management
│   │   │   └── CalendarServlet.java   # Provides JSON data for Calendar view
│   │   ├── dao/
│   │   │   ├── UserDAO.java          # Data Access Object for Users
│   │   │   └── produkDAO.java       # Data Access Object for Tasks
│   │   ├── model/
│   │   │   ├── User.java             # User Entity
│   │   │   └── produk.java          # Task Entity
│   │   ├── util/
│   │   │   └── KoneksiDB.java       # Database Connection Manager
│   └── ...                          # generated code
├── web/                           # Web Content Root
│   ├── WEB-INF/
│   │   └── web.xml                # Servlet Configuration
│   ├── images/                     # Project images (Logo)
│   ├── admin.jsp                   # Admin Dashboard
│   ├── admin_calendar.jsp           # Admin Global Calendar
│   ├── calendar.jsp               # User Calendar View
│   ├── contact.jsp                 # Contact Us page
│   ├── index.jsp                   # Landing Page / Home
│   ├── login_form.jsp              # Login Page
│   ├── logout.jsp                  # Logout Handler
│   ├── produk.jsp                  # Main User Workspace (Tasks)
│   └── register.jsp               # Registration Page
└── nbproject/                     # NetBeans config

Usage
For Regular Users
Register: Click "Sign Up" and create an account with Name, Email, and Password.
Login: Enter credentials to enter your workspace.
Add Task: Click "Tambah" to create a new task with Title, Description, Status, and Deadline.
Manage Tasks: Edit details, delete tasks, or view history.
View Calendar: Click "Kalender" to see tasks visualized on a monthly calendar.
Search: Use search bar to find specific tasks by title or description.
For Administrators
Login as Admin: Use admin credentials provided in the setup section.
Access Dashboard: You will be redirected to Admin Dashboard automatically.
View Stats: Monitor total users and total tasks in the system.
Manage Users: View registered users and delete accounts if necessary (Tasks owned by deleted users will also be removed).
Global Calendar: View all tasks from all users on "Global Calendar" to monitor activity.
Database Schema
The application uses two primary relational tables:

1. users - Stores user account data
| Column | Type | Description |
| :--- | :--- | :--- |
| id | `INT` (PK) | Unique User ID (Auto Increment) |
| email | `VARCHAR(100)` (UK) | User Email (Must be unique) |
| password | `VARCHAR(255)` | Password (Stored as plain text) |
| nama_lengkap | `VARCHAR(100)` | Full Name of user |
| role | `VARCHAR(20)` | Access Level (`admin` or `user`) |

2. produk - Stores task data
| Column | Type | Description |
| :--- | :--- | :--- |
| id | `INT` (PK) | Unique Task ID (Auto Increment) |
| judul | `VARCHAR(150)` | Task Title |
| deskripsi | `TEXT` | Task Description |
| status | `VARCHAR(50)` | Status (`Belum Selesai`, `Berjalan`, `Selesai`) |
| deadline | `DATE` | Target completion date |
| user_id | `INT` (FK) | ID of user who owns this task |

Relationship:

produk.user_id references users.id.
One User can have Multiple Tasks (One-to-Many).
Design Features
Modern UI: Clean card-based layout with soft shadows and rounded corners using TailwindCSS.
Dark Mode: Full support for dark theme toggle, enhancing visual comfort.
Interactive Calendar: Integration of FullCalendar.js for intuitive date management.
Custom Modal: Custom designed modal dialogs for adding/editing tasks.
Responsive: Grid layouts automatically adapt from mobile (stacked) to desktop (side-by-side).
Feedback: Form validations and dynamic UI updates.
Troubleshooting
Database Connection Issues

Verify PostgreSQL service is running.
Check KoneksiDB.java credentials (username/password).
Ensure database todolist_database exists.
Check Tomcat logs (Server Log tab in NetBeans) for SQLException.
Login/Session Issues

Ensure users table has been created.
If creating a new user fails, check if email already exists (Unique constraint).
Clear browser cache/cookies if session behaves oddly.
Use sample data admin credentials: admin@todo.com / 123456789
Calendar Not Showing Events

Check browser console (F12 > Network tab) to see if CalendarServlet is returning JSON correctly.
Ensure tasks have a valid deadline date set (Tasks with NULL dates won't appear).
Verify @WebServlet("/CalendarServlet") annotation exists in the servlet.
Build Errors

Ensure correct JDBC Driver library is attached to the project.
Run Clean and Build again to clear old compiled classes.
Make sure you are using JDK 17+ as requested.
Security Features
Session Management: Servlet-based session handling to authenticate users.
Access Control: Role-based redirection (Admin to Admin Dashboard, User to Workspace).
SQL Injection Prevention: All database queries use PreparedStatement.
Ownership Validation: TodoServlet and DAOs ensure users can only edit/delete tasks belonging to their own user_id.
Credits
CSS Framework: TailwindCSS
Calendar Library: FullCalendar.js
Icons: Google Material Icons (Rounded)
Database: PostgreSQL
License
This project is created for educational purposes as part of Object-Oriented Programming (PBO) college coursework.

Author
Created for College Task - Object-Oriented Programming (PBO)

Group Members:

Lira Liska (Project Leader)
Meisha Bongi Teluma (Backend Developer)
Assyifa Khoirunissa Putri (Frontend Developer)
Nabib Khalish Alfayadh (UI/UX Designer)
Rafi Muhammad Ramadhan (Quality Assurance)

