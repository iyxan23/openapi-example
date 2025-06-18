import { v4 as uuidv4 } from 'uuid';
import { Post, NewPost } from './types';

export interface IPostRepository {
  getPosts(): Promise<Post[]>;
  createPost(post: NewPost): Promise<Post>;
  getPostById(id: string): Promise<Post | null>;
  updatePost(id: string, post: NewPost): Promise<Post | null>;
  deletePost(id: string): Promise<boolean>;
}

export class InMemoryPostRepository implements IPostRepository {
  private posts: Post[] = [];

  async getPosts(): Promise<Post[]> {
    return this.posts;
  }

  async createPost(post: NewPost): Promise<Post> {
    const newPost = { ...post, id: uuidv4() };
    this.posts.push(newPost);
    return newPost;
  }

  async getPostById(id: string): Promise<Post | null> {
    return this.posts.find((p) => p.id === id) || null;
  }

  async updatePost(id: string, post: NewPost): Promise<Post | null> {
    const index = this.posts.findIndex((p) => p.id === id);
    if (index === -1) {
      return null;
    }
    const updatedPost = { ...post, id };
    this.posts[index] = updatedPost;
    return updatedPost;
  }

  async deletePost(id: string): Promise<boolean> {
    const index = this.posts.findIndex((p) => p.id === id);
    if (index === -1) {
      return false;
    }
    this.posts.splice(index, 1);
    return true;
  }
}
