# Shared OpenAPI Specification

This directory contains the OpenAPI specification (`openapi.yaml`) that serves as the single source of truth for the API contract between the `backend` and the `app`.

## API-First Approach

By defining the API in a language-agnostic format first, we enable:

-   **Parallel Development**: The backend and frontend teams can work simultaneously against a mocked or generated server/client based on this spec.
-   **Strong Contracts**: The spec ensures that both the server implementation and the client consumers adhere to the same data structures and endpoints.
-   **Code Generation**: We can automatically generate server stubs, client SDKs, and API documentation, reducing boilerplate code and ensuring consistency.

This `openapi.yaml` file is referenced by both the Express.js backend for implementation and validation, and by the Flutter app to generate a type-safe client.
