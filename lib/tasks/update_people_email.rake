desc 'Set person email from name'
task update_people_email: :environment do
  user_map ={
    'Manfrinati' => 'alberto.manfrinati@uqido.com',
    'Carlo'      => 'carlo.martinucci@uqido.com',
    'Pioz'       => 'enrico.pilotto@uqido.com',
    'Marco'      => 'marco.ponchia@uqido.com',
    'Valentina'  => 'valentina.pierpaoli@uqido.com',
    'Mattia'     => 'mattia.scattolin@uqido.com',
    'Antonio'    => 'antonio.ruggiero@uqido.com',
    'Phil'       => 'filippo.gambarotto@uqido.com',
    'Berti'      => 'tommaso.bertagnin@uqido.com',
    'Surpi'      => 'riccardo.surpi@uqido.com',
    'Bellakioma' => 'marco.bottaro@uqido.com',
    'Gpg'        => 'gianpaolo.greco@uqido.com',
    'Massi'      => 'massimiliano.janes@uqido.com',
    'Nicoletta'  => 'nicoletta.rampazzo@uqido.com',
    'Blender'    => 'marco.giammetti@uqido.com',
    'Morgia'     => 'riccardo.morgia@uqido.com',
    'Riccardo'   => 'riccardo.angius@uqido.com',
    'Merli'      => 'daniel.merli@uqido.com',
    'Enrico'     => 'enrico.boscolo@uqido.com',
    'Valentino'  => 'valentino.bononi@uqido.com',
    'Nicolae'    => 'nicolae.teslaru@uqido.com',
    'Daniel'     => 'daniel.pettenon@uqido.com',
    'Giulia'     => 'giulia.granzotto@uqido.com',
    'Rosso'      => 'tommaso.rosso@uqido.com',
    'Marius'     => 'marius.chiriac@uqido.com',
    'Spolador'   => 'nicola.spolador@uqido.com',
    'Favero'     => 'massimiliano.favero@uqido.com',
    'Alberto'    => 'alberto.silletti@uqido.com',
    'Mastrella'  => 'giulia.mastrella@uqido.com',
    'Pier'       => 'piermattia.avesani@uqido.com',
    'Beatrice'   => 'beatrice.zillio@uqido.com',
    'Chiara'     => 'chiara.giuliani@uqido.com',
    'Stefanella' => 'stefanella.ebhardt@uqido.com',
    'Vincenzo'   => 'vincenzo.fabiano@uqido.com',
    'Gg'         => 'giacomo.garoffolo@uqido.com' 
  }
  Person.find_in_batches do |group|
    group.each do |user|
      user.update(email: user_map[user.name]) if user_map[user.name]
    end
  end
end