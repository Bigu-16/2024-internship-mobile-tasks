# Flutter Clean Architecture Project

## Overview

This project is a Flutter application following Clean Architecture principles. The goal is to build a maintainable, scalable, and testable codebase. The project includes features for managing products, including CRUD operations, and demonstrates how to structure a Flutter app using clean architecture.

## Features

- **Get Products**: Fetch a list of products.
- **Get One Product**: Fetch details of a specific product.
- **Add Product**: Add a new product.
- **Update Product**: Update existing product details.
- **Delete Product**: Remove a product from the list.

## Project Structure

The project is organized according to Clean Architecture principles, with the following main layers:

1. **Core**: Contains shared utilities, error handling, and base classes.
2. **Features**: Contains the main functionality of the app, organized into individual features.
   - **Domain**: Contains the core business logic, entities, and use cases.
   - **Data**: Contains the data layer, including models and repositories.
   - **Presentation**: Contains the UI layer, including widgets and state management.

## Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Bigu-16/2024-internship-mobile-tasks.git
   cd flutter_clean_architecture_project
   ```

2. **Install Dependencies**

   Make sure you have [Flutter](https://flutter.dev/docs/get-started/install) installed. Then run:

   ```bash
   flutter pub get
   ```

3. **Run the Application**

   Use the following command to run the application on an emulator or connected device:

   ```bash
   flutter run
   ```

## Running Tests

To run the unit tests for the application, use:

```bash
flutter test
```

## Testing

The project includes tests for various components using the `flutter_test` and `mockito` packages. Test cases cover:

- **Use Cases**: Ensure that business logic behaves as expected.
- **Models**: Verify JSON serialization and deserialization.
- **Repositories**: Mock external data sources and verify repository behavior.

## Directory Structure

Here is a brief overview of the directory structure:

- `lib/`
  - `core/`: Core utilities and error handling.
  - `features/`
    - `domain/`: Core business logic and use cases.
    - `data/`: Data models and repository implementations.
    - `presentation/`: UI components and state management.
- `test/`
  - `helpers/`: Helper functions for tests.
  - `features/`: Feature-specific tests.

## Contributing

Contributions are welcome! Please follow these steps:

1. **Fork the Repository**
2. **Create a Feature Branch**
3. **Commit Your Changes**
4. **Push to the Branch**
5. **Create a Pull Request**


## Contact

For any questions or feedback, please contact:

- **Abigiya Getachew** - [abigiyag16@gmail.com]
