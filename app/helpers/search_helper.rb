module SearchHelper

   def pagination_tag(presenter)
     presenter.total_pages.times do |i|
       if i != presenter.page
         link_to search_index_path(page: i)
       else
         i
       end
     end
   end

end
