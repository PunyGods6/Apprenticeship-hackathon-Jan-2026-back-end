📝 OTJ Logger – Hackathon Prototype
🌟 Overview

This project is a Spring Boot backend prototype built during a hackathon to improve how Off-the-Job (OTJ) learning is logged before being submitted to OneFile.

The goal is to:

⏱️ reduce the time it takes to log OTJ
📊 improve consistency and data quality
🤝 reduce rework for coaches

This is not a replacement for OneFile, but a cleaner way to capture OTJ data before it reaches it.

🛠️ Tech Stack
☕ Java 17
🌱 Spring Boot
🌐 Spring Web
🗄️ Spring Data JPA
⚡ H2 Database (in-memory)

▶️ Running the Application
Prerequisites
Java 17+
Git

Steps
git clone <repo-url>
cd otj-logger
./mvnw spring-boot:run

The app will start at:
http://localhost:8080