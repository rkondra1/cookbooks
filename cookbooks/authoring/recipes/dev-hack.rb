execute 'copy php configs' do
  command 'cp -r php-configs/z-dev-wordpress-overrides.ini /etc/php.d/'
  user 'root'
  cwd node['wp-authoring']['deploy']['download_dir']
end

