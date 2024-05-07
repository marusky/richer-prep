module TransactionsHelper
  def number_to_euros(number)
    number_to_currency(
      number,
      unit: '€',
      separator: ',',
      delimiter: ' ',
      format: '%n %u',
      strip_insignificant_zeros: true
    )
  end
end
