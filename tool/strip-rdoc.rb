#!ruby

source = ARGF.read
source = source.gsub(%r{/\*\*((?!\*/).+?)\*/}m) do |comment| 
  comment = $1
  next "/**#{comment}*/" unless /^\s*\*\s?\-\-\s*$/ =~ comment
  doxybody = nil
  comment.each_line do |line|
    if doxybody
      if /^\s*\*\s?\+\+\s*$/ =~ line
        break
      end
      doxybody << line
    else
      if /^\s*\*\s?--\s*$/ =~ line
        doxybody = "\n"
      end
    end
  end
  "/**#{doxybody}*/"
end
print source
