<master src="/www/site-master">
<property name="header_stuff">
<link rel="stylesheet" type="text/css" href="/resources/dotfolio-ui/dotfolio-grey.css" media="all" />
</property>

<if @title@ not nil>
    <property name="title">@title;noquote@</property>
</if>
<if @signatory@ not nil>
  <property name="signatory">@signatory;noquote@</property>
</if>
<if @focus@ not nil>
  <property name="focus">@focus;noquote@</property>
</if>
<if @context@ not nil>
  <property name="context">@context;noquote@</property>
</if>

<!-- Top level navigation -->

<div id="navbar-div">
  <div id="navbar-container">
    <div id="navbar"> 
      <multiple name="tabs">
        <if @tabs.selected_p@ true>
          <div class="tab" id="navbar-here">
            <if @tabs.link_p@ true>
              <a href="@tabs.url@" title="@tabs.title@">@tabs.label@</a>
            </if>
            <else>        
              @tabs.label@
            </else>
          </div>
        </if>
        <else>
          <div class="tab">
            <if @tabs.link_p@ true>
              <a href="@tabs.url@" title="@tabs.title@">@tabs.label@</a>
            </if>
            <else>        
              @tabs.label@
            </else>
          </div>
        </else>
      </multiple>
    </div>
  </div>
</div>

<div id="navbar-body">

<!-- Body -->

<!-- Display clipper and related items if there is a displayed object. -->
<if @displayed_object_id@ not nil>
  <p>
  <div class="visualClear"></div>

  <table id="portal-columns">
    <tbody>
      <tr>
        <td id="portal-column-one">
        <div class="visualPadding">
          <include src="/packages/dotfolio-ui/lib/clipper" displayed_object_id="@displayed_object_id@" />
        </div>
        </td>

        <td id="portal-column-content">
          <div class="visualPadding">
            <div class="documentBorder">
              <div class="documentContent">
                <slave>
              </div>
            </div>

<!-- Need to add related items section below main content. -->
            <include src="/packages/dotfolio-ui/lib/related-items" displayed_object_id="@displayed_object_id@" />

          </div>
        </td>

      </tr>

    </tbody>
  </table>

</if>
<else>
  <P>
  <slave>
</else>
<div style="clear: both;"></div>

</div>

<!-- Include tooltip script for help. -->
<script language="JavaScript" type="text/javascript" src="/resources/dotfolio-ui/tooltip.js"></script>
