f =  File.read("app/assets/glossaries/political.txt")
f.each_line do |line|
  Keyword.create(name: line, topic: Topic.where(name: "Politic"))
end
