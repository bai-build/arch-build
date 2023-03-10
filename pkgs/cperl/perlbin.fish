# Set path to perl scriptdirs if they exist
# https://wiki.archlinux.org/index.php/Perl_Policy#Binaries_and_scripts

if status --is-login
    for perldir in /usr/bin/site_cperl /usr/bin/vendor_cperl /usr/bin/core_cperl
        if test -d $perldir; and not contains $perldir $PATH
            set PATH $PATH $perldir
        end
    end
end
