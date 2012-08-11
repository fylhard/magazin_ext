{* Folder - Line view *}

<div class="content-view-line">
    <div class="class-detal">
        

        {if $node.data_map.photo.has_content}
            <div id="photo">{attribute_view_gui image_class=articlethumbnail href=$node.url_alias|ezurl attribute=$node.data_map.photo}</div>
        {else}
            <div id="photo">{attribute_view_gui image_class=articlethumbnail href=$node.url_alias|ezurl attribute=$image.data_map.image}</div>
        {/if}
        <a id="name" href={$node.url_alias|ezurl}>{$node.name|wash()}</a>
        <a id="brand" href={$node.url_alias|ezurl}>{attribute_view_gui attribute=$node.data_map.brand}</a>
        <a id="model" href={$node.url_alias|ezurl}>{attribute_view_gui attribute=$node.data_map.model}</a>
        <div id="body">{attribute_view_gui attribute=$node.data_map.body}</div>
        <div id="engine">{attribute_view_gui attribute=$node.data_map.engine}</div>
        <div id="color">{attribute_view_gui attribute=$node.data_map.color}</div>
        {if eq($node.data_map.front_back.data_text,'F')}
            <div id="fb">Пер.</div>
        {elseif eq($node.data_map.front_back.data_text,'B')}
            <div id="fb">Зад.</div>
        {else}
            <div id="fb">-</div>
        {/if}
        
        {if eq($node.data_map.right_left.data_text,'R')}
            <div id="rl">Прав.</div>
        {elseif eq($node.data_map.right_left.data_text,'L')}
            <div id="rl">Лев.</div>
        {else}
            <div id="rl">-</div>
        {/if}
        
        {if eq($node.data_map.top_bottom.data_text,'U')}
            <div id="tb">Верх.</div>
        {elseif eq($node.data_map.top_bottom.data_text,'D')}
            <div id="tb">Ниж.</div>
        {else}
            <div id="tb">-</div>
        {/if}

        <div id="price">{attribute_view_gui attribute=$node.data_map.price}</div>
        <hr/>
    </div>
</div>
