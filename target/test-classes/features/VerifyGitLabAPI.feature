@ON

Feature: Verify CRUD Operations on GitLab Issues
# positive scenarios to fetch issues from API using GET method
  Scenario: Verify the response code and body of the GitLab Issues API for GET request
    Given the GitLab API endpoint for issues is "https://gitlab.com/api/v4/projects/52898641/issues/2"
    When I make a GET request to the GitLab API for issues
    Then the API response code should be 200
    And the response body should contain the following details:
      | field  | value            |
      | iid    | 2                |
      | title  | Issues with auth |
      | state  | opened           |

# Positive scenarios to post issues - API using POST method
  Scenario: Verify the response code and body of the GitLab Issues API for POST request
    Given the GitLab API endpoint for issues is "https://gitlab.com/api/v4/projects/52898641/issues"
    And the following query parameters are provided:
      | title       | New finding |
      | iid         | 1            |
    When I make a POST request to the GitLab API for issues
    Then the API response code should be 201
    And the response body should contain the following details:
      | field | value       |
      | iid   | 1           |
      | title | New finding |
      | state | opened      |

# Positive scenarios to update the existing issues from API using PUT method
  Scenario: Verify the response code and body of the GitLab Issues API for PUT request
    Given the GitLab API endpoint for issues is "https://gitlab.com/api/v4/projects/52898641/issues/1/?description=Assign"
    When I make a PUT request to the GitLab API for issues
    Then the API response code should be 200
    And the response body should contain the following details:
      | field       | value  |
      | description | Assign |

# Positive scenarios to remove the existing issue from API using Delete method
  Scenario: Verify the response code GitLab Issues API for Delete request
    Given the GitLab API endpoint for issues is "https://gitlab.com/api/v4/projects/52898641/issues/1"
    When I make a Delete request to the GitLab API for issues
    Then the API response code should be 204

#Negative scenarios ---
  Scenario: Verify the response code where Issue is not available for GitLab Issues API for Delete request
    Given the GitLab API endpoint for issues is "https://gitlab.com/api/v4/projects/52898641/issues/1"
    When I make a Delete request to the GitLab API for issues
    Then the API response code should be 404

  Scenario: Verify the response code Issue is not available and body of the GitLab Issues API for GET request
    Given the GitLab API endpoint for issues is "https://gitlab.com/api/v4/projects/52898641/issues/7"
    When I make a GET request to the GitLab API for issues
    Then the API response code should be 404
    And the response body should contain the following details:
      | field  | value            |
      | message| 404 Not found|

#If a user is not a member of a private project, a GET request on that project results in a 404 status code.
  Scenario: Verify the response code Issue is not available and body of the GitLab Issues API for GET request
    Given the GitLab API endpoint for issues is "https://gitlab.com/api/v4/projects/52898642/issues/1"
    When I make a GET request to the GitLab API for issues
    Then the API response code should be 404
    And the response body should contain the following details:
      | field  | value            |
      | message| 404 Project Not Found|