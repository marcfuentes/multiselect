class AuthorbooksController < ApplicationController
  # GET /authorbooks
  # GET /authorbooks.json
  def index
    @authorbooks = Authorbook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authorbooks }
    end
  end

  # GET /authorbooks/1
  # GET /authorbooks/1.json
  def show
    @authorbook = Authorbook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @authorbook }
    end
  end

  # GET /authorbooks/new
  # GET /authorbooks/new.json
  def new
    @authorbook = Authorbook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @authorbook }
    end
  end

  # GET /authorbooks/1/edit
  def edit
    @authorbook = Authorbook.find(params[:id])
  end

  # POST /authorbooks
  # POST /authorbooks.json
  def create
    @authorbook = Authorbook.new(params[:authorbook])

    respond_to do |format|
      if @authorbook.save
        format.html { redirect_to @authorbook, notice: 'Authorbook was successfully created.' }
        format.json { render json: @authorbook, status: :created, location: @authorbook }
      else
        format.html { render action: "new" }
        format.json { render json: @authorbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /authorbooks/1
  # PUT /authorbooks/1.json
  def update
    @authorbook = Authorbook.find(params[:id])

    respond_to do |format|
      if @authorbook.update_attributes(params[:authorbook])
        format.html { redirect_to @authorbook, notice: 'Authorbook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @authorbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authorbooks/1
  # DELETE /authorbooks/1.json
  def destroy
    @authorbook = Authorbook.find(params[:id])
    @authorbook.destroy

    respond_to do |format|
      format.html { redirect_to authorbooks_url }
      format.json { head :no_content }
    end
  end
end
