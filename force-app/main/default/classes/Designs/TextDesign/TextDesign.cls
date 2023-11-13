public with sharing class TextDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);

        String textColor = 'var(--c-txt)';

        String iconColor = 'var(--c-txt-success)';//'var(--c-txt-ico)';
        Decimal iconScale = 0.8;//0.7;
        
        // 'stop' -> 'square'
        // 'record' -> 'dot'
        // 'routing_offline' -> 'dot-outline'
        // 
        // 'right'
        // label, chevronright, diamond, jump_to_right, level_down
        String iconName = 'success';//'record';//'phone_landscape';//'salesforce_page';
        
        /* //////////////////////////////////////////////// */
        String iconHTML = '';
        string iconHeight = '0em';
        if (iconName != '') {
            iconHeight = (1.15 * iconScale).setScale(1) + 'em';

            iconHTML = ''
                + '<svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg">'
                    + '<use style="fill:var(--icoc)" href="#' + MiniChartsIcons.getIcon('utility', iconName) + '" />'
                + '</svg>';
        }

        ///////////////////////////////////////////////////////
        String textHTML = MiniChartsHelper.generateLabelText('Hello WorldHelloWorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello World');
        
        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        String output = '';
        output += '<div class="b fxr fxmd" style="--ih:' + iconHeight + ';--c:' + textColor + ';--icoc:' + iconColor + ';">';
            output += '<div class="txt tal tcd">' + iconHTML + textHTML + '</div>';
        output += '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return 'font-size:13px;--fs:1em;--lc:1;.txt{font-size:var(--fs);color:var(--c);line-height:1.15;height:fit-content;-webkit-box-orient:vertical;-webkit-line-clamp:var(--lc)}& svg{height:var(--ih);vertical-align:middle;margin:-.2em .2em 0 0}&.sz1{&:is(.tm,.mm,.rm) .txt{text-align:center}:is(.fxlg,.fxxlg){--fs:1.35em}.fxsm{--lc:2}}&.sz2{.txt{display:-webkit-box;white-space:normal}--lc:2;.fxsm{--lc:4}.fsm{--lc:3}}&.sz3{.txt{display:-webkit-box;white-space:normal}--lc:4;.fxsm{--lc:5}.fsm{--lc:4}.flg{--lc:3}.fxlg{--lc:2}}:is(.flg,.fxlg,.fxxlg){font-weight:300}.fxsm{--fs:.65em}.fsm{--fs:.75em}.fmd{--fs:1em}.flg{--fs:1.35em}.fxlg{--fs:1.85em}.fxxlg{--fs:2.5em}.fxlg,.fxxlg{--lc:1;.txt{display:block !important;white-space:nowrap !important}}&:is(.tr,.mr,.rr) .txt{text-align:right}&:is(.tm,.mm,.rm,.tr,.mr,.rr) .txt{padding:0;text-indent:0}';}
    
    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);
        String textColor = 'var(--c-txt)';
        String iconColor = 'var(--c-txt-success)';//'var(--c-txt-ico)';
        Decimal iconScale = 0.8;//0.7;
        String iconName = 'success';//'record';//'phone_landscape';//'salesforce_page';
        /* //////////////////////////////////////////////// */
        String iconHTML = '';
        string iconHeight = '0em';
        if (iconName != '') {
            iconHeight = (1.15 * iconScale).setScale(1)+'em';
            iconHTML = '<svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg"><use style="fill:var(--icoc)" href="#'+MiniChartsIcons.getIcon('utility', iconName)+'" /></svg>';
        }
        String textHTML = MiniChartsHelper.generateLabelText('Hello WorldHelloWorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello WorldHello World Hello WorldHello WorldHello World');
        String output = '';
        output += '<div class="b fxr fxmd" style="--ih:'+iconHeight+';--c:'+textColor+';--icoc:'+iconColor+';">';
            output += '<div class="txt tal tcd">'+iconHTML + textHTML+'</div>';
        output += '</div>';
        return output;
    }
}