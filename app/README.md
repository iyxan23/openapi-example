# App (Flutter)

This directory contains the Flutter application that consumes the API defined in the `shared/openapi.yaml` specification.

## API-First Consumption

The Flutter app uses the `openapi-generator` to:

-   **Generate a Type-Safe Client**: Automatically generates a Dart client library from the OpenAPI spec. This includes all the necessary models and API methods.
-   **Reduce Boilerplate**: Eliminates the need to manually write HTTP client code, data models, and serialization/deserialization logic.
-   **Ensure Consistency**: Guarantees that the client is always in sync with the API contract. If the API changes, regenerating the client will immediately highlight any breaking changes in the app's code.

This approach allows the frontend team to quickly build features against a well-defined API, confident that the data structures and endpoints will match the backend's implementation.
