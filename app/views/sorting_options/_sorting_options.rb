
<% sorting_options.each do |sorting_option| %>
  <div>
    <%= radio_button_tag 'search[sorting_option_ids][]', sorting_option.id %>
    <%= label_tag "search_sorting_option_#{sorting_option.id}", sorting_option.name %>
  </div>
<% end %>