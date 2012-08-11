{ezscript_require( array( 'ezjsc::jquery', 'ezjsc::jqueryio' ) )}

<script type="text/javascript">
{literal}
    var getBrands = function() {
                var temp = $("#model :selected").val();
                var parentNodeID = $("#brand :selected").val();
                if ($("#brand :selected").text() != 'Все')
                $("#pbrand").attr('value',$("#brand :selected").text());
                $("#model").empty().append("<option value=\"\">Все</option>");
                $.ez('detal::search', {param1: parentNodeID}, function( data ){
                        jQuery.each(data.content, function(key, value){
                            if (value['name'] == temp)
                                $("#model").append("<option selected='selected'>"+value['name']+"</option>");
                            else
                                $("#model").append("<option>"+value['name']+"</option>");
                        });                   
                });
    }
    $(document).ready(function() {
        var model = $("#model").text();
        getBrands();
    });

    jQuery(function( $ )
    {
        $("#brand").change( function () {
            if ($(this).val() != "") {
                getBrands();
            } else {
                $("#model").empty().append("<option value=\"\">Все</option>");
                $("#pbrand").attr('value',"");
            }
        }); 
    });
        
        
{/literal}
</script>

{def $parts = fetch('detal','parts', hash())
     $brands = fetch( 'content','list', hash( 'parent_node_id', '2', 
                                            'class_filter_type', 'include',
                                            'class_filter_array', array('brand')) ) }

