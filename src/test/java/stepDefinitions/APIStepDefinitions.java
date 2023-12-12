package stepDefinitions;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.testng.Assert;

import java.util.List;
import java.util.Map;

public class APIStepDefinitions {

    private String apiUrl;
    private Response response;
    private static final String PRIVATE_TOKEN = "glpat-EymyXA9jCunMpDRv_9PV";

    @Given("the GitLab API endpoint for issues is {string}")
    public void givenGitLabApiEndpoint(String apiUrl) {
        this.apiUrl = apiUrl;
    }

    @When("I make a GET request to the GitLab API for issues")
    public void whenMakeGetRequest() {
        response = RestAssured.given()
                .header("PRIVATE-TOKEN", PRIVATE_TOKEN)
                .get(apiUrl);
    }

    @When("I make a POST request to the GitLab API for issues")
    public void whenMakePostRequest() {
        response = RestAssured.given()
                 .header("PRIVATE-TOKEN", PRIVATE_TOKEN)
                 .post(apiUrl);;
    }

    @When("I make a PUT request to the GitLab API for issues")
    public void whenMakePutRequest() {
        response = RestAssured.given()
                .header("PRIVATE-TOKEN", PRIVATE_TOKEN)
                .put(apiUrl);;
    }

    @When("I make a Delete request to the GitLab API for issues")
    public void whenMakeDeleteRequest() {
        response = RestAssured.given()
                .header("PRIVATE-TOKEN", PRIVATE_TOKEN)
                .delete(apiUrl);;
    }

    @Then("the API response code should be {int}")
    public void thenCheckResponseCode(int expectedStatusCode) {
        int actualStatusCode = response.getStatusCode();
        Assert.assertEquals(expectedStatusCode, actualStatusCode);
    }

    @Then("the response body should contain the following details:")
    public void thenCheckResponseBody(DataTable dataTable) {
        List<Map<String, String>> expectedDetails = dataTable.asMaps(String.class, String.class);
        Map<String, Object> responseBody = response.jsonPath().getMap("$");

        for (Map<String, String> expectedDetail : expectedDetails) {
            String field = expectedDetail.get("field");
            String expectedValue = expectedDetail.get("value");

            Assert.assertTrue(responseBody.containsKey(field));

            String actualValue = String.valueOf(responseBody.get(field));
            Assert.assertEquals(expectedValue, actualValue);
        }
    }



    @And("the following query parameters are provided:")
    public void andQueryParametersProvided(DataTable dataTable) {
        Map<String, String> queryParams = dataTable.asMap(String.class, String.class);

        StringBuilder apiUrlBuilder = new StringBuilder(apiUrl);
        apiUrlBuilder.append("?");

        for (Map.Entry<String, String> entry : queryParams.entrySet()) {
            apiUrlBuilder.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
        }

        apiUrl = apiUrlBuilder.toString();
        apiUrl = apiUrl.substring(0, apiUrl.length() - 1); // Remove the trailing "&"
    }
}




