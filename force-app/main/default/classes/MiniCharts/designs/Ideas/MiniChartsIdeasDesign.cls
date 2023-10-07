public class MiniChartsIdeasDesign extends MiniChartsDesign {
    public MiniChartsIdeasDesign() {
        this.COMPILED_CSS_STYLE = '@keyframes animate-icon-flash-frames{0%{opacity:1}25%{opacity:1}40%,60%{opacity:.1}75%{opacity:1}100%{opacity:1}}@keyframes animate-icon-pulse-frames{0%{transform:scale(0.8)}50%{transform:scale(1)}100%{transform:scale(0.8)}}g.animate-icon-flash{animation:animate-icon-flash-frames linear 2.5s infinite}g.animate-icon-flash-fast{animation:animate-icon-flash-frames linear 1.5s infinite}g.animate-icon-pulse{transform-origin:8px 8px;animation:animate-icon-pulse-frames ease-in-out 1.5s infinite}';
    }

    public override virtual String render(Map<String, Object> params, Integer[] chartSize) {
        this.params = params;
        this.chartSize = chartSize;

        this.body += '<g transform="translate(0 0)">\n';  
        // this.body += renderProgressBar();
        this.body += renderIcons();
        
        this.body += '</g>\n';

        // this.addLabels();
       
        
        return super.render(params, chartSize);
    }

    private String renderProgressBar() {
        String svgOutput = '';


        // svgOutput += '<text style="fill: var(--text-black); font-size:13px; dominant-baseline: middle;" x="42" y="11">Customer</text>';
        // svgOutput += '<text style="fill: var(--icon-green); font-size:13px; dominant-baseline: middle;" x="21" y="11">Customer</text>';
        // svgOutput += '<text style="fill: var(--icon-gray); font-size:13px; dominant-baseline: middle;" x="21" y="11">Customer</text>';
        
        svgOutput += '<rect x="0" y="0" width="50" height="10"  />';
        

        return svgOutput;
    }

    private String renderIcons() {
        String svgOutput = '';

        Decimal randomNumber = Math.random() * 10;

        // Cell Highlighting
        // svgOutput += '<rect style="fill:var(--highlight-green);" x="0" y="0" width="' + chartSize[0] + '" height="' + chartSize[1] + '"/>';
        
        svgOutput += '<style>';
        svgOutput += '.slds-icon-trend {';
        svgOutput += 'transform-origin: 8px 8px;';
        svgOutput += 'color: var(--text-gray);';
        svgOutput += '}';
        svgOutput += '.slds-icon-trend.up{';
        svgOutput += 'color: var(--text-green);';
        svgOutput += 'transform: rotate(-45deg);';
        svgOutput += '}';
        svgOutput += '.slds-icon-trend.down{';
        svgOutput += 'color: var(--text-red);';
        svgOutput += 'transform: rotate(45deg);';
        svgOutput += '}';
        svgOutput += '.slds-icon-trend__arrow {';
        svgOutput += '  stroke-dashoffset: 0.1px;';
        svgOutput += '  stroke-dasharray: 39.175px;';
        svgOutput += ' stroke: currentColor;';
        svgOutput += ' fill: none;';
        svgOutput += ' stroke-linecap: round;';
        svgOutput += ' stroke-linejoin: round;';
        svgOutput += ' stroke-width: 1.125px;';

        svgOutput += '}';
        svgOutput += '.slds-icon-trend__circle { ';
        svgOutput += 'stroke-dasharray: 42.3385px,46.3385px; ';
        svgOutput += ' stroke: currentColor;';
        svgOutput += 'fill: none;';
        svgOutput += ' stroke-linecap: round;';
        svgOutput += ' stroke-linejoin: round;';
        svgOutput += ' stroke-width: 1.125px;';
        svgOutput += '}';
        svgOutput += '';
        svgOutput += '</style>\n';
        
        // Icon Re-use Idea
        // https://developer.mozilla.org/en-US/docs/Web/SVG/Element/symbol
        String iconId;
        Integer iconIndex = 0;
        
        iconId = 'icon-' + iconIndex++;
        svgOutput += '<g style="fill:var(--icon-disabled); transform:translate(0px,2px)">\n';
            svgOutput += '<clipPath id="clip-' + iconId + '">\n';
                svgOutput += '<rect x="0" y="4" width="16" height="16" />\n';
            svgOutput += '</clipPath>\n';

            // svgOutput += '<rect style="fill:green" x="0" y="0" width="16" height="16" />\n';

            svgOutput += '<g id="' + iconId + '" >\n';
                svgOutput += MiniChartsUtilityIcons.getIcon('shift_pattern') + '\n';
            svgOutput += '</g>\n';

            svgOutput += '<use style="fill:var(--text-blue);" clip-path="url(#clip-' + iconId + ')" href="#' + iconId + '" />';
        svgOutput += '</g>\n';

        
        svgOutput += '<g style="fill:var(--text-red); transform:translate(20px,2px)">\n';
        svgOutput += '<g class="animate-icon-flash">\n';
            svgOutput += MiniChartsUtilityIcons.getIcon('shift_pattern') + '\n';
        svgOutput += '</g>\n';
        svgOutput += '</g>\n';

        // svgOutput += '<g style="transform:translate(0,2px)"><g class="slds-icon-trend down"><path class="slds-icon-trend__arrow" d="M.75 8H11M8 4.5L11.5 8 8 11.5"></path><circle class="slds-icon-trend__circle" cy="8" cx="8" r="7.375" transform="rotate(-28 8 8) scale(-1 1) translate(-16 0)"></circle></g></g>';
        // svgOutput += '<g style="transform:translate(21px,2px)"><g class="slds-icon-trend up"><path class="slds-icon-trend__arrow" d="M.75 8H11M8 4.5L11.5 8 8 11.5"></path><circle class="slds-icon-trend__circle" cy="8" cx="8" r="7.375" transform="rotate(-28 8 8) scale(-1 1) translate(-16 0)"></circle></g></g>';
        // svgOutput += '<g style="transform:translate(40px,2px)"><g class="slds-icon-trend up"><path class="slds-icon-trend__arrow" d="M.75 8H11M8 4.5L11.5 8 8 11.5"></path><circle class="slds-icon-trend__circle" cy="8" cx="8" r="7.375" transform="rotate(-28 8 8) scale(-1 1) translate(-16 0)"></circle></g></g>';
        // svgOutput += '<g style="transform:translate(60px,2px)"><g class="slds-icon-trend down"><path class="slds-icon-trend__arrow" d="M.75 8H11M8 4.5L11.5 8 8 11.5"></path><circle class="slds-icon-trend__circle" cy="8" cx="8" r="7.375" transform="rotate(-28 8 8) scale(-1 1) translate(-16 0)"></circle></g></g>';


        svgOutput += '<text style="fill: var(--text-black); font-size:13px; dominant-baseline: middle;" x="42" y="11">' + Limits.getCpuTime() + '</text>';
        // svgOutput += '<text style="fill: var(--icon-green); font-size:13px; dominant-baseline: middle;" x="21" y="11">Customer</text>';
        // svgOutput += '<text style="fill: var(--icon-gray); font-size:13px; dominant-baseline: middle;" x="21" y="11">Customer</text>';
        

        

        return svgOutput;
    }


}