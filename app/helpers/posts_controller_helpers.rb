helpers do
  def find_and_ensure_post(id)
    post = Post.find_by(id: id)
    halt(404, erb(:'404')) if post.nil?
    post
  end
end
