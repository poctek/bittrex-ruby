# Monkey patch BigDecimal#inspect
# Otherwises test errors print like:
# expected: #<BigDecimal:108482700,'0.11E3',9(27)>
#     got: #<BigDecimal:108468080,'0.12E3',9(27)>
# After get:
# expected: 110.0
#      got: 120.0

require 'bigdecimal'

module BigDecimalInspect
  def inspect
    to_s
  end

  def self.prepend!
    BigDecimal.prepend(::BigDecimalInspect)
    Float.prepend(::BigDecimalInspect)
  end
end

BigDecimalInspect.prepend!


