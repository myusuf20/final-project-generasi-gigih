require 'rails_helper'

RSpec.describe MenuItemsController do
  describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of menu items starting with the letter" do
        telur_dadar = create(:menu_item, name: "Telur Dadar")
        telur_ceplok = create(:menu_item, name: "Telur Ceplok")
        get :index, params: { letter: 'T' }
        expect(assigns(:menu_items)).to match_array([telur_dadar])
      end
      it "renders the :index template" do
        get :index, params: { letter: 'T' }
        expect(response).to render_template :index
      end
    end

    context 'without params[:letter]' do
      it "populates an array of all menu items" do
        telur_dadar = create(:menu_item, name: "Telur Dadar")
        telur_ceplok = create(:menu_item, name: "Telur Ceplok")
        get :index
        expect(assigns(:menu_items)).to match_array([telur_dadar, telur_ceplok])
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    it "assigns the requested menu_item to @menu_item" do
      menu_item = create(:menu_item)
      get :show, params: { id: menu_item }
      expect(assigns(:menu_item)).to eq @menu_item
    end
    it "renders the :show template" do
      menu_item = create(:menu_item)
      get :show, params: { id: menu_item }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new MenuItem to @menu_item" do
      get :new
      expect(assigns(:menu_item)).to be_a_new(MenuItem)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested menu_item to @menu_item" do
      menu_item = create(:menu_item)
      get :edit, params: { id: menu_item }
      expect(assigns(:menu_item)).to eq menu_item
    end
    it "renders the :edit template" do
      menu_item = create(:menu_item)
      get :edit, params: { id: menu_item }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new menu item in the database" do
        expect{
          post :create, params: { menu_item: attributes_for(:menu_item) }
        }.to change(MenuItem, :count).by(1)
      end
      it "redirects to menu_items#show" do
        post :create, params: { menu_item: attributes_for(:menu_item) }
        expect(response).to redirect_to(menu_item_path(assigns[:menu_item]))
      end
    end

    context "with invalid attributes" do
      it "does not save the new menu item in the database" do
        expect{
          post :create, params: { menu_item: attributes_for(:invalid_menu_item) }
        }.not_to change(MenuItem, :count)
      end
      it "re-renders the :new template" do
        post :create, params: { menu_item: attributes_for(:invalid_menu_item) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @menu_item = create(:menu_item)
    end
    context "with valid attributes" do
      it "locates the requested @menu_item" do
        patch :update, params: { id: @menu_item, menu_item: attributes_for(:menu_item) }
        expect(assigns(:menu_item)).to eq @menu_item
      end

      it "changes @menu_item's attributes" do
        patch :update, params: { id: @menu_item, menu_item: attributes_for(:menu_item, name: "Semur Jengkol") }
        @menu_item.reload
        expect(@menu_item.name).to eq('Semur Jengkol')
      end

      it "redirects to the menu_item" do
        patch :update, params: { id: @menu_item, menu_item: attributes_for(:menu_item) }
        expect(response).to redirect_to @menu_item
      end
    end

    context "with invalid attributes" do
      it "does not update the menu item in the database" do
        patch :update, params: { id: @menu_item, menu_item: attributes_for(:invalid_menu_item, name: 'Semur Jengkol', price: 20000) }
        expect(@menu_item.name).not_to eq('Semur Jengkol')
      end
      it "re-renders the :edit template" do
        patch :update, params: { id: @menu_item, menu_item: attributes_for(:invalid_menu_item) }
        expect(assigns(:menu_item)).to eq @menu_item
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @menu_item = create(:menu_item)
    end

    it "deletes the food from the database" do
      expect{
        delete :destroy, params: { id: @menu_item }
      }.to change(MenuItem, :count).by(-1)
    end

    it "redirects to foods#index" do
      delete :destroy, params: { id: @menu_item }
      expect(response).to redirect_to menu_item_url
    end
  end
end