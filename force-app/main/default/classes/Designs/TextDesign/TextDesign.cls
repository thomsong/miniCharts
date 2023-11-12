public with sharing class TextDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);

        String iconColor = 'var(--c-txt-ico)';
        String textColor = 'var(--c-txt)';

        // 'stop' -> 'square'
        // 'record' -> 'dot'
        // 'routing_offline' -> 'dot-outline'
        // 
        // 'right'
        // label, chevronright, diamond, jump_to_right, level_down
        String iconName = 'record';//'record';//'phone_landscape';//'salesforce_page';
        
        /* //////////////////////////////////////////////// */
        String iconHTML = '';
        if (iconName != '') {
            iconHTML = ''
                + '<svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg">'
                    + '<use style="fill:var(--icoc)" href="#' + MiniChartsIcons.getIcon('utility', iconName) + '" />'
                + '</svg>';
        }

        ///////////////////////////////////////////////////////
        String textHTML = MiniChartsHelper.generateLabelText('Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo WgrldHelgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld');
        
        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        String output = '';
        output += '<div class="b fxr fmd" style="--c:' + textColor + ';--icoc:' + iconColor + ';">';
            output += '<div class="txt tal tcd">' + iconHTML + textHTML + '</div>';
        output += '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return 'font-size:13px;--fs:1em;--lc:1;.txt{line-height:1.15;height:fit-content;display:-webkit-box;white-space:normal;-webkit-box-orient:vertical;-webkit-line-clamp:var(--lc);&:has(svg){padding-left:min(1em,calc(calc(var(--lc) - 1)*1em));text-indent:max(-1em,calc(calc(var(--lc) - 1)*-1em))}}& svg{height:.8em;vertical-align:middle;margin:-.2em .2em 0 0}&.sz1{&:is(.tm,.mm,.rm) .txt{text-align:center}:is(.fxlg,.fxxlg){--fs:1.35em}.fxsm{--lc:2}}&.sz2{--lc:2;.fxsm{--lc:4}.fsm{--lc:3}}&.sz3{--lc:4;.fxsm{--lc:6}.fsm{--lc:5}.flg{--lc:3}.fxlg{--lc:2}}:is(.flg,.fxlg,.fxxlg){font-weight:300}.fxsm{--fs:.65em}.fsm{--fs:.75em}.fmd{--fs:1em}.flg{--fs:1.35em}.fxlg{--fs:1.85em;--lc:1}.fxxlg{--fs:2.5em;--lc:1}&:is(.tr,.mr,.rr) .txt{text-align:right}&:is(.tm,.mm,.rm,.tr,.mr,.rr) .txt{padding:0;text-indent:0}';}
    
    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);
        String iconColor = 'var(--c-txt-ico)';
        String textColor = 'var(--c-txt)';
        String iconName = 'record';//'record';//'phone_landscape';//'salesforce_page';
        /* //////////////////////////////////////////////// */
        String iconHTML = '';
        if (iconName != '') {
            iconHTML = '<svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg"><use style="fill:var(--icoc)" href="#'+MiniChartsIcons.getIcon('utility', iconName)+'" /></svg>';
        }
        String textHTML = MiniChartsHelper.generateLabelText('Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo WgrldHelgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld');
        String output = '';
        output += '<div class="b fxr fmd" style="--c:'+textColor+';--icoc:'+iconColor+';">';
            output += '<div class="txt tal tcd">'+iconHTML + textHTML+'</div>';
        output += '</div>';
        return output;
    }
}