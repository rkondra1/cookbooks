Uploading new cookbook zips
===========================
```
tar -cf cookbooks wpcookbook.tar.gz
aws s3 cp --acl public-read  wpcookbook.tar.gz s3://cms-authoring-cookbooks/
```
Applying cookbooks
==================
Care
----
```
chef-solo -r https://s3-us-west-2.amazonaws.com/test-wordpress-cookbooks/wpcookbook.tar.gz -o "recipe[test-wordpress::care]"
```
Marketing
---------
```
chef-solo -r https://s3-us-west-2.amazonaws.com/test-wordpress-cookbooks/wpcookbook.tar.gz -o "recipe[test-wordpress::marketing]"
```

