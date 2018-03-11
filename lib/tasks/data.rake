namespace :data do

  task :init  => :environment do
    Person.destroy_all
    Word.destroy_all
    Point.destroy_all

    people_names = [
      'Pier',
      'Alberto',
      'Daniel',
      'Enrico',
      'Carlo',
      'Surpi',
      'Valentino',
      'GG',
      'Antonio',
      'Phil',
      'Marius',
      'Berti',
      'Arianna',
      'Giulia',
      'Rosso',
      'Chiara',
      'Gpg',
      'Pioz',
      'Nicoletta',
      'Stefanella',
      'Riccardo',
      'Massi',
      'Martina',
      'Morgia',
      'Marco',
      'Blender'
    ]

    people_names.each do |name|
      Person.create(name: name)
    end

    words_names = [
      'dipende',
      'buon',
      'cose',
      'segna',
      'cazzo',
      'buongiorno',
      'paste',
      'blu',
      'secco',
      'parole',
      'grafico',
      'merda',
      'internet'
    ]

    Word.create(name: 'legacy', archived_at: Time.now)
    words_names.each do |name|
      Word.create(name: name)
    end

    points_assigns = [
      {person_name: 'Pier', points_count: 24 },
      {person_name: 'Alberto', points_count: 28 },
      {person_name: 'Daniel', points_count: 35 },
      {person_name: 'Enrico', points_count: 11 },
      {person_name: 'Carlo', points_count: 20 },
      {person_name: 'Surpi', points_count: 17 },
      {person_name: 'Valentino', points_count: 15 },
      {person_name: 'GG', points_count: 26 },
      {person_name: 'Antonio', points_count: 19 },
      {person_name: 'Phil', points_count: 30 },
      {person_name: 'Marius', points_count: 6 },
      {person_name: 'Berti', points_count: 10 },
      {person_name: 'Arianna', points_count: 24 },
      {person_name: 'Giulia', points_count: 12 },
      {person_name: 'Rosso', points_count: 6 },
      {person_name: 'Chiara', points_count: 2 },
      {person_name: 'Gpg', points_count: 49 },
      {person_name: 'Pioz', points_count: 12 },
      {person_name: 'Nicoletta', points_count: 14 },
      {person_name: 'Stefanella', points_count: 16 },
      {person_name: 'Riccardo', points_count: 9 },
      {person_name: 'Massi', points_count: 0 },
      {person_name: 'Martina', points_count: 0 },
      {person_name: 'Morgia', points_count: 23 },
      {person_name: 'Marco', points_count: 6 },
      {person_name: 'Blender', points_count: 12 }
    ]

    points_assigns.each do |points_assign|
      person = Person.find_by(name: points_assign[:person_name])
      word   = Word.find_by(name: 'legacy')
      points_assign[:points_count].times do
        Point.create(person: person, word: word)
      end
    end
  end


end
