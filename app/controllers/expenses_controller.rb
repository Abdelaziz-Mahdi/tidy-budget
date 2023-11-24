class ExpensesController < ApplicationController
  # GET /expenses or /expenses.json
  def index
    @expenses = current_user.categories.find(params[:category_id]).expenses.order(created_at: :desc)
    @category = Category.find(params[:category_id])
    @total_expenses = @expenses.sum(:amount)
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # POST /expenses or /expenses.json
  def create
    @category = Category.find(expense_params[:category_id])
    @expense = Expense.new(expense_params.except(:category_id))
    @expense.author = current_user

    respond_to do |format|
      if @expense.save
        @category_expense = CategoryExpense.create(category_id: @category.id, expense_id: @expense.id)
        if @category_expense.save
          flash[:success] = 'Expense was successfully created!'
          format.html { redirect_to category_expenses_path(@category, @expense) }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @expense.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id)
  end
end
