public with sharing class TextDesign implements MiniChartsDesign {
    private String RENDER_TEMPLATE() {
        return ''
        + '<div class="body fnt-md" style="">'
            + '<div class="lbl tcd">'
                // + '<svg class="icn" style="--fill:#747474" viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg">'
                //     + '<use href="#ico-heart" />'
                // + '</svg>'

                // + '<span>Testing <b>lige 2</b> line 3 line 4</span>'
                + '<span>$12,182,330</span>'
            + '</div>'
        + '</div>';
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '.TextDesign .body{width:100%}.TextDesign .lbl{display:-webkit-box;white-space:normal;-webkit-box-orient:vertical;text-align:left;-webkit-line-clamp:1}.TextDesign.sz2 .lbl{-webkit-line-clamp:2}.TextDesign.sz3 .lbl{-webkit-line-clamp:3}.TextDesign .body.fnt-md .lbl,.TextDesign .body.fnt-lg .lbl,.TextDesign .body.fnt-xlg .lbl{-webkit-line-clamp:1;font-weight:300}.TextDesign .body.fnt-md .lbl{font-size:24px}.TextDesign .body.fnt-lg .lbl{font-size:32px}.TextDesign .body.fnt-xlg .lbl{font-size:40px}.TextDesign.tm .lbl,.TextDesign.mm .lbl,.TextDesign.rm .lbl{text-align:center}.TextDesign.tr .lbl,.TextDesign.mr .lbl,.TextDesign.rr .lbl{text-align:right}.TextDesign svg.icn{vertical-align:text-top;margin-right:2px;--icn-sz: 14px;width:var(--icn-sz);max-width:var(--icn-sz);max-height:var(--icn-sz);fill:var(--fill)}';}

    /* COMPRESSED RENDER */
    public String render() {
        return '<div class="body fnt-md" style=""><div class="lbl tcd"><span>$12,182,330</span></div></div>';
    }
}