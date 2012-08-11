{* Car part - Full view *}

<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

    <div class="content-view-full">
        <div class="class-detal">

        <div class="attribute-header hr">
            <h1>Название запчасти: {$node.data_map.name.content|wash()}</h1>
        </div>





            
            <div class="detal-data">
            <div class="item"><label>Цена: </label> {attribute_view_gui attribute=$node.data_map.price}</div>
            <div class="item"><label>Марка: </label> {attribute_view_gui attribute=$node.data_map.brand}</div>
            <div class="item"><label>Модель: </label> {attribute_view_gui attribute=$node.data_map.model}</div>
            <div class="item"><label>Кузов: </label> {attribute_view_gui attribute=$node.data_map.body}</div>
            <div class="item"><label>Номер: </label> {attribute_view_gui attribute=$node.data_map.number}</div>
            <div class="item"><label>Двигатель: </label> {attribute_view_gui attribute=$node.data_map.engine}</div>
            <div class="item"><label>Перед/Зад: </label> {attribute_view_gui attribute=$node.data_map.front_back}</div>
            <div class="item"><label>Право/Лево: </label> {attribute_view_gui attribute=$node.data_map.right_left}</div>
            <div class="item"><label>Верх/Низ: </label> {attribute_view_gui attribute=$node.data_map.top_bottom}</div>
            <div class="item"><label>Производитель: </label> {attribute_view_gui attribute=$node.data_map.manufacturer}</div>
            <div class="item"><label>Код производителя: </label> {attribute_view_gui attribute=$node.data_map.manufacturer_code}</div>
            <div class="item"><label>ОЕМ код: </label> {attribute_view_gui attribute=$node.data_map.oem_code}</div>
            <div class="item"><label>Цвет: </label> {attribute_view_gui attribute=$node.data_map.color}</div>
            <div class="item"><label>Дата выпуска: </label> {attribute_view_gui attribute=$node.data_map.release_date}</div>
            <div class="item"><label>Примечание: </label> {attribute_view_gui attribute=$node.data_map.note}</div>
            <div class="item"><label>Полка: </label> {attribute_view_gui attribute=$node.data_map.shelf}</div>
            </div>
            <div class="detal-photo">
            {if $node.data_map.photo.has_content}
                <div class="attribute-image">
                    {attribute_view_gui attribute=$node.data_map.photo image_class=large}

                </div>
            {/if}
            </div>
        </div>
    </div>

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>