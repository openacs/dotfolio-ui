ad_page_contract {
    Displays a list of known users that have viewed a specific displayed
    object.

    @author Nick Carroll (nick.c@rroll.net
    @creation-date 15/08/2005

    @cvs-id $Id$
} {
    object_id
}

set user_id [auth::refresh_login]

set title [_ dotfolio-ui.viewed_by]

set context [list {viewed by}]

set elements {
    viewer_name {
        label {#dotfolio-ui.viewer#}
	display_template {
	    <if @viewers.has_dotfolio@>
	      <a href="@viewers.dotfolio_url@">@viewers.viewer_name@</a>
            </if>
	    <else>@viewers.viewer_name@</else>
	}
    }
    views {
	label {#dotfolio-ui.number_of_times_viewed#}
    }
    last_viewed {
        label {#dotfolio-ui.last_viewed#}
    }
}

template::list::create \
    -name viewers \
    -multirow viewers \
    -elements $elements

db_multirow -extend {has_dotfolio dotfolio_url} viewers viewers {} {
    set has_dotfolio [dotfolio::has_dotfolio_p -user_id $viewer_id]

    set dotfolio_url ""
    if { $has_dotfolio } {
	set dotfolio_url [dotfolio::user::dotfolio_url -user_id $viewer_id]
    }
}
