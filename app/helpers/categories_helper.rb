module CategoriesHelper
  def total_amount(array)
    total = 0
    array.each do |element|
      total += element.amount
    end
    total
  end
end
