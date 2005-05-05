<?xml version="1.0"?>

<queryset>

  <fullquery name="related">
    <querytext>
      SELECT to_char(ro.creation_date,'YYYY-MM-DD HH24:MI') as related_on, coalesce(o1.title,'? '||o1.object_type||o1.object_id) as object_one_title, o2.title as object_two_title, person__name(ro.creation_user) as name, object_id_one, object_id_two
      FROM content_rels r, acs_objects o1, acs_objects o2, acs_rels ar, acs_objects ro
     WHERE o1.object_id = ar.object_id_one
       and o2.object_id = ar.object_id_two
       and ar.rel_id = r.rel_id 
       and ro.object_id = r.rel_id
       and ( o1.package_id in ([join $packages ,])
             or o2.package_id in ([join $packages ,]))
   [template::list::orderby_clause -orderby -name "related"]
    </querytext>
  </fullquery>
    
</queryset>
