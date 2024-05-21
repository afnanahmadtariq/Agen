# Agen

Agen is a web application designed to help students generate assignments quickly and efficiently. This repository contains the frontend code built with Flutter, while the backend functionalities are implemented using Azure Functions with Python and user authentication and data storage are managed using Firebase.

## Features

- **User Authentication**: Students can create an account or log in using Firebase Authentication.
- **Assignment Generation**: Generate assignments based on selected templates and input questions.
- **Keyword Extraction**: Extract keywords from user-entered questions using Python RAKE package.
- **Data Retrieval**: Fetch relevant information from the web using web scraping techniques.
- **Data Processing**: Clean, tokenize, and normalize retrieved data.
- **Relevance Checking**: Use Word2Vec to check the relevance of retrieved data to the query.
- **Assignment Templates**: Choose from predefined assignment templates including Easy, Medium, Complex, and Blank.
- **Download Options**: Download generated assignments in PDF or Docx format.
- **Application Guide**: Provide a guide to users on how to use the application effectively.

## Technologies Used

- **Flutter**: Frontend development framework for building cross-platform applications.
- **Azure Functions**: Serverless compute service for running event-triggered code.
- **Python**: Programming language used for backend logic and data processing.
- **Firebase**: Backend-as-a-Service (BaaS) platform for user authentication and data storage.
- **RAKE (Rapid Automatic Keyword Extraction)**: Python package for keyword extraction.
- **WordNet**: Lexical database for the English language used for semantic analysis.
- **Beautiful Soup**: Python library for web scraping.
- **Page Ranker**: Library or algorithm used for ranking fetched URLs.
- **Word2Vec**: Neural network model used for semantic analysis and relevance checking.

## Getting Started

To get started with the Agen web application, follow these steps:

1. **Clone the Repository**: Clone this repository to your local machine.

   ```bash
   git clone https://github.com/your-username/assignment-generator-flutter.git
   ```

1. **Set Up Firebase:** Set up a Firebase project and configure Firebase Authentication and Firestore for user authentication and data storage.

2. **Set Up Azure Functions:** Set up an Azure Functions project and deploy the Python code for backend functionalities.

3. **Configure Firebase Credentials:** Update the Firebase configuration file (google-services.json for Android or GoogleService-Info.plist for iOS) with your Firebase project credentials.

4. R**un the Application:** Run the Flutter application on your preferred emulator or physical device.
```
bash
flutter run
```
## Contributing

Contributions are welcome! If you'd like to contribute to the Agen project, please follow these guidelines:

1. Fork the repository and create your branch (git checkout -b feature/your-feature).
2. Commit your changes (git commit -am 'Add some feature').
3. Push to the branch (git push origin feature/your-feature).
4. Create a new Pull Request and describe your changes in detail.

## License

This project is licensed under the MIT License.

## Acknowledgements

- Flutter Documentation
- Azure Functions Documentation
- Firebase Documentation
- RAKE GitHub Repository
- WordNet Documentation
- Beautiful Soup Documentation
- Page Ranker Algorithm
- Word2Vec Documentation
