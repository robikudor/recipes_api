# frozen_string_literal: true

module PaginationHelper
  PAGINATION_LIMIT = 10

  def page
    params[:page]&.to_i || 1
  end

  def per_page
    [params[:per_page]&.to_i || 10, PAGINATION_LIMIT].min
  end

  def offset
    (page - 1) * per_page
  end

  def paginate(record)
    record.offset(offset)
          .limit(per_page)
  end
end
