require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
	before(:each) do
    @user=User.create(email: 'email@example.com', password: 'dupa1234')
    sign_in @user
	end
  describe "GET #index" do
    it 'should render with status 200' do
      get :index
      expect(response).to be_succes
      expect(response).to have_http_status(200)
    end

    it 'should render index' do
    	get :index
    	expect(response).to render_template('index')
    end

    it 'should have @articles with all articles' do
    	article1 = Article.create(title:'title1', content: 'contentcontent1', user_id: 1)
    	article2 = Article.create(title:'title2', content: 'contentcontent2', user_id: 2) 
      get :index
      expect(assigns(:articles)).to match_array([article1, article2])
    end

    it 'redirects after create article' do
      post :create, article: {title: 'title1', content: 'contentcontent1', user_id: 1}
      expect(response).to redirect_to(articles_path)
    end
  end	

  describe "GET show" do
    it 'should render with status 200' do
    	article = Article.create(title:'title1', content: 'contentcontent1', user_id: 1 )
    	get :show, id: article.id
      expect(response).to be_succes
      expect(response).to have_http_status(200)
    end	
  end
  
end
