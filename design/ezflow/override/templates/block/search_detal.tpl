{ezscript_require( array( 'ezjsc::jquery', 'ezjsc::jqueryio' ) )}

<script type="text/javascript">
{literal}
       
    jQuery(function( $ )
    {
        $("#detal :first").attr("selected", "selected");
        $("#brand :first").attr("selected", "selected");
        $("#model :first").attr("selected", "selected");
        $("#brand").change( function () {
            if ($(this).val() != "Все") {
                var parentNodeID = $(this).val();
                $("#pbrand").attr('value',$("#brand :selected").text());
                $("#model").empty().append("<option value=\"\">Все</option>");
                $.ez('detal::search', {param1: parentNodeID}, function( data ){
                        jQuery.each(data.content, function(key, value){
                        $("#model").append("<option>"+value['name']+"</option>");
                        });                   
                });
            } else {
                $("#model").empty().append("<option>Все</option>");
            }
        }); 
    });
{/literal}
</script>

{def $parts = fetch('detal','parts', hash())
     $brands = fetch( 'content','list', hash( 'parent_node_id', '2', 
                                            'class_filter_type', 'include',
                                            'class_filter_array', array('brand')) ) }

<div class="search_form">
    <form method="post" action={"detal/search"|ezurl}>
        <div class="select-group">
            <label>Наименование</label>                                        
            <select id="detal" name="detal">
                <option value="">Все</option>
                {foreach $parts as $part}
                    <option>{$part.name}</option>
                {/foreach}
            </select>

            <label>Марка</label>
            <select id="brand">
                <option value="">Все</option>
                {foreach $brands as $brand}
                    <option value="{$brand.node_id}">{$brand.name}</option>
                {/foreach}
            </select>
            <input id="pbrand" type="hidden" name="brand" value=""/>
            <label>Модель</label>
            <select id="model" name="model">
                <option value="">Все</option>
            </select>
        </div>
        <div class="input-group">
            <input type="text" name="body" placeholder="Кузов" />
            <input type="text" name="engine" placeholder="Двигатель" />
            <input type="text" name="color" placeholder="Цвет" />
        </div>
        
        <div class="radio-group">
            <label>Расположение:</label>
        <div class="control-group">
            <div class="controls">
              
                <input type="radio" checked="" value="" id="rl1" name="rl"/>
                <label for="rl1"> Любой</label>
             
                <input type="radio" value="R" id="rl2" name="rl"/>
                <label for="rl2">Правый</label>
              
                <input type="radio" value="L" id="rl3" name="rl"/>
                <label for="rl3">Левый</label>
              
            </div>
        </div>
        
        <div class="control-group">
            <div class="controls">
              
                <input type="radio" checked="" value="" id="fb1" name="fb"/>
                <label for="fb1">Любой</label>
              
                <input type="radio" value="F" id="fb2" name="fb"/>
                <label for="fb2">Передний</label>
              
                <input type="radio" value="B" id="fb3" name="fb"/>
                <label for="fb3">Задний</label>
              
            </div>
        </div>
        
        <div class="control-group">
            <div class="controls">
              
                <input type="radio" checked="" value="" id="tb1" name="tb"/>
                <label for="tb1">Любой</label>
              
                <input type="radio" value="U" id="tb2" name="tb"/>
                <label for="tb2">Верхний</label>
              
                <input type="radio" value="D" id="tb3" name="tb"/>
                <label for="tb3">Нижний</label>
              
            </div>
        </div>
        </div>
        <br/>
        <input class="btn" type="submit" value="Поиск"/>
    </form>
</div>