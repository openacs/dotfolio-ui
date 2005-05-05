ad_page_contract {

    Displays related items for a displayed_object_id.

    @author  Nick Carroll (nick.c@rroll.net)
    @creation-date 2005-03-24
    @cvs-id  $Id$
} {

}

set url [dotfolio::ui::organiser_url]
set return_url [ad_return_url]
set delete_related_url "related/relation-delete"

# Stuff for related items
relation::get_related -object_id $displayed_object_id -datasource related
template::multirow extend related delete_url
template::multirow foreach related { 
    set delete_url [export_vars -base $url$delete_related_url \
			{rel_id return_url}]
}

template::list::create \
    -name related_items \
    -multirow related \
    -key object_id \
    -elements {
	object_title {
	    label \#dotfolio-ui.related_items\#
	    link_url_eval {/o/$object_id}
	    link_html {title \#dotfolio-ui.view_item\#}
            html {width "100%"}
	}
	remove {
	    display_template {Remove}
	    link_url_eval {$delete_url}
	    link_html {title \#dotfolio-ui.remove_item\#}
	    sub_class narrow
	}
    }

ad_return_template
