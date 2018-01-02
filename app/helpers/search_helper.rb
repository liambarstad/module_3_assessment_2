module SearchHelper

   def pagination_tag(presenter, options={})
     capture do
      presenter.total_pages.times do |i|
        page = i + 1
        concat link_to_if(page != presenter.page, page, search_index_path(page: page, search: presenter.search), options)
        concat(" ")
      end
    end
   end

end
