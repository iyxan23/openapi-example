# Backend (Express.js)

This directory contains the Express.js backend that implements the API defined in the `shared/openapi.yaml` specification.

## API-First Implementation

The backend uses the `openapi-backend` library to:

-   **Validate Incoming Requests**: Automatically validates requests against the OpenAPI spec, ensuring that all incoming data conforms to the defined schema.
-   **Route Requests**: Maps API routes defined in the spec to handler functions in the code.
-   **Mock Responses**: Can provide mock responses for endpoints that are not yet implemented, which is useful for frontend development.

This approach ensures that the backend implementation stays in sync with the API contract, reducing the risk of integration issues.
