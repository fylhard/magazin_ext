<div class="input_form">

    {*Массив предметов для ЗНО*}

    {def $subjects = hash( 1, 'Атестат',
                           83, 'Українська мова та література',
                           84, 'Математика',
                           85, 'Географія',
                           86, 'Історія України',
                           87, 'Хімія',
                           88, 'Фізика',
                           89, 'Англійська мова',
                           90, 'Біологія',
                           91, 'Німецька мова',
                           92, 'Французька мова',
                           94, 'Російська мова',
                           95, 'Іспанська мова')}

    <form method="post" action={"read_data/search"|ezurl}>

        <table>
            {foreach $subjects as $id => $subject}
                <tr class="input"> 
                    <td><label>{$subject}</label></td>
                    <td><input type="text" name="{$id}" value="0"></td>
                </tr>
            {/foreach}
        </table>

        <input type="submit" value="Прогноз" class="prognoz"/>
    </form>


</div>