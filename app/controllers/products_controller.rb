class ProductsController < ApplicationController

  def index
    @products = Product.order('created_at DESC')
    @total =  @products.sum(:price)
    @prome = prom(@total , @products.count)
    @hash = data
   
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="CostAnalysis.xlsx"'
      }
    end
  end

  def sales_document
    @products = Product.order('created_at DESC')
    @total =  @products.sum(:price)
    @prome = prom(@total , @products.count)
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="all_products.xlsx"'
      }
    end      
  end


  private

  def prom (sum , count)
      a = (sum / count)
      return a
  end 
  
  def data 
    @h = {
      :marca1 => {
        :name => "ES8000",
        :alumin =>{
          :titulo => "ALUMINIO",
          :tipo => "ALU-DURANAR",
          :cant => 10,
          :cost_unit => 2500
        },
        :mano1 => {
          :cost => 25000,
          :cant => 34
        },
        :transport1 => {
          :cost => 3000,
          :cant => 34
        }
      },
      :marca2 => {
        :name => "ES8000",
        :alumin =>{
          :tipo => "ALU-SILVER",
          :cant => 20,
          :cost_unit => 450
        },
        :mano1 => {
          :cost => 5000,
          :cant => 43
        },
        :transport1 => {
          :cost => 200,
          :cant => 60
        }
      }
    }
    return @h
  end

end
