<?xml version="1.0"?>

<queryset>
    <rdbms><type>postgresql</type><version>7.4</version></rdbms>

    <fullquery name="blog_entries">
      <querytext>
        SELECT blog.title, entry_id,
            to_char(blog.entry_date, 'FMMonth FMDDth, YYYY') AS pretty_date
            FROM pinds_blog_entries blog, apm_packages pkg
            WHERE pkg.package_key = 'lars-blogger'
            AND pkg.package_id IN ([join $list_of_package_ids ,]) 
            AND blog.package_id = pkg.package_id
	    AND blog.draft_p = 'f'
	    AND blog.deleted_p = 'f'
            ORDER BY blog.entry_date DESC
            LIMIT 5
      </querytext>
    </fullquery>

</queryset>