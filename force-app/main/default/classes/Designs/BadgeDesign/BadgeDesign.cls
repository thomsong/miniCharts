public with sharing class BadgeDesign implements MiniChartsDesign {
    public static Map<String,String> styles = new Map<String,String>{
        // 'name' => => 'icon,text,bg,outline'

        'default' => '_,#fff,#5C5C5C,_',
        'default_outline' => '#181818,#181818,_,#5C5C5C',

        'success' => '_,#fff,#2E844A,_',
        'success_outline' => '#2E844A,#181818,_,#2E844A',

        'warning' => '_,#181818,#DD7A01,_',
        'warning_outline' => '#DD7A01,#181818,_,#DD7A01',

        'error' => '_,#fff,#BA0517,_',
        'error_outline' => '#BA0517,#181818,_,#BA0517',
        
        'info' => '#747474,#181818,#C9C9C9,_',
        'info_outline' => '#747474,#181818,_,#C9C9C9'
    };

    
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> p) {
        Map<String, Object> defaultProps = new Map<String, Object>();
        defaultProps.put('stl', 'default_outline'); //  Style See: BadgeDesign.styles
        defaultProps.put('rad', 1); // 0 = No Radius, 1 = Small, 2 = Full
        defaultProps.put('txt', 'Null'); // Should never happen
        
        ///////////////////////////////////////////////////////
        Map<String, Object> props =  MiniChartsHelper.getProps(p, defaultProps);        
        
        String style = (String)props.get('stl');
        Integer radiusSize = (Integer)props.get('rad');
        String badgeText = (String)props.get('txt');
        Boolean hasIcon = false;
        
        ///////////////////////////////////////////////////////
        List<String> styleColors;

        if (style.contains(',')) {
            styleColors = style.split(',');
        } else {
            String styleTheme = BadgeDesign.styles.get(style);
            hasIcon = true;

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
        String badgeIconHTML = '';
        if (hasIcon) {
            badgeIconHTML = ''
                + '<div class="ico fx jcc aic">'
                    + '<svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg">'
                        + '<use style="fill:var(--sc0)" href="#' + MiniChartsIcons.getIcon('utility', style.split('_')[0]) + '" />'
                    + '</svg>'
                + '</div>';
        }

        ///////////////////////////////////////////////////////
        String bodyStyle = ''
            + '--sc1:'+styleColors[1]
            + (styleColors[0] == '_' ? '' : ';--sc0:'+styleColors[0])
            + (styleColors[2] == '_' ? '' : ';--sc2:'+styleColors[2])
            + (styleColors[3] == '_' ? '' : ';--sc3:'+styleColors[3]);
            
        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        String output = '';
        output += '<div class="b fxr aic rd'+radiusSize+'" style="' + bodyStyle + '">';
            output += badgeIconHTML;
            output += '<div class="lbl tal tcd">' + badgeText + '</div>';
        output += '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '--sc1:black;--sc2:transparent;--rad:0;.b{--sc0:var(--sc1);--sc3:var(--sc2);height:20px;padding:0 5px;&.rd1{--rad:3px}&.rd2{--rad:10px}background-color:var(--sc2);border-radius:var(--rad);border:1.5px solid var(--sc3);> .lbl{color:var(--sc1)}.ico{margin-right:4px;& svg{height:13px}}}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> p) {
        Map<String, Object> defaultProps = new Map<String, Object>();
        defaultProps.put('stl', 'default_outline'); //  Style See: BadgeDesign.styles
        defaultProps.put('rad', 1); // 0 = No Radius, 1 = Small, 2 = Full
        defaultProps.put('txt', 'Null'); // Should never happen
        Map<String, Object> props =  MiniChartsHelper.getProps(p, defaultProps);
        String style = (String)props.get('stl');
        Integer radiusSize = (Integer)props.get('rad');
        String badgeText = (String)props.get('txt');
        Boolean hasIcon = false;
        List<String> styleColors;
        if (style.contains(',')) {
            styleColors = style.split(',');
        } else {
            String styleTheme = BadgeDesign.styles.get(style);
            hasIcon = true;
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
            badgeIconHTML = '<div class="ico fx jcc aic"><svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg"><use style="fill:var(--sc0)" href="#'+MiniChartsIcons.getIcon('utility', style.split('_')[0])+'" /></svg></div>';
        }
        String bodyStyle = '--sc1:'+styleColors[1] + (styleColors[0] == '_' ? '' : ';--sc0:'+styleColors[0]) + (styleColors[2] == '_' ? '' : ';--sc2:'+styleColors[2]) + (styleColors[3] == '_' ? '' : ';--sc3:'+styleColors[3]);
        String output = '';
        output += '<div class="b fxr aic rd'+radiusSize+'" style="'+bodyStyle+'">';
            output += badgeIconHTML;
            output += '<div class="lbl tal tcd">'+badgeText+'</div>';
        output += '</div>';
        return output;
    }
}