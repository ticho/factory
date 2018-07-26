# Factory

## Le pitch

> Les usines sont à la mode en ce moment, nous allons créer un site pour les usines. Nous allons créer un modèle assemblage, qui serait l'assemblage de plusieurs pièces. Une pièce peut appartenir à plusieurs assemblages.

## Models

## assemblies
|Column|Type|
|------|----|
|name|string|
### Associations
- has_and_belongs_to_many :parts

## parts
|Column|Type|
|------|----|
|part_number|string|
### Associations
- has_and_belongs_to_many :assemblies

## assemblies_parts
|Column|Type|
|------|----|
|assemmbly_id|integer|
|part_id|integer|
### Associations
- belongs_to :assemmbly
- belongs_to :part

## Usage

```sh
$ bundle install
$ rails db:migrate
$ rails db:seed
```

## Test
To make sure that the relation between part - assembly goes both ways

```ruby
Part.all.each do |part|
  part.assemblies.each do |assembly|
    if !assembly.parts.include? part
      puts "Error"
    else
      puts "OK"
    end
  end
end
```

## Gems
We use :
- `faker` to populate the database with phony names, emails etc..
