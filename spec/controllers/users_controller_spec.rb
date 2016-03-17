require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe 'GET #index' do
    # :indexテンプレートを表示すること
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #index' do
    # 無効なログインのとき、:indexテンプレートをエラー付きで表示すること
    it 'when invalid user login, to display the :index template with an error'
    # 有効なログインのとき、ログイン状態でroot_pathへ遷移すること
    it 'when a valid user login, be a transition in the login state to root_path'
  end

  describe 'GET #new' do
    # :newテンプレートを表示すること
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    # 無効なユーザ登録のとき、:newテンプレートをエラー付きで表示すること
    it 'when invalid user registration,to display the :new template with an error'
    # 有効なユーザ登録のとき、ログイン状態でroot_pathへ遷移すること
    it 'When a valid user registration, be a transition in the login state to root_path'
  end

  describe 'GET #edit' do
    # :editテンプレートを表示すること
    it 'renders the :edit template' do
      get :edit, id: 1
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    # 無効なユーザ情報のとき、:editテンプレートをエラー付きで表示すること
    it 'when invalid user ragistration, to display the :edit template with an error'
    # 有効なユーザ情報のとき、:editテンプレートを表示すること
    it 'when a valid user registration, to display the :edit template'
  end

  describe 'GET #destroy' do
    # :destroyテンプレートを表示すること
    it 'renders the :destroy template' do
      get :destroy, id: 1
      expect(response).to render_template :destroy
    end
  end

  describe 'DELETE #destroy' do
    # ユーザ情報が削除されていること
    it 'user information has been deleted'
    # ログアウト状態で、root_pathへ遷移すること
    it 'a transition in the logout state to root_path'
  end
end
