import { Request, Response } from 'express';
import { Context } from 'openapi-backend';
import { IPostRepository } from '../lib/repository';

export const createHandlers = (repository: IPostRepository) => ({
  getPosts: async (c: Context, req: Request, res: Response) => {
    const posts = await repository.getPosts();
    res.status(200).json(posts);
  },

  createPost: async (c: Context, req: Request, res: Response) => {
    const newPost = await repository.createPost(c.request.body);
    res.status(201).json(newPost);
  },

  getPostById: async (c: Context, req: Request, res: Response) => {
    const post = await repository.getPostById(c.request.params.id as string);
    if (!post) {
      return res.status(404).json({ err: 'Post not found' });
    }
    res.status(200).json(post);
  },

  updatePost: async (c: Context, req: Request, res: Response) => {
    const post = await repository.updatePost(c.request.params.id as string, c.request.body);
    if (!post) {
      return res.status(404).json({ err: 'Post not found' });
    }
    res.status(200).json(post);
  },

  deletePost: async (c: Context, req: Request, res: Response) => {
    const success = await repository.deletePost(c.request.params.id as string);
    if (!success) {
      return res.status(404).json({ err: 'Post not found' });
    }
    res.status(204).send();
  },

  notFound: (c: Context, req: Request, res: Response) => {
    res.status(404).json({ err: 'not found' });
  },
});
