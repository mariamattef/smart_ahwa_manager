# Smart Ahwa Manager

A robust and scalable Flutter application for managing coffee shop orders, built with a focus on Clean Architecture, Object-Oriented Programming (OOP), and SOLID principles.

## About The Project

Smart Ahwa Manager is a comprehensive solution for coffee shop owners and staff to manage orders efficiently. It provides a clear overview of pending orders, detailed order information, and insightful reports to help make data-driven decisions. The application is designed to be easily maintainable and extensible, thanks to its clean and modular architecture.

## Features

*   **Order Management:**
    *   View a real-time list of pending orders.
    *   See detailed information for each order, including customer name, drink, and special instructions.
    *   Mark orders as complete to keep track of the workflow.
    *   Create new orders with a simple and intuitive interface.
*   **Reporting & Analytics:**
    *   Generate reports on top-selling drinks to understand customer preferences.
    *   Filter reports by date range (Daily, Weekly, Monthly) to analyze sales trends.
    *   View total orders served to track the overall performance.
*   **Search & Filtering:**
    *   Quickly find orders by searching for customer names or drink types.
    *   Filter top-selling drinks by category.

## Built With

This project is built with a strong emphasis on modern software development practices and a scalable architecture.

*   **[Flutter](https://flutter.dev/):** The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
*   **[Dart](https://dart.dev/):** The programming language used by Flutter.
*   **[Provider](https://pub.dev/packages/provider):** A state management library for Flutter, used to manage the application's state in a clean and efficient way.

## Architecture

This project follows the principles of **Clean Architecture**, which separates the code into independent layers. This makes the application easier to test, maintain, and scale.

```
lib/
├── core/               # Shared code, helpers, and core screens.
│   ├── helper/
│   └── screens/
├── features/           # Contains the different features of the application.
│   ├── order/          # The order management feature.
│   │   ├── data/       # Data layer: models and repositories.
│   │   │   ├── models/
│   │   │   └── repo/
│   │   └── presentation/ # Presentation layer: screens and widgets.
│   │       └── screens/
│   └── report/         # The reporting feature.
│       ├── data/       # Data layer: models and repositories.
│       │   ├── models/
│       │   └── repo/
│       └── presentation/ # Presentation layer: screens and widgets.
│           └── screens/
└── main.dart           # The main entry point of the application.
```

## OOP and SOLID Principles

The project is developed with a strong focus on Object-Oriented Programming (OOP) and SOLID principles to ensure the code is clean, modular, and easy to understand.

*   **Single Responsibility Principle (SRP):** Each class has a single responsibility. For example, the `ReportViewModel` is responsible for managing the state of the reports screen, while the `ReportRepository` is responsible for fetching report data.
*   **Open/Closed Principle (OCP):** The project is open for extension but closed for modification. This is achieved by using abstract classes for repositories, allowing for new data sources to be added without modifying the existing code.
*   **Liskov Substitution Principle (LSP):** Subtypes are substitutable for their base types. This is ensured by using a common interface for repositories.
*   **Interface Segregation Principle (ISP):** The interfaces are small and focused. For example, the `IOrderRepository` only contains methods related to orders.
*   **Dependency Inversion Principle (DIP):** High-level modules do not depend on low-level modules. Both depend on abstractions. This is achieved by using dependency injection to provide repositories to the ViewModels.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

Make sure you have the Flutter SDK installed on your machine. For more information on how to install Flutter, see the [official documentation](https://flutter.dev/docs/get-started/install).

### Installation

1.  **Clone the repository:**

    ```sh
    git clone https://github.com/your_username/smart_ahwa_manager.git
    ```

2.  **Navigate to the project directory:**

    ```sh
    cd smart_ahwa_manager
    ```

3.  **Install dependencies:**

    ```sh
    flutter pub get
    ```

4.  **Run the application:**

    ```sh
    flutter run
    ```

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.