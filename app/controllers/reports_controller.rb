class ReportsController < ApplicationController
  
  def index
  end

  def report_by_category
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @report_by_cat = Operation.where(type_operation: params[:type_operation]).where("odate BETWEEN ? AND ?", @start_date, @end_date).group("category_id").sum(:amount)
    #заміна у хеші id категорії на її назву
    @report_by_cat = @report_by_cat.map{ |i, y| [Category.find(i).name, y] }.to_h
    #формування масиву назв категорій
    @dates = @report_by_cat.keys
    #форумування масиву загальних сум по кожній категорії
    @money = @report_by_cat.values
  end

  def report_by_dates
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @report_by_dat = Operation.where(type_operation: params[:type_operation]).where("odate BETWEEN ? AND ?", @start_date, @end_date).group("odate").sum(:amount)
    @report_by_dat = @report_by_dat.map{ |i, y| [i.strftime("%d/%m/%Y"), y] }.to_h
    @dates = @report_by_dat.keys
    @money = @report_by_dat.values
  end
end