class HomepagePresenter
  attr_reader :transactions

  CHART_COLOR_OTHER = '#aeaeae'

  def initialize(user, view_context)
    @user = user
    @view_context = view_context
    @transactions = load_transactions
  end

  def category_link(category_id)
    return @view_context.category_path(category_id) if category_id.present?

    @view_context.other_categories_path
  end

  def category_title(title)
    title || I18n.t('presenters.homepage.other')
  end

  def chart_data
    transactions.map do |transaction|
      [
        (
          if transaction.category_title.nil?
            I18n.t('presenters.homepage.other')
          else
            transaction.category_title
          end
        ),
        transaction.category_sum
      ]
    end
  end

  def chart_colors
    transactions.map do |transaction|
      color =
        Category::COLORS_TO_HEX[
          Category.colors.invert[transaction.category_color]&.to_sym
        ]

      color.nil? ? CHART_COLOR_OTHER : color
    end
  end

  private

  def load_transactions
    @user
      .transactions
      .left_outer_joins(:category)
      .select(
        'categories.id AS category_id',
        'categories.title AS category_title',
        'categories.color AS category_color',
        'SUM(transactions.amount) AS category_sum'
      )
      .group('category_title')
      .order(category_sum: :desc)
  end
end
