import express from 'express';
import {
  OpenAPIBackend, Context as OpenAPIContext, Request as OpenAPIRequest
} from 'openapi-backend';
import addFormats from 'ajv-formats';
import path from 'path';
import { fileURLToPath } from 'url';
import { createHandlers } from './api/handlers.js';
import { InMemoryPostRepository } from './lib/repository.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

async function startServer() {
  const app = express();
  app.use(express.json());

  const repository = new InMemoryPostRepository();
  const baseHandlers = createHandlers(repository);

  const api = new OpenAPIBackend({
    definition: path.join(__dirname, '../../shared/openapi.json'),
    customizeAjv: (ajv) => {
      addFormats(ajv);
      return ajv;
    },
    handlers: {
      notFound: (c: OpenAPIContext, _: express.Request, res: express.Response) => {
        console.error('API Route Not Found:', c.request.path);
        res.status(404).json({ err: 'not found' });
      },
      validationFail: (c: OpenAPIContext, _: express.Request, res: express.Response) => {
        console.error('API Validation Failed:', c.validation.errors);
        res.status(400).json({ err: c.validation.errors });
      },
      methodNotAllowed: (c: OpenAPIContext, _: express.Request, res: express.Response) => {
        console.error('API Method Not Allowed:', c.request.method, c.request.path);
        res.status(405).json({ err: 'method not allowed' });
      },
    },
  });

  api.register({
    ...baseHandlers,
  });

  await api.init();

  app.use((req, res) => api.handleRequest(req as OpenAPIRequest, req, res));

  const port = process.env.PORT || 9000;
  app.listen(port, () => {
    console.log(`API server listening on port ${port}`);
  });
}

startServer().catch(error => {
  console.error('Failed to start server:', error);
  process.exit(1);
});