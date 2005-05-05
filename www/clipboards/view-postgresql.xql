<?xml version="1.0"?>

<queryset>

  <fullquery name="clipboard">
    <querytext>
      SELECT u.first_names || ' ' || u.last_name AS owner_name,
          c.owner_id, o.title 
      FROM clipboards c, acs_objects o, acs_users_all u
      WHERE c.clipboard_id = :clipboard_id 
          AND o.object_id = c.clipboard_id
          AND o.object_type = 'clipboard'
          AND c.owner_id = u.user_id
    </querytext>
  </fullquery>

  <fullquery name="get_items">
    <querytext>
      SELECT o.object_id, t.pretty_name AS object_type,
          coalesce(o.title,'object '||o.object_id) AS item_title,
          to_char(m.clipped_on,'YYYY-MM-DD HH24:MI:SS') AS clipped_ansi
      FROM clipboard_object_map m, acs_objects o, acs_object_types t
      WHERE clipboard_id = :clipboard_id
          AND o.object_id = m.object_id
          AND t.object_type = (case when o.object_type = 'content_item' then (select case when i.content_type = 'content_extlink' then 'content_extlink' else r.object_type end from acs_objects r, cr_items i where r.object_id = coalesce(i.live_revision, i.latest_revision, i.item_id) and i.item_id = o.object_id) else o.object_type end)
    </querytext>
  </fullquery>
    
</queryset>
