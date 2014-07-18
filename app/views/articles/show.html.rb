<div class='article_show'>
	<%= render @article %>
<div class = 'comments'>
Komentarze:
  <% @comments.each do |c| %>
  <div class='comment'>
    <%= c.user.email %><br/>
    <%= c.content %>
  </div>
 <% end %>

  <%= form_for @comment do |f| %>
    <%= f.label :content %>:<br />
    <%= f.text_area(:content, size: '50x10' ) %><br />

    <%= f.hidden_field :article_id, :value=>@article.id  %>
    <%= f.submit %>
  <% end %>
</div>
