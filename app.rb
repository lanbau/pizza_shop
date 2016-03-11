class PizzaShop < Sinatra::Base
  # INDEX
  get "/pizzas/?" do
    @pizzas = Pizza.all
    # Render View
    # @page_title vs page_title
    # first variable is avaiable to the views,
    # the second is only here
    erb :pizzas
  end

  # NEW
  # important to put this above :id
  get "/pizzas/new" do
    erb :new
  end

  # CREATE
  # THE REQUEST IS DELETED WHEN USER CHANGES PAGE
  # STORE IN DB/COOKIES
  post '/pizzas' do
    @pizza = Pizza.create(params[:pizza])

    # returns a boolean value
    if @pizza.save
      redirect("/pizzas/#{@pizza.id}")
    else
      # If ERROR, redirect to the form
      erb :new
    end
  end

  # EDIT
  get "/pizzas/:id/edit" do
    @pizza = Pizza.find(params[:id])
    erb :edit
  end

  # UPDATE
  patch "/pizzas/:id" do
    @pizza = Pizza.find(params[:id])
    if @pizza.update_attributes(params[:pizza])
      redirect("/pizzas/#{@pizza.id}")
    else
      erb :edit
    end
  end

  # SHOW
  get "/pizzas/:id" do
      @pizza = Pizza.find(params[:id])
      # erb :show, :layout => false
      erb :show
  end

  delete "/pizzas/:id" do
    @pizza = Pizza.find(params[:id])
    @pizza.destroy
    redirect("/pizzas")
  end

end

# Pizza.new({cheese:true})
# Pizza.new({
#   :cheese => true
# })
