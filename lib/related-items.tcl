ad_page_contract {

    Displays related items for a displayed_object_id.

    @author  Nick Carroll (nick.c@rroll.net)
    @creation-date 2005-03-24
    @cvs-id  $Id$
} {

}

set return_url [ad_return_url]
set delete_related_url "related/relation-delete"
set user_id [ad_conn user_id]
set url [dotfolio::ui::users_organiser_url -user_id $user_id]

# Stuff for related items
relation::get_related -object_id $displayed_object_id -datasource related
template::multirow extend related delete_url object_type created_rel_p
template::multirow foreach related { 
    set delete_url [export_vars -base $url$delete_related_url \
			{rel_id return_url}]

    set object_type [dotfolio::object_type_pretty_name -object_id $object_id]

    set created_rel_p [dotfolio::ui::created_rel_p -user_id $user_id -rel_id $rel_id]
}

template::list::create \
    -name related_items \
    -multirow related \
    -key object_id \
    -elements {
	object_title {
	    label \#dotfolio-ui.related_item\#
	    link_url_eval {/o/$object_id}
	    link_html {title \#dotfolio-ui.view_item\#}
	}
	object_type {
	    label \#dotfolio-ui.type\#
	}
	name {
	    label \#dotfolio-ui.created_by\#
	}
	related_on {
	    label \#dotfolio-ui.created_on\#
	}
	remove {
	    display_template {<if @related.created_rel_p@>\#dotfolio-ui.remove2\#</if>}
	    link_url_eval {$delete_url}
	    link_html {title \#dotfolio-ui.remove_item\#}
	}
    }

ad_return_template
