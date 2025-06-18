export interface NewPost {
  content: string;
}

export interface Post extends NewPost {
  id: string;
}
