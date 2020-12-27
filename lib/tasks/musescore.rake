desc "Format SVGs exported from musescore in /public/notation"
task :format_musecore_svg do
  files = Dir["./scores/export/exercises_scores - Full Score - ??.svg"]

  target_names = [
    'scale_c_major',
    'scale_g_major',
    'scale_d_major',
    'scale_a_major',
    'scale_e_major',
    'scale_b_major',
    'scale_c_flat_major',
    'scale_f_sharp_major',
    'scale_g_flat_major',
    'scale_d_flat_major',
    'scale_c_sharp_major',
    'scale_a_flat_major',
    'scale_e_flat_major',
    'scale_b_flat_major',
    'scale_f_major',

    'scale_a_minor_natural',
    'scale_e_minor_natural',
    'scale_b_minor_natural',
    'scale_f_sharp_minor_natural',
    'scale_c_sharp_minor_natural',
    'scale_g_sharp_minor_natural',
    'scale_d_sharp_minor_natural',
    'scale_e_flat_minor_natural',
    'scale_b_flat_minor_natural',
    'scale_f_minor_natural',
    'scale_c_minor_natural',
    'scale_g_minor_natural',
    'scale_d_minor_natural',

    'scale_a_minor_harmonic',
    'scale_e_minor_harmonic',
    'scale_b_minor_harmonic',
    'scale_f_sharp_minor_harmonic',
    'scale_c_sharp_minor_harmonic',
    'scale_g_sharp_minor_harmonic',
    'scale_d_sharp_minor_harmonic',
    'scale_e_flat_minor_harmonic',
    'scale_b_flat_minor_harmonic',
    'scale_f_minor_harmonic',
    'scale_c_minor_harmonic',
    'scale_g_minor_harmonic',
    'scale_d_minor_harmonic',

    'broken_chord_c_major',
    'broken_chord_c_sharp_major',
    'broken_chord_d_major',
    'broken_chord_d_sharp_major',
    'broken_chord_e_major',
    'broken_chord_f_major',
    'broken_chord_f_sharp_major',
    'broken_chord_g_major',
    'broken_chord_g_sharp_major',
    'broken_chord_a_major',
    'broken_chord_a_sharp_major',
    'broken_chord_b_major',

    'broken_chord_c_minor',
    'broken_chord_c_sharp_minor',
    'broken_chord_d_minor',
    'broken_chord_d_sharp_minor',
    'broken_chord_e_minor',
    'broken_chord_f_minor',
    'broken_chord_f_sharp_minor',
    'broken_chord_g_minor',
    'broken_chord_g_sharp_minor',
    'broken_chord_a_minor',
    'broken_chord_a_sharp_minor',
    'broken_chord_b_minor',
  ]

  svg_line = '<svg width="1000px" height="500px" viewBox="150 650 2700 1000" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.2" baseProfile="tiny">'

  files.each_with_index do |filename, index|
    puts "Loading #{filename}"
    svg = File.read filename
    lines = svg.split "\n"
    lines[1] = svg_line
    formatted_svg = lines.join "\n"
    target_name = target_names[index]
    File.write "./public/notation/#{target_name}.svg", formatted_svg unless target_name.nil?
  end
end
