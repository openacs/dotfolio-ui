<?xml version="1.0"?>

<queryset>

  <fullquery name="object_name">
    <querytext>
      SELECT coalesce(o.title,acs_object__name(:object_one))
          FROM acs_objects o WHERE o.object_id = :object_one
    </querytext>
  </fullquery>
    
</queryset>
