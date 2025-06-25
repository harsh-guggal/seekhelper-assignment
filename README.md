# 👨‍💻 Flutter User Directory App

A Flutter application built for an internship assignment to demonstrate **REST API integration**, **state management**, **responsive UI**, and **form handling**.

---

## 📌 Assignment Objectives

This app satisfies the following requirements:

- ✅ Fetch and display a list of users from a REST API.
- ✅ View detailed information of any user.
- ✅ Add new users using a local state-managed form.
- ✅ Implement a responsive UI for all screen sizes.
- ✅ Use state management (`Provider`) for user list and UI updates.
- ✅ Bonus: Search bar, page transition animations, and network error handling.

---

## 🧪 Features

| Feature                      | Description                                                              |
|-----------------------------|--------------------------------------------------------------------------|
| 📡 REST API Integration      | Fetch users from `https://jsonplaceholder.typicode.com/users`            |
| 📱 Responsive UI             | Adapts to mobile, tablet, and desktop screen sizes                       |
| 🧠 State Management          | Managed using `Provider`                                                 |
| 👤 User Detail Page          | Navigate to a new page to see selected user’s details                    |
| ➕ Add User Form             | Add new users locally with form (Name, Email, Phone)                     |
| 🔍 Search Functionality      | Filter users by name/email/username                                      |
| 🛑 No Internet Handling      | Detect internet loss and display fallback message                        |
| 🎬 Smooth Transitions        | Custom animations between user list and detail screens                   |

---

## 🌐 API Used

- [JSONPlaceholder Users API](https://jsonplaceholder.typicode.com/users)  
  Sample REST API to simulate user data fetching.

---

## 📁 Folder Structure

lib/
├── main.dart # App entry point
├── models/
│ └── user_model.dart # User model with JSON parsing
├── providers/
│ ├── data_provider.dart # User list, search, add user
│ └── connectivity_provider.dart # Monitors internet connectivity
├── screens/
│ ├── home_screen.dart # Displays user list with search bar
│ ├── user_detail_screen.dart # Shows selected user info
│ └── add_user_screen.dart # Form to add a new user
├── widgets/
│ ├── user_card.dart # Card widget for each user
│ └── custom_textfield.dart # Reusable text input field


---

## 💡 Technologies Used

- **Flutter**: UI toolkit
- **Provider**: State management
- **HTTP**: REST API calls
- **Connectivity Plus**: Network connection detection
- **Dart**: Language

---

## 🛠️ Getting Started

### Prerequisites

Ensure you have the following installed:

- Flutter SDK (≥ 3.0.0)
- Dart SDK (≥ 3.0.0)
- Android Studio / VSCode

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/your-username/seekhelper-assignment.git
cd seekhelper-assignment


```bash
flutter pub get

```bash
flutter run
