module ProblemsHelper

  def getNumber(number)
    if number
      number
    else
      0
    end
  end

  def getString(number)
    number.to_s()
  end

end
