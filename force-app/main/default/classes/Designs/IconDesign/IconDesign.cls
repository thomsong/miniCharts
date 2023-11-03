public with sharing class IconDesign implements MiniChartsDesign {
    private String RENDER_TEMPLATE() {
        Integer cmpId = MiniChartsRenderer.getCmpIdx();
        Integer pctFill = (math.random() * 100).intValue();
        Boolean fillVertical = false;
        String iconName = MiniChartsIcons.getIcon('internal', 'star');
        
        String fillColor = '#fcc005';
        String emptyColor = '#ddd';
        
        return ''
        + '<div class="body" style="">'
            + '<div class="ico">'
                + '\n<svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg">'
                    + '<linearGradient id="fl-' + cmpId + '" '
                        + (fillVertical ? 'x1="0%" y1="100%" x2="0%" y2="0%">' : '>')
                        // + '<stop offset="0%" stop-color="#ba0516" />'
                        + '<stop offset="' + pctFill + '%" stop-color="' + fillColor + '" />'
                        + '<stop offset="' + pctFill + '%" stop-color="' + emptyColor + '" />'
                    + '</linearGradient>'
                    + '<use style="fill:url(#fl-' + cmpId + ')" href="#ico-' + iconName + '" />'
                    // + icon
                + '</svg>\n'

            + '</div>'
        + '</div>';
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '.IconDesign{--ico-sz: 40px;--sz: min(20px, var(--ico-sz));max-width:var(--sz)}.IconDesign.sz2{--sz: min(40px, var(--ico-sz))}.IconDesign.sz3{--sz: min(60px, var(--ico-sz))}.IconDesign .body{display:flex;flex-direction:row;align-items:center;gap:3px}.IconDesign .ico{display:flex;justify-content:center;align-items:center}.IconDesign .ico svg{width:var(--sz);max-width:min(var(--sz),100%);max-height:min(var(--sz),100%)}';}

    /* COMPRESSED RENDER */
    public String render() {
        Integer cmpId = MiniChartsRenderer.getCmpIdx();
        Integer pctFill = (math.random() * 100).intValue();
        Boolean fillVertical = false;
        String iconName = MiniChartsIcons.getIcon('internal', 'star');
        String fillColor = '#fcc005';
        String emptyColor = '#ddd';
        return '<div class="body" style=""><div class="ico">\n<svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg"><linearGradient id="fl-' + cmpId + '" '
                        + (fillVertical ? 'x1="0%" y1="100%" x2="0%" y2="0%">' : '>')
+'<stop offset="' + pctFill + '%" stop-color="' + fillColor + '" /><stop offset="' + pctFill + '%" stop-color="' + emptyColor + '" /></linearGradient><use style="fill:url(#fl-' + cmpId + ')" href="#ico-' + iconName + '" /></svg>\n</div></div>';
    }
}