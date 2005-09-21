<master src="/www/site-master">
<property name="header_stuff">
<link rel="stylesheet" type="text/css" href="@dotfolioCSS@" media="all" />
@header_stuff;noquote@
</property>

<if @title@ not nil>
    <property name="title">@page_title;noquote@</property>
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

<!-- Display clipper and related items if there is a displayed object, -->
<!-- and the user is logged in.                                        -->
<if @displayed_object_id@ not nil>
  <p>
  <div class="visualClear"></div>

  <table id="portal-columns">
    <tbody>
      <tr>
        <if @display_clipper@>
	<if @has_dotfolio_p@>
        <td id="portal-column-one">
        <div class="visualPadding">
          <include src="/packages/dotfolio-ui/lib/clipper" displayed_object_id="@displayed_object_id@" />
        </div>
        </td>
        </if>
	</if>

        <td id="portal-column-content">
          <div class="visualPadding">
            <div class="documentBorder">
              <div class="documentContent">
                <if @page_title@ not nil>
                <h1 class="page-title">@page_title;noquote@</h1>
                </if>
                <slave>
              </div>
            </div>

            <if @user_id@ gt 0>
<!-- Need to add related items section below main content. -->
            <include src="/packages/dotfolio-ui/lib/related-items" displayed_object_id="@displayed_object_id@" />
            </if>
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
