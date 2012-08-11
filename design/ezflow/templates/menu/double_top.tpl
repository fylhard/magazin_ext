<div class="topmenu-design">
    <!-- Top menu content: START -->
    <div id="topmenu-firstlevel-overlay"></div>

    <div id="topmenu-firstlevel-position">
        <ul class="user-links">
            <li class="divider-vertical"></li>
            {if $pagedesign.data_map.tag_cloud_url.data_text|ne('')}
                {if $pagedesign.data_map.tag_cloud_url.content|eq('')}
                <li id="tagcloud"><a href={concat("/content/view/tagcloud/", $pagedata.root_node)|ezurl} title="{$pagedesign.data_map.tag_cloud_url.data_text|wash}"> </a></li>
                {else}
                <li id="tagcloud"><a href={$pagedesign.data_map.tag_cloud_url.content|ezurl} title="{$pagedesign.data_map.tag_cloud_url.data_text|wash}"> </a></li>
                {/if}
            {/if}
            {if $pagedesign.data_map.site_map_url.data_text|ne('')}
                {if $pagedesign.data_map.site_map_url.content|eq('')}
                <li id="sitemap"><a href={concat("/content/view/sitemap/", $pagedata.root_node)|ezurl} title="{$pagedesign.data_map.site_map_url.data_text|wash}"></a></li>
                {else}
                <li id="sitemap"><a href={$pagedesign.data_map.site_map_url.content|ezurl} title="{$pagedesign.data_map.site_map_url.data_text|wash}"></a></li>
                {/if}
            {/if}
            {if $basket_is_empty|not()}
            <li id="shoppingbasket"><a href={"/shop/basket/"|ezurl} title="{$pagedesign.data_map.shopping_basket_label.data_text|wash}">{$pagedesign.data_map.shopping_basket_label.data_text|wash}</a></li>
        {/if}
        {if $current_user.is_logged_in}
            {if $pagedesign.data_map.my_profile_label.has_content}
            <li id="myprofile"><a href={"/user/edit/"|ezurl} title="{$pagedesign.data_map.my_profile_label.data_text|wash}"></a></li>
            {/if}
            {if $pagedesign.data_map.logout_label.has_content}
            <li id="logout"><a href={"/user/logout"|ezurl} title="{$pagedesign.data_map.logout_label.data_text|wash} ( {$current_user.contentobject.name|wash} )"></a></li>
            {/if}
        {else}
            {if $pagedesign.data_map.login_label.has_content}
            <li id="login"><a href={"/user/login"|ezurl} title="{$pagedesign.data_map.login_label.data_text|wash}"></a></li>
            {/if}
        {/if}

        {if $pagedesign.can_edit}
            <li id="sitesettings"><a href={concat( "/content/edit/", $pagedesign.id, "/a" )|ezurl} title="{$pagedesign.data_map.site_settings_label.data_text|wash}"></a></li>
        {/if}
        </ul>
        <div id="group">
        
        
        {include uri='design:page_header_logo.tpl'}
        <ul id="topmenu-firstlevel">
        {def $root_node = fetch( 'content', 'node', hash( 'node_id', $pagedata.root_node ) )
             $top_menu_class_filter = ezini( 'MenuContentSettings', 'TopIdentifierList', 'menu.ini' )
             $top_menu_items = fetch( 'content', 'list', hash( 'parent_node_id', $root_node.node_id,
                                                               'sort_by', $root_node.sort_array,
                                                               'class_filter_type', 'include',
                                                               'class_filter_array', $top_menu_class_filter ) )
             $top_menu_items_count = $top_menu_items|count()
             $item_class = array()
             $level_2_items = 0
             $current_node_in_path = first_set($pagedata.path_array[1].node_id, 0  )
             $current_node_in_path_2 = first_set($pagedata.path_array[2].node_id, 0  )}

        {if $top_menu_items_count}
           {foreach $top_menu_items as $key => $item}
                {set $item_class = array()}
                {if $current_node_in_path|eq($item.node_id)}
                    {set $item_class = array("selected")
                         $level_2_items = fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
                                                                          'sort_by', $item.sort_array,
                                                                          'class_filter_type', 'include',
                                                                          'class_filter_array', $top_menu_class_filter ) )}
                {/if}
                {if $key|eq(0)}
                    {set $item_class = $item_class|append("firstli")}
                {/if}
                {if $top_menu_items_count|eq( $key|inc )}
                    {set $item_class = $item_class|append("lastli")}
                {/if}
                {if $item.node_id|eq( $current_node_id )}
                    {set $item_class = $item_class|append("current")}
                {/if}

                {if eq( $item.class_identifier, 'link')}
                    <li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><div><a {if eq( $ui_context, 'browse' )}href={concat("content/browse/", $item.node_id)|ezurl}{else}href={$item.data_map.location.content|ezurl}{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )} target="_blank"{/if}{/if}{if $pagedata.is_edit} onclick="return false;"{/if} title="{$item.data_map.location.data_text|wash}" class="menu-item-link" rel={$item.url_alias|ezurl}><span>{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</span></a></div></li>
                {else}
                    <li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><div><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if $pagedata.is_edit} onclick="return false;"{/if}><span>{$item.name|wash()}</span></a></div></li>
                {/if}
            {/foreach}
        {/if}
        </ul>
        </div>
        <div style="clear: both;"></div>
    </div>

    {if $level_2_items|count()}
    <div id="topmenu-secondlevel-overlay"></div>
        
    <div id="topmenu-secondlevel-position">
        <ul id="topmenu-secondlevel">
            {foreach $level_2_items as $key => $item}
                {set $item_class = array()}
                {if $current_node_in_path_2|eq($item.node_id)}
                    {set $item_class = array("selected")}
                {/if}
                {if $key|eq(0)}
                    {set $item_class = $item_class|append("firstli")}
                {/if}
                {if $top_menu_items_count|eq( $key|inc )}
                    {set $item_class = $item_class|append("lastli")}
                {/if}
                {if $item.node_id|eq( $current_node_id )}
                    {set $item_class = $item_class|append("current")}
                {/if}

                {if eq( $item.class_identifier, 'link')}
                    <li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><div><a {if eq( $ui_context, 'browse' )}href={concat("content/browse/", $item.node_id)|ezurl}{else}href={$item.data_map.location.content|ezurl}{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )} target="_blank"{/if}{/if}{if $pagedata.is_edit} onclick="return false;"{/if} title="{$item.data_map.location.data_text|wash}" class="menu-item-link" rel={$item.url_alias|ezurl}><span>{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</span></a></div></li>
                {else}
                    <li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><div><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if $pagedata.is_edit} onclick="return false;"{/if}><span>{$item.name|wash()}</span></a></div></li>
                {/if}
            {/foreach}
        </ul>
    </div>
    {/if}
    {undef $level_2_items $root_node $top_menu_items $item_class $top_menu_items_count $current_node_in_path $current_node_in_path_2}
    <!-- Top menu content: END -->
</div>