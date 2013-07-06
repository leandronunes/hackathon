
STATES = ['ac', 'al', 'am', 'ap', 'ba', 'ce', 'df', 'es', 'go', 'ma', 'mg', 'ms', 'mt', 'pa', 'pi', 'pe', 'pb', 'rj', 'rn', 'rs', 'ro', 'se', 'sc', 'sp', 'to']

POLITICAL_PARTY = ['dem', 'pan', 'pc_do_b', 'pcb', 'pco', 'pdt', 'phs', 'pmdb', 'pmn', 'pp', 'ppl', 'pps', 'pr', 'prb', 'prp', 'prtb', 'psb', 'psc', 'psd', 'psdb', 'psdc', 'psl', 'psol', 'pstu', 'pt', 'pt_do_b', 'ptb', 'ptc', 'ptn', 'pv']

puts STATES.count

STATES.map do |state|
  POLITICAL_PARTY.map do |political_party|
    filename = "filiados_#{political_party}_#{state}"
#    cmd = "wget http://agencia.tse.jus.br/estatistica/sead/eleitorado/filiados/uf/#{filename}.zip"
   
#    puts cmd.inspect
#    system cmd
    system "unzip -o  #{filename}.zip"
    system "mv aplic/sead/lista_filiados/uf/#{filename}.csv ."
  end
end

