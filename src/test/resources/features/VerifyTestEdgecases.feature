@ON
Feature: Verify Edge cases for API GitLab Issues


  Scenario Outline: <TC_ID> Edge cases for GitLab Issues
    Given the GitLab API endpoint for issues is "https://gitlab.com/api/v4/projects/52898641/issues?title=New finding&iid=<iid>"
    When I make a POST request to the GitLab API for issues
    Then the API response code should be <expectedStatusCode>


    Examples:
      | expectedStatusCode |  iid | TC_ID |
      | 409               |  2   |Invalid request without title|
      | 409                |  3   |  Special characters in title   |
      | 409                | 4   |  Duplicate issue (assuming "Existing Issue" already exists)|



  Scenario Outline: Update an Issue with
    Given the GitLab API endpoint for issues is "https://gitlab.com/api/v4/projects/52898641/issues/<issueId>/?description=Assign"
    When I make a PUT request to the GitLab API for issues
    Then the API response code should be <expectedStatusCode>


    Examples:
      | expectedStatusCode | issueId | expectedDescription  |
      | 404                | 999     | Assign|


  Scenario Outline: Delete an Issue with issueId not available
    Given the GitLab API endpoint for issues is "https://gitlab.com/api/v4/projects/52898641/issues/<issueId>"
    When I make a Delete request to the GitLab API for issues
    Then the API response code should be <expectedStatusCode>

    Examples:
      | expectedStatusCode | issueId |
      | 404                | 999     |


  Scenario Outline: Get Issue Details with Various Scenarios
    Given the GitLab API endpoint for issues is "https://gitlab.com/api/v4/projects/52898641/issues/<iid>"
    When I make a GET request to the GitLab API for issues
    Then the API response code should be <expectedStatusCode>

    Examples:
      | expectedStatusCode | iid |
      | 404                | 999 |


