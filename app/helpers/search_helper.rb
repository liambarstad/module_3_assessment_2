module SearchHelper

   def pagination_tag(presenter)
     out = ""
     presenter.total_pages.times do |i|
       if i != presenter.page
         out.concat(link_to search_index_path(page: i))
         out.concat(" ")
       else
         out.concat("<a>#{i}</a>")
         out.concat(" ")
       end
     end
     return out
   end

end
