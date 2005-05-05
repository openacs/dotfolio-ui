ad_page_contract {
    Display the recently related items

    @author Jeff Davis (davis@xarg.net)
    @creation-date 11/12/2003

    @cvs-id $Id$
} {
    {orderby "related_on,desc"}    
}

set user_id [auth::refresh_login]

set title [_ dotfolio-ui.related_items]

set context [list {related items}]

set elements {
    object_one_title {
        label {Item1}
        display_template {<a href="/o/@related.object_id_one@">@related.object_one_title@</a>}
	html {width "35%"}
    }
    object_two_title {
        label {Item2}
        display_template {<a href="/o/@related.object_id_two@">@related.object_two_title@</a>}
	html {width "35%"}
    }
    related_on {
        label {Added}
	html {width "15%"}
    }
    name {
        label {By}
	link_url_col user_url 
            html {width "15%"}
    }
}

set packages [dotfolio::packages -node_id [ad_conn node_id]]

template::list::create \
    -name related \
    -multirow related \
    -elements $elements \
    -orderby { 
        object_one_title { orderby lower(o1.title) }
        object_two_title { orderby lower(o2.title) }
        related_on { orderby ro.creation_date }
        name { orderby {lower(person__name(ro.creation_user))}}
    }

db_multirow -extend {extra user_url} related related {} {
    set user_url [acs_community_member_url -user_id $user_id]
    set extra foo
}
