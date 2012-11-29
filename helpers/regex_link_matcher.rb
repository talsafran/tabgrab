class RegexLinkMatcher
  def regex(node_set, regex)
    node_set.find_all { |node| node['href'] =~ /#{regex}/ }
  end
end
