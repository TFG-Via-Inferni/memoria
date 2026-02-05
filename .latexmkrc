# Latexmk configuration file
# This file configures latexmk to use a build directory for temporary files

# Set the output directory for auxiliary files
$aux_dir = 'build';
$out_dir = 'build';

# Ensure pdflatex is used
$pdf_mode = 1;

# Additional options for pdflatex
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';

# Configure makeglossaries to work with build directory
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
    my ($base_name, $path) = fileparse($_[0]);
    my $return = system("makeglossaries", "-d", $aux_dir, $base_name);
    return $return;
}

# Clean up auxiliary files
$clean_ext = 'acn acr alg aux bbl blg brf fdb_latexmk fls glg glo gls glsdefs ist lof log lot out synctex.gz tdo thm toc';
