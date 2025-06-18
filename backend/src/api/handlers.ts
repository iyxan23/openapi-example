import express from 'express';
import { Context } from 'openapi-backend';
import { IPostRepository } from '../lib/repository';

export const createHandlers = (repository: IPostRepository) => ({
  getPosts: async (c: Context, _: express.Request, res: express.Response) => {
    const posts = await repository.getPosts();
    res.status(200).json(posts);
  },

  createPost: async (c: Context, _: express.Request, res: express.Response) => {
    const newPost = await repository.createPost(c.request.body as any);
    res.status(201).json(newPost);
  },

  getPostById: async (c: Context, _: express.Request, res: express.Response) => {
    const post = await repository.getPostById(c.request.params.id as string);
    if (!post) {
      res.status(404).json({ err: 'Post not found' });
    } else {
      res.status(200).json(post);
    }
  },

  updatePost: async (c: Context, _: express.Request, res: express.Response) => {
    const post = await repository.updatePost(c.request.params.id as string, c.request.body as any);
    if (!post) {
      res.status(404).json({ err: 'Post not found' });
    } else {
      res.status(200).json(post);
    }
  },

  deletePost: async (c: Context, _: express.Request, res: express.Response) => {
    const success = await repository.deletePost(c.request.params.id as string);
    if (!success) {
      res.status(404).json({ err: 'Post not found' });
    } else {
      res.status(204).send();
    }
  },
});
