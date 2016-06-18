module ApplicationHelper
  def document_title
    if @title.present?
      "#{@title} - Baukis"
    else
      'BAUKIS'
    end
  end
end
