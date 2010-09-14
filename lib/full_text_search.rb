module FullTextSearch
  def full_text_search(query, options = {}, more_options = {})
    unless query.blank?
      default_options = {:limit => 50, :page => 1}
      options = default_options.merge options
      options[:offset] = options[:limit] * (options.delete(:page).to_i - 1)
      results = find_by_contents(query, options, more_options)
      [results.total_hits, results]
    end
  end
end
