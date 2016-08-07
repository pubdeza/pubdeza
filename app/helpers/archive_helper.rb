module ArchiveHelper
  def correct_date(num)
    thisMonth = Date.today.month
    month = thisMonth - num
    case month
    when 0
      12
    when -1
      11
    when -2
      10
    else
      thisMonth - num
    end
  end
end
