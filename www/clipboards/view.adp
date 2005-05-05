  <master>
  <property name="title">@title@</property>
  <property name="context">@context@</property>


  <p>#dotfolio-ui.clipboard# @title@ (@items:rowcount@ #dotfolio-ui.items_attached#) <a href="ae?clipboard_id=@clipboard_id@" class="button">#dotfolio-ui.edit_title#</a> 
  <a href="." class="button">#dotfolio-ui.all_clipboards#</a></p>
  <if @items:rowcount@ gt 0>
    <p>#dotfolio-ui.items_in_this_clipboard#</p>
    <ul>
      <multiple name="items">
        <li style="padding: 4px;"> <a href="/o/@items.object_id@">@items.item_title@</a> [@items.object_type@], #dotfolio-ui.clipped# @items.clipped@ <a href="remove?clipboard_id=@clipboard_id@&amp;object_id=@items.object_id@" class="button">#dotfolio-ui.remove#</a></li>
      </multiple>
    </ul>
  </if>
  <else>
    <p>#dotfolio-ui.no_items_in_clipboard#</p>
  </else>


<p><a href="delete?clipboard_id=@clipboard_id@" class="button">#dotfolio-ui.delete_clipboard#</a></p>
