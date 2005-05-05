<div class="portlet" id="portlet-clipper">
  <div class="padding">
    <h5>#dotfolio-ui.clipper#</h5>
    <div class="portletBody">
      <div align="left" class="portletContent">

        <div class="clipperSection">
          <h3>#dotfolio-ui.related_items#</h3>
          <p><a class="clipperButton" href="@url@related/relate?object_one=@displayed_object_id@">#dotfolio-ui.add_related_items#</a></p>
        </div>

        <HR>
        <div class="clipperSection">
          <h3>#dotfolio-ui.clipboards#</h3>
          <p>#dotfolio-ui.clip_this_item_to#</p>
          <form style="display: inline;" action="@url@clipboards/attach">
            <input type="hidden" name="object_id" value="@displayed_object_id@"></input>
            <select name="clipboard_id">
            <multiple name="clipboards">
            <option value="@clipboards.clipboard_id@" @clipboards.selected@>@clipboards.title@</option>
            </multiple>
            </select>
            <input type="submit" value="#dotfolio-ui.go#" class="clipperButton"></input>
          </form>
	  <P>
          <if @clipped:rowcount@ gt 0>
            <p>#dotfolio-ui.currently_clipped_to#</p>
            <multiple name="clipped">
            &gt;&nbsp;<a href="@url@clipboards/view?clipboard_id=@clipped.clipboard_id@" title="View clipboard">@clipped.title@</a><BR>
            </multiple>
	    <P>
            <a class="clipperButton" href="@url@clipboards/" title="#dotfolio-ui.tooltip_view_all_existing_clipboards#">#dotfolio-ui.view_all#</a></p>
          </if>
        </div>

        <HR>
        <div class="clipperSection">
          <p>
            <if @views@ eq 1>#dotfolio-ui.item_viewed_once#&nbsp;</if>
            <else>#dotfolio-ui.item_viewed_num_times#&nbsp;</else>
            <if @unique_views@ eq 1>#dotfolio-ui.by_one_unique_visitor#</if>
            <else>#dotfolio-ui.by_num_unique_visitors#</else>
          </p>
        </div>

      </div>
    </div>
  </div>
</div>
