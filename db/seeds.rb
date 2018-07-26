require 'faker'

# create 10 parts
10.times do
  Part.create(name: Faker::Ancient.god)
end

# create 10 assemblies
10.times do
  Assembly.create(part_number: Faker::Ancient.hero)
end

# these two last commands fill up the assemblies_parts table
# give each part a random assembly
Part.all.each do |part|
  part.assemblies.push(Assembly.all.sample)
  part.save
end

# give each assembly a random part
Assembly.all.each do |assembly|
  assembly.parts.push(Part.all.sample)
  assembly.save
end