<div class="search_form s2">
    <form method="post" action={"detal/search"|ezurl}>
        <div class="select-group">
            <label>Наименование</label>                                        
            <select id="detal" name="detal">
                <option value="">Все</option>
                {foreach $parts as $part}
                    {if eq($searchData['detal'], $part.name)}
                        <option selected="selected">{$part.name}</option>
                    {else}
                        <option>{$part.name}</option>
                    {/if}
                {/foreach}
            </select>

            <label>Марка</label>
            <select id="brand">
                <option value="">Все</option>
                {foreach $brands as $brand}
                    {if eq($searchData['brand'], $brand.name)}
                        <option selected="selected" value="{$brand.node_id}">{$brand.name}</option>
                    {else}
                        <option value="{$brand.node_id}">{$brand.name}</option>
                    {/if}
                {/foreach}
            </select>
            <input id="pbrand" type="hidden" name="brand" value=""/>
            <label>Модель</label>
            <select id="model" name="model">
                <option selected="selected">{$searchData['model']}</option>
            </select>
        </div>
        <div class="input-group">
            <input type="text" name="body" placeholder="Кузов" value="{$searchData['body']}" />
            <input type="text" name="engine" placeholder="Двигатель"  value="{$searchData['engine']}"/>
            <input type="text" name="color" placeholder="Цвет"  value="{$searchData['color']}"/>
        </div>
        
        <div class="radio-group">
            <label>Расположение:</label>
        <div class="control-group">
            <div class="controls">
                {if eq($searchData['rl'],"R")}
                    <input type="radio" value="" id="rl1" name="rl"/>
                    <label for="rl1"> Любой</label>

                    <input type="radio" checked="" value="R" id="rl2" name="rl"/>
                    <label for="rl2">Правый</label>

                    <input type="radio" value="L" id="rl3" name="rl"/>
                    <label for="rl3">Левый</label>
                {elseif eq($searchData['rl'],"L")}
                    <input type="radio" value="" id="rl1" name="rl"/>
                    <label for="rl1"> Любой</label>

                    <input type="radio" value="R" id="rl2" name="rl"/>
                    <label for="rl2">Правый</label>

                    <input type="radio" checked="" value="L" id="rl3" name="rl"/>
                    <label for="rl3">Левый</label>
                {else}
                    <input type="radio" checked="" value="" id="rl1" name="rl"/>
                    <label for="rl1"> Любой</label>

                    <input type="radio" value="R" id="rl2" name="rl"/>
                    <label for="rl2">Правый</label>

                    <input type="radio" value="L" id="rl3" name="rl"/>
                    <label for="rl3">Левый</label>
                {/if}
            </div>
        </div>
        
        <div class="control-group">
            <div class="controls">
                {if eq($searchData['fb'],"F")}
                    <input type="radio" value="" id="fb1" name="fb"/>
                    <label for="fb1">Любой</label>

                    <input type="radio" checked="" value="F" id="fb2" name="fb"/>
                    <label for="fb2">Передний</label>

                    <input type="radio" value="B" id="fb3" name="fb"/>
                    <label for="fb3">Задний</label>
                {elseif eq($searchData['fb'],"B")}
                    <input type="radio"  value="" id="fb1" name="fb"/>
                    <label for="fb1">Любой</label>

                    <input type="radio" value="F" id="fb2" name="fb"/>
                    <label for="fb2">Передний</label>

                    <input type="radio" checked="" value="B" id="fb3" name="fb"/>
                    <label for="fb3">Задний</label>
                {else}
                    <input type="radio" checked="" value="" id="fb1" name="fb"/>
                    <label for="fb1">Любой</label>

                    <input type="radio" value="F" id="fb2" name="fb"/>
                    <label for="fb2">Передний</label>

                    <input type="radio" value="B" id="fb3" name="fb"/>
                    <label for="fb3">Задний</label>
                {/if}
            </div>
        </div>
        
        <div class="control-group">
            <div class="controls">
                {if eq($searchData['tb'],"U")}
                    <input type="radio" value="" id="tb1" name="tb"/>
                    <label for="tb1">Любой</label>

                    <input type="radio" checked="" value="U" id="tb2" name="tb"/>
                    <label for="tb2">Верхний</label>

                    <input type="radio" value="D" id="tb3" name="tb"/>
                    <label for="tb3">Нижний</label>
                {elseif eq($searchData['tb'],"D")}
                    <input type="radio" value="" id="tb1" name="tb"/>
                    <label for="tb1">Любой</label>

                    <input type="radio" value="U" id="tb2" name="tb"/>
                    <label for="tb2">Верхний</label>

                    <input type="radio" checked="" value="D" id="tb3" name="tb"/>
                    <label for="tb3">Нижний</label>
                {else}
                    <input type="radio" checked="" value="" id="tb1" name="tb"/>
                    <label for="tb1">Любой</label>

                    <input type="radio" value="U" id="tb2" name="tb"/>
                    <label for="tb2">Верхний</label>

                    <input type="radio" value="D" id="tb3" name="tb"/>
                    <label for="tb3">Нижний</label>
                {/if}
            </div>
        </div>
        </div>
        <br/>
        <input class="btn" type="submit" value="Поиск"/>
    </form>
</div>

{def $image=fetch('content','node', hash('node_id', '8619'))
     $url_alias='detal/search'
     $search=fetch( 'content', 'search',
                    hash( 'text', $searchString,
                          'class_id', array( '48' ),
			  'offset', $offset,
			  'limit', 10 ) )}
<div class="search"></div>
<div class="content-view-lineh">
                    <div class="class-detal">
                        
                        <div id="photo">Фото</div>
                        <div id="name">Наименование</div>
                        <div id="brand">Марка</div>
                        <div id="model">Модель</div>
                        <div id="body">Кузов</div>
                        <div id="engine">Двигатель</div>
                        <div id="color">Цвет</div>
                        <div id="fb">Пер./Зад.</div>
                        <div id="rl">Прав./Лев.</div>
                        <div id="tb">Верх./Ниж.</div>
                        <div id="price">Цена р.</div>
                        <hr/>
                    </div>
                </div>

{foreach $search.SearchResult as $res}
	{node_view_gui view='line' content_node=$res image=$image}
{/foreach}

            {include name=navigator
                     uri='design:detal/navigator/search_pagination.tpl'
                     page_uri=$url_alias
                     item_count=$search.SearchCount
                     view_parameters=$offset
                     item_limit=10
                     getString=$getString}