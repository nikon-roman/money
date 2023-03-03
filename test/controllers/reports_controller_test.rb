require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
    
  test "should get index" do
    get reports_index_url
    assert_response :success
  end

  test "should get report_by_category" do
    get reports_report_by_category_url
    assert_response :success
  end

  test "should get report_by_dates" do
    get reports_report_by_dates_url
    assert_response :success
  end

  test "get max_odate in operations" do
    assert_equal("2023-02-22", Operation.all.maximum(:odate).strftime("%Y-%m-%d"))
  end

  test "report_by_category" do
    lst = Operation.where(category_id: 6).group("odate").sum(:amount).values.map { |i| i.to_f}
    assert_equal([10000.0, 10000.0], lst)

    operations = Operation.where(category_id: 6).group(:odate).order(:odate).sum(:amount)
    assert_equal(2, operations.count)
  end

  test "report_by_dates" do
    @operations = Operation.where(odate: "2023-02-17".."2023-02-19").group("odate").sum(:amount)
    assert_equal(3, @operations.count)
  

    sum = 0
    @operations.each do |i, y|
      sum += y.to_f
    end
    assert_equal(663.47, sum)
  end

end
