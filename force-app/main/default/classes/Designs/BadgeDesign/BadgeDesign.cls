public with sharing class BadgeDesign implements MiniChartsDesign {
    public static Map<String,String> styles = new Map<String,String>{
        // 'name' => => 'icon,text,bg,outline'

        'default'           => '--sc1:#fff;--sc2:#5C5C5C',
        'default_outline'   => '--sc0:#181818;--sc3:#5C5C5C',

        'success'           => '--sc1:#fff;--sc2:#2E844A',
        'success_outline'   => '--sc0:#2E844A;--sc1:#181818;--sc3:#2E844A',

        'warning'           => '--sc1:#181818;--sc2:#DD7A01',
        'warning_outline'   => '--sc0:#DD7A01;--sc1:#181818;--sc3:#DD7A01',

        'error'             => '--sc1:#fff;--sc2:#BA0517',
        'error_outline'     => '--sc0:#BA0517;--sc1:#181818;--sc3:#BA0517',
        
        'info'              => '--sc0:#747474;--sc1:#181818;--sc2:#C9C9C9',
        'info_outline'      => '--sc0:#747474;--sc1:#181818;--sc3:#C9C9C9'
    };

    
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> p) {
        Map<String, Object> defaultProps = new Map<String, Object>();
        defaultProps.put('stl', 'error'); //  default_outline
        defaultProps.put('rad', 1); // 0 = No Radius, 1 = Small, 2 = Full
        defaultProps.put('txt', 'Null'); // Should never happen
        
        ///////////////////////////////////////////////////////
        Map<String, Object> props =  MiniChartsHelper.getProps(p, defaultProps);        
        
        String style = (String)props.get('stl');
        Integer radiusSize = (Integer)props.get('rad');
        String badgeText = (String)props.get('txt');
        Boolean hasIcon = false;
        
        ///////////////////////////////////////////////////////
        String styleCSSVars = '';

        if (style.startsWith('--')) {
            styleCSSVars = style;
        } else {
            styleCSSVars = BadgeDesign.styles.get(style);
            hasIcon = true;

            if (styleCSSVars == null) {
                styleCSSVars = BadgeDesign.styles.get('default_outline');
                hasIcon = false;
            } else if (style.startsWith('default')) {
                hasIcon = false;
            }
        }
        
        ///////////////////////////////////////////////////////
        String badgeIconHTML = '';
        if (hasIcon) {
            badgeIconHTML = '<i style="--_i:var(' + MiniChartsIcons.getIcon('utility', style.split('_')[0]) + ')"/>';
        }
        
        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        String output = '';
        output += '<b class="fxr aic rd'+radiusSize+'" style="' + styleCSSVars + '">';
            output += badgeIconHTML;
            output += '<l>' + badgeText + '</l>';
        output += '</b>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '--sc1:black;--sc2:transparent;--d-label-radius:0;& b{--sc0:var(--sc1);--sc3:var(--sc2);height:20px;padding:0 5px;&.rd1{--d-label-radius:3px}&.rd2{--d-label-radius:10px}background-color:var(--sc2);border-radius:var(--d-label-radius);border:1.5px solid var(--sc3);& l{color:var(--sc1)}& i{--c:var(--sc0);--wh:13px;flex-shrink:0;margin-right:4px}}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> p) {
        Map<String, Object> defaultProps = new Map<String, Object>();
        defaultProps.put('stl', 'error'); //  default_outline
        defaultProps.put('rad', 1); // 0 = No Radius, 1 = Small, 2 = Full
        defaultProps.put('txt', 'Null'); // Should never happen
        Map<String, Object> props =  MiniChartsHelper.getProps(p, defaultProps);
        String style = (String)props.get('stl');
        Integer radiusSize = (Integer)props.get('rad');
        String badgeText = (String)props.get('txt');
        Boolean hasIcon = false;
        String styleCSSVars = '';
        if (style.startsWith('--')) {
            styleCSSVars = style;
        } else {
            styleCSSVars = BadgeDesign.styles.get(style);
            hasIcon = true;
            if (styleCSSVars == null) {
                styleCSSVars = BadgeDesign.styles.get('default_outline');
                hasIcon = false;
            } else if (style.startsWith('default')) {
                hasIcon = false;
            }
        }
        String badgeIconHTML = '';
        if (hasIcon) {
            badgeIconHTML = '<i style="--_i:var('+MiniChartsIcons.getIcon('utility', style.split('_')[0])+')"/>';
        }
        String output = '';
        output += '<b class="fxr aic rd'+radiusSize+'" style="'+styleCSSVars+'">';
            output += badgeIconHTML;
            output += '<l>'+badgeText+'</l>';
        output += '</b>';
        return output;
    }
}