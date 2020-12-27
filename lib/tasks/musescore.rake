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
  ]

  svg_line = '<svg width="1000px" height="220px" viewBox="150 600 2700 500" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.2" baseProfile="tiny">'

  files.each_with_index do |filename, index|
    puts "Loading #{filename}"
    svg = File.read filename
    lines = svg.split "\n"
    lines[1] = svg_line
    formatted_svg = lines.join "\n"
    File.write "./public/notation/#{target_names[index]}.svg", formatted_svg
    File.delete filename
  end
end
