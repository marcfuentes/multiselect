class AuthorsController < ApplicationController
  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.all

    @q = Author.search(params[:q])
   @author = @q.result(distinct: true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authors }
    end
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
    @author = Author.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @author }
    end
  end

  # GET /authors/new
  # GET /authors/new.json
  def new
    @author = Author.new

    @all_books = Book.all

    @author_book = @author.authorbooks.build


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @author }
    end
  end

  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(params[:author])

    params[:books][:id].each do |book|
      if :book.empty?
        @author.authorbooks.build(:book_id => book)
      end
    end

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render json: @author, status: :created, location: @author }
      else
        format.html { render action: "new" }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /authors/1
  # PUT /authors/1.json
  def update
    @author = Author.find(params[:id])

    respond_to do |format|
      if @author.update_attributes(params[:author])
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    respond_to do |format|
      format.html { redirect_to authors_url }
      format.json { head :no_content }
    end
  end
end
