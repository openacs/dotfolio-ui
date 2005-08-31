<?xml version="1.0"?>

<queryset>

  <fullquery name="viewers">
    <querytext>
      SELECT viewer_id, person__name(viewer_id) as viewer_name, views,
          to_char(last_viewed, 'HH24:MI:SS, DD Mon YYYY') as last_viewed
        FROM views
        WHERE object_id = :object_id
    </querytext>
  </fullquery>
    
</queryset>
