module BandsHelper
    def band_location
        <p><%= "Band Location: " + @band.location if @band.location %></p>

    <% if @band.tags.size > 0  %>
        <p>Tags:</p>
        
        <% @band.tags.each do |tag| %>
            <p> - <%= tag.name %></p>
        <% end %>
        
    <% end %>
    end 
end
