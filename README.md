# 🚀 Flutter Challenge - Tokio Marine

Welcome to the Flutter challenge project for Tokio Marine! This application was developed with a strong focus on **Clean Architecture**, leveraging **Cubit** for state management, **Modular** for dependency injection and routing, and **Firebase** for backend services such as authentication, database, and storage. The goal is to demonstrate best practices in development, scalability, and maintainability.

---

## ✨ Technologies Used

* **Flutter:** SDK for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.
* **Firebase:** Google's mobile platform that helps you quickly develop high-quality apps (e.g., Authentication, Firestore, Storage).
* **Cubit (from Bloc):** A simple, powerful, and reactive state management library.
* **Flutter Modular:** A robust solution for dependency injection, routing, and project modularization.
* **Dart:** The programming language optimized for UI.
* **Clean Architecture:** A software design philosophy promoting separation of concerns for increased flexibility and testability.

---

## 🏗️ Project Architecture (Clean Architecture)

This project is built following the principles of **Clean Architecture**, which organizes the codebase into distinct, independent layers. This layered approach ensures **separation of concerns**, making the application more **maintainable, scalable, and testable**.

The core idea is that dependencies flow inwards, meaning inner layers have no knowledge of outer layers. This provides a robust and flexible foundation for the application.

* **Domain Layer:** This is the innermost layer and contains the enterprise's business rules. It's completely independent of any frameworks or external libraries. It defines **Entities**, **Use Cases** (interactors), and **Repository Interfaces**.
* **Data Layer:** This layer is responsible for fetching and storing data. It implements the **Repository Interfaces** defined in the Domain layer, connecting to various data sources (e.g., APIs, databases). It uses **Models** to represent the data structures.
* **Presentation Layer:** This is the outermost layer, responsible for the UI and user interaction. It uses **Cubits** to manage the state and orchestrate the flow by interacting with **Use Cases** from the Domain layer. Pages and Widgets are built here.
* **Core/Shared Components:** Common utilities, constants, error handling, and shared UI widgets that are used across multiple layers or features.

**Flutter Modular** plays a crucial role in binding these layers together, managing dependencies (Dependency Injection) and handling navigation (Routing), ensuring a highly modular and organized application flow.

---

## ⚙️ Installation & Setup

To get this project up and running on your local machine, follow these steps:

### 1. **Prerequisites**

Make sure you have **Flutter** installed. If not, follow the official Flutter installation guide:
[Flutter Get Started](https://flutter.dev/docs/get-started/install)

Verify your Flutter installation by running:

```bash
flutter doctor
```

### 2. **Clone the Repository**

First, clone this repository to your local machine:

```bash
git clone https://github.com/GiovaneLopes/TM-challenge.git
cd TM-challenge 
```

### 3. Install Dependencies
Navigate to the project's root directory and run the following command to fetch all the necessary Dart packages:

```bash 
flutter pub get
```

### 4. Firebase Setup
If this project utilizes Firebase services, ensure you've set up your Firebase project and configured your Flutter application according to the official Firebase documentation.

This typically involves adding google-services.json (for Android) or GoogleService-Info.plist (for iOS) to your project, and potentially configuring your firebase_options.dart file.

## ▶️ How to Run the Application

Once the dependencies are installed, you can run the application on your desired platform.

For Mobile (Android/iOS)
Make sure you have an Android emulator/device or an iOS simulator/device connected and running.

```bash
flutter run
```

Flutter will automatically detect an available device/emulator and deploy the application.

For Web
To run the application in a web browser (e.g., Chrome):

```bash
flutter run -d chrome
```
