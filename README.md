
# Vocabulary App

A Minimal Viable Product (MVP)** iOS application designed to help users **learn vocabulary words** along with their **pronunciation**. The app challenges users to **reach weekly learning targets** for new words, making learning structured and engaging.

---

## Architecture

This project follows the **MVVM (Model-View-ViewModel)** architecture pattern:

- **Model:** Handles the data layer, including word lists, user progress, and other core data structures.
- **View:** The UI components such as `ViewControllers` and custom views. Displays data and reacts to user interactions.
- **ViewModel:** Acts as a bridge between the Model and View. It prepares data for display, handles user actions, and manages business logic.

**Additional Structure:**
- Each flow of the app has its **own Router**, responsible for navigation and flow management, keeping navigation logic separate from ViewControllers.

---

## Features

- Learn new vocabulary words with **pronunciations**.
- Track progress with **weekly word targets**.
- Challenge mode to improve retention.
- Clean and modular MVVM architecture for easy scalability.
- Separate routers for each flow for organized navigation.

---

## Getting Started

1. Clone the repo:
git clone https://github.com/mohamedZiad225/Vocabulary.git
