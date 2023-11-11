public with sharing class BadgeDesign implements MiniChartsDesign {
    public static Map<String,String> styles = new Map<String,String>{
        // 'name' => => 'icon,text,bg,outline'

        'default' => 'white,white,#5C5C5C,#5C5C5C',
        'default_outline' => '#181818,#181818,white,#5C5C5C',

        'success' => 'white,white,#2E844A,#2E844A',
        'success_outline' => '#2E844A,#181818,white,#2E844A',

        'warning' => '#181818,#181818,#DD7A01,#DD7A01',
        'warning_outline' => '#DD7A01,#181818,white,#DD7A01',

        'error' => 'white,white,#BA0517,#BA0517',
        'error_outline' => '#BA0517,#181818,white,#BA0517',
        
        'info' => '#747474,#181818,#C9C9C9,#C9C9C9',
        'info_outline' => '#747474,#181818,white,#C9C9C9'
    };

    
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> p) {
        Map<String, Object> defaultProps = new Map<String, Object>();
        defaultProps.put('stl', 'default_outline'); //  Style See: BadgeDesign.styles
        defaultProps.put('rad', 1); // 0 = No Radius, 1 = Small, 2 = Full
        defaultProps.put('txt', 'ERR:1*'); // Should never happen
        
        ///////////////////////////////////////////////////////
        Map<String, Object> props =  MiniChartsHelper.getProps(p, defaultProps);        
        
        String style = (String)props.get('stl');
        Integer radiusSize = (Integer)props.get('rad');
        String badgeText = (String)props.get('txt'); //'Amt: ' + MiniChartsHelper.generateLabelText('$' + String.valueOf(amt));
        Boolean hasIcon = false;
        ///////////////////////////////////////////////////////
        List<String> styleColors;

        if (style.contains(',')) {
            styleColors = style.split(',');
        } else {
            String styleTheme = BadgeDesign.styles.get(style);
            
            if (styleTheme == null) {
                style = 'default_outline';
                styleTheme = BadgeDesign.styles.get(style);
                hasIcon = false;
            } else if (style.startsWith('default')) {
                hasIcon = false;
            }

            styleColors = styleTheme.split(',');
        }
        
        ///////////////////////////////////////////////////////
        // 'utility', 'success'|'warning'|'info'|'error'
        String badgeIconHTML = '';

        if (hasIcon) {
            String iconName = MiniChartsIcons.getIcon('utility', style);
            badgeIconHTML = ''
                + '<div class="ico">'
                    + '<svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg">'
                        + '<use style="fill:var(--sc0)" href="#ico-' + iconName + '" />'
                    + '</svg>'
                + '</div>';
        }


        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        String output = '';
        output += '<div class="body fxr aic rd'+radiusSize+'" style="--sc0:'+styleColors[0]+';--sc1:'+styleColors[1]+';--sc2:'+styleColors[2]+';--sc3:'+styleColors[3]+';">';
            output += badgeIconHTML;
            output += '<div class="lbl tal tcd">' + badgeText + '</div>';
        output += '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '.BadgeDesign{--sc0: black;--sc1: black;--sc2: white;--sc3: black;--rad: 0}.BadgeDesign .body{height:20px;padding:0 5px;background-color:var(--sc2);border-radius:var(--rad);border:1.5px solid var(--sc3)}.BadgeDesign .body.rd1{--rad: 3px}.BadgeDesign .body.rd2{--rad: 10px}.BadgeDesign .body>.lbl{color:var(--sc1)}.BadgeDesign .body .ico{display:flex;justify-content:center;align-items:center;margin-right:4px}.BadgeDesign .body .ico svg{height:13px}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> p) {
        Map<String, Object> defaultProps = new Map<String, Object>();
        defaultProps.put('stl', 'default_outline'); //  Style See: BadgeDesign.styles
        defaultProps.put('rad', 1); // 0 = No Radius, 1 = Small, 2 = Full
        defaultProps.put('txt', 'ERR:1*'); // Should never happen
        Map<String, Object> props =  MiniChartsHelper.getProps(p, defaultProps);
        String style = (String)props.get('stl');
        Integer radiusSize = (Integer)props.get('rad');
        String badgeText = (String)props.get('txt'); //'Amt: '+MiniChartsHelper.generateLabelText('$'+String.valueOf(amt));
        Boolean hasIcon = false;
        List<String> styleColors;
        if (style.contains(',')) {
            styleColors = style.split(',');
        } else {
            String styleTheme = BadgeDesign.styles.get(style);
            if (styleTheme == null) {
                style = 'default_outline';
                styleTheme = BadgeDesign.styles.get(style);
                hasIcon = false;
            } else if (style.startsWith('default')) {
                hasIcon = false;
            }
            styleColors = styleTheme.split(',');
        }
        String badgeIconHTML = '';
        if (hasIcon) {
            String iconName = MiniChartsIcons.getIcon('utility', style);
            badgeIconHTML = '<div class="ico"><svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg"><use style="fill:var(--sc0)" href="#ico-'+iconName+'" /></svg></div>';
        }
        String output = '';
        output += '<div class="body fxr aic rd'+radiusSize+'" style="--sc0:'+styleColors[0]+';--sc1:'+styleColors[1]+';--sc2:'+styleColors[2]+';--sc3:'+styleColors[3]+';">';
            output += badgeIconHTML;
            output += '<div class="lbl tal tcd">'+badgeText+'</div>';
        output += '</div>';
        return output;
    }
}