import express from 'express';
import OpenAPIBackend from 'openapi-backend';
import path from 'path';
import { fileURLToPath } from 'url';
import { createHandlers } from './api/handlers.js';
import { InMemoryPostRepository } from './lib/repository.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
app.use(express.json());

const repository = new InMemoryPostRepository();
const handlers = createHandlers(repository);

const api = new OpenAPIBackend({
  definition: path.join(__dirname, '../../shared/openapi.json'),
  handlers,
});

api.init();

app.use((req, res) => {
  api.handleRequest(req as any, res as any);
});

const port = process.env.PORT || 9000;
app.listen(port, () => {
  console.log(`API server listening on port ${port}`);
});
