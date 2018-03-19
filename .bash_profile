source ~/.profile
export PATH="$HOME/.composer/vendor/bin:$HOME/.terminus/vendor/bin:/Applications/MAMP/Library/bin:/Applications/MAMP/bin/php/php5.6.28/bin:$HOME/bin:$PATH"

## Bash completion script for Drupal Console ##
# source "$HOME/.console/console.rc" 2>/dev/null
## Command Completion script for terminus commands ##
# source "$HOME/bin/terminus-completion.bash"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\h \[\033[1;31m\]\W\[\033[1;35m\]\$(parse_git_branch)\[\033[00m\] $ "
#export PS1="\[\033[30m\]\u@\[\033[32m\]\h \[\033[1;31m\]\W\[\033[1;35m\]\$(parse_git_branch)\[\033[00m\] $ "
#export PS1="\u@\h \[\033[1;31m\]\W\[\033[1;35m\]\$(parse_git_branch)\[\033[00m\] $ "

alias drush7=/Users/brayfe/.composer/drush7/vendor/bin/drush
alias drupal=vendor/bin/drupal

alias show-install="drush si -y --account-pass=admin --site-name='Showtime El Paso Subscriptions' && drush en -y showtime_user_import && drush mi --group=users && drush mi subscriptions && drush mi rep_subscriptions && drush @showtime.local uli"

alias eur-install="drush si -y --account-pass=admin && drush en -y features_ui field_ui views_ui admin_toolbar"
alias eur-build="eur-install && drush en -y eureka_migration && drush mi --group=taxonomies && drush mi --group=content && drush sapi-i"

alias cpe-install="drush @cpe.local sql-drop -y && drush8 sql-sync @pantheon.center-professional-education.dev @cpe.local -y && en-admin && drush @cpe.local en -y diff field_ui views_ui devel devel_generate stage_file_proxy && drush @cpe.local dis -y simplesamlphp_auth && drush @cpe.local updb -y && drush vset preprocess_js 0 && drush vset preprocess_css 0 && drush @cpe.local uli"

alias cpe-genc="drush en -y devel devel_generate && drush genc 10 --types=cpe_instructor && drush genc 10 --types=cpe_area_of_study && drush genc 10 --types=cpe_course && drush genc 10 --types=cpe_single_course_cert && drush genc 10 --types=cpe_multi_course_cert && drush genc 10 --types=cpe_section"

alias rtiv3-install="drush si -y rti --account-pass=admin --site-name='' && drush en -y rtimig && drush mreg && drush mi --group=\"RTI\" && drush clear-highwater && drush mi --group=\"RTI\" && drush fra -y && drush cron && drush cron && drush updb -y"  

alias mc-install="drush @mc-local sql-drop -y && drush @mc-local site-install utexas --account-name=admin --account-pass=admin --db-url=mysql://root:root@localhost/mcms -y -v && drush @mc-local cc all && drush @mc-local fra -y && drush @mc-local en dblog -y"

alias lbj-install="drush si utexas --site-name='' --account-pass=admin utexas_preferences.default_page=0 utexas_preferences.default_menu=0 -y && drush en -y lbj_content_import lbj_deploy && drush fra -y && en-admin"

alias upo-install="drush8 sql-sync -y @pantheon.upo.live @upo.local && drush @upo.local dis -y securelogin login_destination simplesamlphp_auth utexas_saml_auth_helper && drush @upo.local en -y stage_file_proxy reroute_email devel && drush @upo.local vset preprocess_css 0 && drush @upo.local vset preprocess_js 0 && drush @upo.local sqlq \"UPDATE users SET mail = 'upodevs@utlists.utexas.edu';\" && drush @upo.local uli" 

alias curenet-install="git pull origin master && drush sync @curenet.prod @curenet.local -y && drush @curenet.local dis -y securepages && drush @curenet.local en -y stage_file_proxy devel && drush @curenet.local uli"

alias en-admin="drush en -y admin_menu* && drush dis -y toolbar"

alias bootcamp-install="drush si -y utexas --site-name='' --account-pass=admin && drush en -y mymodule && en-admin && drush php-eval '_mymodule_add_content()'"

alias aliasup="terminus auth:login --email=brayfe@eid.utexas.edu && terminus aliases"

# For Drupal Coding Standards
# Check Drupal Coding Standards for a file
alias drupalcs="phpcs --standard=Drupal --extensions='php,module,inc,install,test,profile,theme,js,css,info,txt'"

# Check Drupal Best Practices for a file
alias drupalbp="phpcs --standard=DrupalPractice --extensions='php,module,inc,install,test,profile,theme,js,css,info,txt'"

# Fix code to Drupal standards
alias drupalfix="phpcbf --standard=Drupal --extensions='php,module,inc,install,test,profile,theme,js,css,info,txt'"


