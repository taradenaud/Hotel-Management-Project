# Hotel Management System

## Team Members
- Tara Denaud Joseph - 300318926
- Fay Lee - 300287876
- Richa Kewalramani - 300284124

## Description
A web-based hotel chain management system for managing multiple hotels, rooms, employees, customers, and bookings.

## Technologies Used
- Java (JDK 8+)
- JSP (JavaServer Pages)
- PostgreSQL 16
- Maven
- Apache Tomcat 7

## How to Run

1. **Install Prerequisites**
   ```bash
   # macOS
   brew install maven postgresql@16
   ```

2. **Clone and Setup Database**
   ```bash
   git clone <repo-url>
   cd CSI2132_GRP170_PROJECT/databases1
   ./setup-database.sh
   ```

3. **Run the Application**
   ```bash
   mvn tomcat7:run
   ```

4. **Access the App**
   
   Open your browser: `http://localhost:8080/databases1`
