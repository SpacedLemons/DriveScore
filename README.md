# DrivesScore Technical Test

By Lucas West

Total time spent on developing this project was roughly 8 hours.

## Breakdown

As specified in the technical assignment, the app features a simple donut view that animates and fills based on the user's credit score.

<p align="center">
    <img src="/Images/GetCreditScoreButton.png" width="200">
    <img src="/Images/CreditScoreDonut.png" width="200">
    <img src="/Images/ErrorView.png" width="200">
</p>

The only deviation from the task requirements was the addition of a *Get Credit Score* button and an *ErrorView* with *retry* and *cancel* buttons to handle potential fetch failures. Beyond this, no extra features or UI enhancements were added, as they were not explicitly requested. Instead, my focus was on **scalability** and delivering a **production-grade** implementation.

## Model-View-ViewModel (MVVM)

I opted for **MVVM** as the architectural pattern for several key reasons:

- The test is small and straightforward.

- There is no navigation within the project, making a coordinator unnecessary.

- Adopting a more complex architecture, such as The Composable Architecture (TCA), would be excessive for the given requirements.

## Swift Package Manager (SPM)

To enforce a clear separation of concerns, I integrated **SPM** into the project. **SPM** is used to modularise the code into two key areas:

- **Networking**
- **Design System**

Although the project is small, adding **SPM** is intentional, reinforcing the focus on **scalability** and ensuring the app meets **production-grade** standards. I prioritised testing the **Networking** package.
	
In a larger project, additional features would be separated into dedicated **SPM** packages. For example, the credit score functionality could be extracted into its own package.

However, given the project's size and the uncertainty of future feature expansions, I chose to leave the CreditScore functionality within the main app.

## Networking

The networking implementation follows a **protocol-oriented approach** to ensure *modularity*, *testability*, and *maintainability*. By defining a **Networkable protocol**, all network calls adhere to a consistent structure.

- **Networkable Protocol**: Defines a generic fetch method to handle API requests.

- **CreditFetcher Class**: Implements *CreditFetchable* and *Networkable* to asynchronously fetch credit account data.

- **Endpoint Struct**: Centralises API URL construction, ensuring a single source of truth for all endpoints. This simplifies updates if URLs change.

- **Error Handling**: The NetworkingError enum provides errors to help with debugging.

## Testing

I focused on testing three areas:

`CreditFetcher`

- Validated the generic functionality of the credit fetcher by creating *mockCreditAccount*, a *mockURLSession*, and a *mockCreditFetcher*.

- Tested including success case, error handling, and parsing failures & mock data generation.

`CreditScoreViewModel`

- Tested the fetching mechanism to verify that core functionality worked as expected.

`CreditScoreUITests`

- Currently, there is one UI test checking that when the LoadState is idle, a Get Credit Score button is displayed.

While this is a simple test, I would have expanded on UI tests further if more time were available.

## Future improvements

Given more time, I would implement the following improvements to further enhance scalability and production-grade quality:

- **Bash Script**: Introduce a script to automate setup, allowing other developers to quickly get started with the project.

- **SwiftLint**: Enforce code consistency and prevent common issues (e.g., singleton misuse, trailing closures, etc.).

- **Fastlane**: Automate CI/CD processes, streamline builds, and manage provisioning profiles efficiently.

- **UI/UX Enhancements**: Improve the visual design and interactivity of the donut animation.

- **Accessibility**: Ensure the app is inclusive for users with visual or hearing impairments.

- **Refresh Mechanism**: Add the ability for users to refresh their credit score dynamically (if using a real API).

- **Expanded UI Tests**: Given more time, I would add more UI tests to validate behaviour across different LoadState scenarios.

- **App Delegate & Scene Delegate**: I considered implementing these to manage app lifecycle events efficiently, enabling features such as refreshing the credit score when the app moves to the background via a notification observer. While this would have been straightforward to add, I ultimately left it out due to the limited functionality within the project, leaving a lot of unused boiler plate code.

## Final note from myself

Thank you to whoever takes the time to review my test. I truly appreciate the effort involved in providing feedback.

If possible, I would love to receive detailed insights on areas where I could improve, as well as any mistakes I may have made throughout the development process. Since starting my iOS development journey three years ago, I have treated every experience, good or bad, as a valuable learning opportunity. I would be incredibly grateful for any guidance!

Once again, I really appreciate your time and feedback, I hope my test meets your expectations.
