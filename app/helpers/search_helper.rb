module SearchHelper

   def pagination_tag(presenter)
     capture do
      presenter.total_pages.times do |i|
        page = i + 1
        if page != presenter.page
          concat(link_to page, search_index_path(page: page))
          concat(" ")
        else
          concat("<a>#{i}</a>")
          concat(" ")
        end
      end
    end
   end

end
