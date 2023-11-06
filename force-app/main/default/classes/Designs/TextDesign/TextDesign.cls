public with sharing class TextDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE() {
        
        return ''
        + '<div class="body" style="">'
            // + '<div class="lbl tc fnt-xlg">'
                // + '<svg class="icn" style="--fill:#747474" viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg">'
                //     + '<use href="#ico-heart" />'
                // + '</svg>'

                // + '<span>Testing <b>lige 2</b> line 3 line 4</span>'
                // + '<span><sup>$</sup>12,182</span>'
            // + '</div>'
            + '<div class="lbl tcd fnt-sm">'
                + '<span><b>Idle State</b></span>'
                // + '<span>Idle StateIdle State</span>'
            + '</div>'
            
            + '<div class="lbl tcd fnt-sm">'
                + '<span>In Progress | <i>152 / 230 GB</i></span>'
            + '</div>'
        + '</div>';
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '.TextDesign .body{width:100%;display:flex;flex-direction:row;justify-content:space-between;align-items:center}.TextDesign .lbl{display:-webkit-box;white-space:normal;-webkit-box-orient:vertical;text-align:left;-webkit-line-clamp:1}.TextDesign.sz2 .lbl{-webkit-line-clamp:2}.TextDesign.sz3 .lbl{-webkit-line-clamp:3}.TextDesign .body.fnt-md .lbl,.TextDesign .body.fnt-lg .lbl,.TextDesign .body.fnt-xlg .lbl{-webkit-line-clamp:1;font-weight:300}.TextDesign .body .lbl.fnt-md{font-size:18px}.TextDesign .body .lbl.fnt-lg{font-size:24px}.TextDesign .body .lbl.fnt-xlg{font-size:32px}.TextDesign.tm .lbl,.TextDesign.mm .lbl,.TextDesign.rm .lbl{text-align:center}.TextDesign.tr .lbl,.TextDesign.mr .lbl,.TextDesign.rr .lbl{text-align:right}.TextDesign .lbl sup{font-size:.8em;vertical-align:text-top}.TextDesign .lbl sub{font-size:.7em;vertical-align:baseline}';}

    /* COMPRESSED RENDER */
    public String render() {
        return '<div class="body" style=""><div class="lbl tcd fnt-sm"><span><b>Idle State</b></span></div><div class="lbl tcd fnt-sm"><span>In Progress | <i>152 / 230 GB</i></span></div></div>';
    }
}