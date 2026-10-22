# Problem Statement 2 – Bash Scripting

## AccuKnox DevOps Trainee Practical Assessment

This project contains two Bash scripts developed for Problem Statement 2.

## Selected Questions

### Question 1: System Health Monitoring Script

This script checks CPU usage, memory usage, disk space, and running processes. It displays alerts when usage exceeds the set limits.

### Question 4: Application Health Checker

This script checks whether an application is functioning correctly using HTTP status codes. It displays the application status as UP or DOWN.

## Technologies Used

- Bash Shell Scripting
- Linux (Ubuntu)
- cURL
- Git and GitHub

## Project Files

- `system_health.sh` – Monitors Linux system health.
- `app_health.sh` – Checks application health using HTTP status codes.

## How to Run

### Question 1: System Health Monitoring

Run the following command:

`bash system_health.sh`

### Question 4: Application Health Checker

Run the following command:

`bash app_health.sh`

Enter the application URL when prompted.

## Testing

### System Health Monitoring

- Tested CPU usage, memory usage, disk usage, and running processes.
- Verified alerts when a predefined threshold is exceeded.

### Application Health Checker

- Tested with `https://www.google.com` – HTTP 200 – Application UP.
- Tested with `http://127.0.0.1:9999` – HTTP 000 – Application DOWN.
  
  <img width="600" height="300" alt="image" src="https://github.com/user-attachments/assets/f96b58af-a88d-4419-810d-5c71c7b9d7aa" />

## Result

Both Bash scripts were successfully executed and tested on an Ubuntu EC2 instance.
