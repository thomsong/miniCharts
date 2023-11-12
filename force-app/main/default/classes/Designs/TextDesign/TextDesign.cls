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
                    + '<use style="fill:var(--icoc)" href="#ico-' + MiniChartsIcons.getIcon('utility', iconName) + '" />'
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

    public string getStyle() {return '.TextDesign{font-size:13px;--fs: 1em;--lc: 1}.TextDesign .txt{line-height:1.15;height:fit-content;display:-webkit-box;white-space:normal;-webkit-box-orient:vertical;-webkit-line-clamp:var(--lc)}.TextDesign .txt:has(svg){padding-left:min(1em,(var(--lc) - 1)*1em);text-indent:max(-1em,(var(--lc) - 1)*-1em)}.TextDesign svg{height:.8em;vertical-align:middle;margin:-0.2em .2em 0 0}.TextDesign.sz1 .fxsm{--lc: 2}.TextDesign.sz2{--lc: 2}.TextDesign.sz2 .fxsm{--lc: 4}.TextDesign.sz2 .fsm{--lc: 3}.TextDesign.sz3{--lc: 4}.TextDesign.sz3 .fxsm{--lc: 6}.TextDesign.sz3 .fsm{--lc: 5}.TextDesign.sz3 .flg{--lc: 3}.TextDesign.sz3 .fxlg{--lc: 2}.TextDesign :is(.flg,.fxlg,.fxxlg){font-weight:300}.TextDesign .fxsm{--fs: 0.65em}.TextDesign .fsm{--fs: 0.75em}.TextDesign .fmd{--fs: 1em}.TextDesign .flg{--fs: 1.35em}.TextDesign .fxlg{--fs: 1.85em;--lc: 1}.TextDesign .fxxlg{--fs: 2.5em;--lc: 1}.TextDesign.sz1 :is(.fxlg,.fxxlg){--fs: 1.35em}.TextDesign:is(.tm,.mm,.rm) .txt{text-align:center}.TextDesign:is(.tr,.mr,.rr) .txt{text-align:right}.TextDesign:is(.tm,.mm,.rm,.tr,.mr,.rr) .txt{padding:0;text-indent:0}';}
    
    public string xgetStyle() {return '.TextDesign {  font-size: 13px;  --fs: 1em;  --lc: 1;  .txt {    line-height: 1.15;    height: fit-content;    display: -webkit-box;    white-space: normal;    -webkit-box-orient: vertical;    -webkit-line-clamp: var(--lc);   &:has(svg) {      padding-left: 1em;      text-indent: -1em;    }  }  & svg {    height: 0.8em;    vertical-align: middle;    margin: -0.2em 0.2em 0 0;  }  &.sz1 {    .fxsm {      --lc: 2;    }  }  &.sz2 {    --lc: 2;    .fxsm {      --lc: 4;    }    .fsm {      --lc: 3;    }  }  &.sz3 {    --lc: 4;    .fxsm {      --lc: 6;    }    .fsm {      --lc: 5;    }    .flg {      --lc: 3;    }    .fxlg {      --lc: 2;    }  }  :is(.flg, .fxlg, .fxxlg) {    font-weight: 300;  }  .fxsm {    --fs: 0.65em;  }  .fsm {    --fs: 0.75em;  }  .fmd {    --fs: 1em;  }  .flg {    --fs: 1.35em;  }  .fxlg {    --fs: 1.85em;    --lc: 1;  }  .fxxlg {    --fs: 2.5em;    --lc: 1;  }  &.sz1 {    :is(.fxlg, .fxxlg) {      --fs: 1.35em;    }  }  &:is(.tm, .mm, .rm) {    .txt {      text-align: center;    }  }  &:is(.tr, .mr, .rr) {    .txt {      text-align: right;    }  }  &:is(.tm, .mm, .rm, .tr, .mr, .rr) {    .txt {      padding: 0;      text-indent: 0;    }  }}';}

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
            iconHTML = '<svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg"><use style="fill:var(--icoc)" href="#ico-'+MiniChartsIcons.getIcon('utility', iconName)+'" /></svg>';
        }
        String textHTML = MiniChartsHelper.generateLabelText('Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo WgrldHelgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld Helgo Wgrld');
        String output = '';
        output += '<div class="b fxr fmd" style="--c:'+textColor+';--icoc:'+iconColor+';">';
            output += '<div class="txt tal tcd">'+iconHTML + textHTML+'</div>';
        output += '</div>';
        return output;
    }
}