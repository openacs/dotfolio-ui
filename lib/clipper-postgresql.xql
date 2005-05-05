<?xml version="1.0"?>

<queryset>
    <rdbms><type>postgresql</type><version>7.4</version></rdbms>

    <fullquery name="obj_title">
      <querytext>
        SELECT o.object_type, pretty_name AS tname, pretty_plural AS tname_s,
	       title AS obj_title, package_id AS obj_pkg, 
	       acs_object__name(object_id) AS acs_name
               FROM acs_objects o, acs_object_types t
	       WHERE object_id = :displayed_object_id
	       AND t.object_type = o.object_type
      </querytext>
    </fullquery>

    <fullquery name="record_view">
      <querytext>
	SELECT views__record_view(:displayed_object_id, :user_id)
      </querytext>
    </fullquery>

    <fullquery name="views">
      <querytext>
        SELECT views, unique_views
	    FROM view_aggregates
	    WHERE object_id = :displayed_object_id
      </querytext>
    </fullquery>

</queryset>