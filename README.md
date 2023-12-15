# RajaTestAssignment
# Backend Test Automation Assignment

## Requirements
### Environment
* GitHub account
* Java 17 (JDK)
* Maven 3.6+
* Any IDE you comfortable with (eg. IntelliJ, VSCode)

### Skills
* Java 8+ (coding standards)
* Clean Code
* Maven
* Git, GitLab, GitHub

### Instructions
 - Clone this project
 - Create a solution as described under ```doc/QA_BE_Assignment.pdf``` in a feature branch
 - Create a Pull Request to merge your feature branch to main
 - Once PR is closed, kindly let us know

## Documentation
# GitLab API Test Automation Framework

## Overview

This project is a test automation framework for testing GitLab API CRUD operations. The framework is built using Cucumber, RestAssured, Maven, and TestNG.

## Project Structure


|-- src
| |-- main
| | |-- java
| | |-- com
| | |-- example
| | |-- gitlab
| | |-- api
| | |-- stepdefinitions
| | |-- GitLabApiStepDefinitions.java
| |-- test
| |-- java
| |-- com
| |-- example
| |-- gitlab
| |-- api
| |-- tests
| |-- GitLabApiTests.java
|-- resources
| |-- features
| |-- GitLabApiTests.feature
|-- pom.xml
|-- README.md
|-- testng.xml


## Prerequisites

- Java 17
- Maven
- GitLab account and PAT token used as I don't have much experience on using OAuth2 token

## Setup

Clone the repository:

git clone <repository_url>

Navigate to the project directory:


cd <project_directory>
Update the config.properties file with your GitLab account details and OAuth2 token.

Install dependencies using Maven
mvn clean install


Running Tests
Run all tests using the TestNG XML file:


mvn test -DsuiteXmlFile=testng.xml
Run specific tests using tags:

mvn test -Dcucumber.filter.tags="@ON"

Test Scenarios
CRUD operations are covered with various scenarios and edge cases.
Each feature file represents a specific CRUD operation.

Test Reports
TestNG generates test reports in the target/surefire-reports directory.


Continuous Integration
This project is configured to run on Azure Pipelines. The pipeline file is .azure-pipelines/azure-pipelines.yml.

Thankyou
Raj


