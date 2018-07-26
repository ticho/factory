require 'faker'

# create 10 parts
10.times do
  Part.create(name: Faker::Ancient.god)
end

# create 10 assemblies
10.times do
  Assembly.create(part_number: Faker::Ancient.hero)
end

# the assembly - part relation should be mutual
Part.all.each do |part|
  assembly = Assembly.all.sample
  part.assemblies.push(assembly)
  assembly.parts.push(part)
  part.save
  assembly.save
end
