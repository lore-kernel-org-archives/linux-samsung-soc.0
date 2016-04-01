From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 06/11] ARM: dts: exynos: Fix DTC unit name warnings in
 Exynos5250
Date: Fri, 1 Apr 2016 13:21:45 -0400
Message-ID: <56FEAE29.6010405@osg.samsung.com>
References: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
 <1459493874-2366-6-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459493874-2366-6-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

Patch looks good to me, I have just one question below:

On 04/01/2016 02:57 AM, Krzysztof Kozlowski wrote:
> Fix following DTC warnings in all Exynos5250 boards:
> 
> Warning (unit_address_vs_reg): Node /dp-controller@145B0000/display-timings/timing@0 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /usb@12000000 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /usb@12000000/dwc3 has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): Node /hdmi has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): Node /mixer has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): Node /video-phy@10040720 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /fixed-regulator@0 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /fixed-regulator@1 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /fixed-regulator@2 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /i2c@12C70000/trackpad has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): Node /i2c@12CD0000/lvds-bridge@20/ports/port@0 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /i2c@12CD0000/lvds-bridge@20/ports/port@1 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /i2c-arbitrator/i2c@0/embedded-controller has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): Node /i2c-arbitrator/i2c@0/power-regulator has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): Node /i2c@12CA0000/embedded-controller has a reg or ranges property, but no unit name
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---

[snip]

>  
> -	usb@12000000 {
> +	usb_dwc3 {
>  		compatible = "samsung,exynos5250-dwusb3";
>  		clocks = <&clock CLK_USB3>;
>  		clock-names = "usbdrd30";

The ePAPR document says that "The name of a node should be somewhat generic,
reflecting the function of the device and not its precise programming model"

So I wonder if this shouldn't be instead:

usb_dwc3: usb {

Although it seems that not all DT bindings follow this convention so probably
the name in your patch is correct.

Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
