require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'GET #new' do
    # :newテンプレートを表示すること
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    # 無効なユーザ登録のとき、登録されないこと
    it 'when invalid user registration, not be registered' do
      expect {
        post :create, user: FactoryGirl.attributes_for(:user, name: nil)
      }.not_to change(User, :count)
    end
    # 有効なユーザ登録のとき、登録されること
    it 'When a valid user registration, be registered' do
      expect {
        post :create, user: FactoryGirl.attributes_for(:user)
      }.to change(User, :count).by(1)
    end
    # :indexに遷移すること
    it "redirect to :index" do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to root_path(assigns([:users]))
    end
  end

  describe 'login' do
    before :each do
      @user = FactoryGirl.create(:user)
      session[:user_id] = @user.id
    end

    describe 'GET #edit' do
      # :editテンプレートを表示すること
      it 'renders the :edit template' do
        get :edit, id: @user.id
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      # 無効なユーザ情報のとき、変更が行われないこと
      it 'when invalid user ragistration, not changes' do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:user, name: "")
        @user.reload
        expect(@user.name).not_to eq("")
      end
      # 有効なユーザ情報のとき、変更が行われること
      it 'when a valid user registration, changes' do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:user, name: "テスト")
        @user.reload
        expect(@user.name).to eq("テスト")
      end
    end

    describe 'DELETE #destroy' do
      # ユーザ情報が削除されていること
      it 'user information has been deleted' do
        expect{
          delete :destroy, id: @user
        }.to change(User,:count).by(-1)
      end
      # root_pathへ遷移すること
      it 'a transition to root_path' do
        delete :destroy, id: @user
        expect(response).to redirect_to root_url
      end
    end
  end
end
