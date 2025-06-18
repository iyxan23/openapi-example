import { describe, it, expect, beforeEach } from 'vitest';
import { InMemoryPostRepository } from '../lib/repository';
import { createHandlers } from '../api/handlers';
import { Request, Response } from 'express';

// Mock Express Request and Response
const mockRequest = (params: any, body: any) => {
  const req = {} as Request;
  req.params = params;
  req.body = body;
  return req;
};

const mockResponse = () => {
  const res = { body: null } as any;
  res.status = (code: number) => {
    res.statusCode = code;
    return res;
  };
  res.json = (json: any) => {
    res.body = json;
    return res;
  };
  res.send = () => res;
  return res;
};

const mockContext = (params: any, body: any) => ({
  request: {
    params,
    body,
  },
});

describe('API Handlers', () => {
  let repository: InMemoryPostRepository;
  let handlers: ReturnType<typeof createHandlers>;

  beforeEach(() => {
    repository = new InMemoryPostRepository();
    handlers = createHandlers(repository);
  });

  it('should create a post', async () => {
    const req = mockRequest({}, { content: 'Test Post' });
    const res = mockResponse();
    await handlers.createPost(mockContext({}, { content: 'Test Post' }) as any, req, res);
    expect(res.statusCode).toBe(201);
    expect(res.body).toHaveProperty('id');
    expect(res.body.content).toBe('Test Post');
  });

  it('should get all posts', async () => {
    await repository.createPost({ content: 'Post 1' });
    await repository.createPost({ content: 'Post 2' });
    const req = mockRequest({}, {});
    const res = mockResponse();
    await handlers.getPosts(mockContext({}, {}) as any, req, res);
    expect(res.statusCode).toBe(200);
    expect(res.body.length).toBe(2);
  });

  it('should get a post by id', async () => {
    const post = await repository.createPost({ content: 'Find Me' });
    const req = mockRequest({ id: post.id }, {});
    const res = mockResponse();
    await handlers.getPostById(mockContext({ id: post.id }, {}) as any, req, res);
    expect(res.statusCode).toBe(200);
    expect(res.body.id).toBe(post.id);
  });

  it('should return 404 for a non-existent post', async () => {
    const req = mockRequest({ id: 'non-existent' }, {});
    const res = mockResponse();
    await handlers.getPostById(mockContext({ id: 'non-existent' }, {}) as any, req, res);
    expect(res.statusCode).toBe(404);
  });

  it('should update a post', async () => {
    const post = await repository.createPost({ content: 'Original' });
    const req = mockRequest({ id: post.id }, { content: 'Updated' });
    const res = mockResponse();
    await handlers.updatePost(mockContext({ id: post.id }, { content: 'Updated' }) as any, req, res);
    expect(res.statusCode).toBe(200);
    expect(res.body.content).toBe('Updated');
  });

  it('should delete a post', async () => {
    const post = await repository.createPost({ content: 'To Be Deleted' });
    const req = mockRequest({ id: post.id }, {});
    const res = mockResponse();
    await handlers.deletePost(mockContext({ id: post.id }, {}) as any, req, res);
    expect(res.statusCode).toBe(204);
    const deletedPost = await repository.getPostById(post.id);
    expect(deletedPost).toBeNull();
  });
});
