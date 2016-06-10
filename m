From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v4 1/7] Documentation: extcon: usb-gpio: update usb-gpio
 binding description
Date: Fri, 10 Jun 2016 09:00:00 -0500
Message-ID: <20160610140000.GA26791@rob-hp-laptop>
References: <1465393686-16644-1-git-send-email-k.kozlowski@samsung.com>
 <1465393686-16644-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465393686-16644-2-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jun 08, 2016 at 03:48:00PM +0200, Krzysztof Kozlowski wrote:
> From: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> Add information about VBUS pin detection support, 'debounce' property
> and some other details.

The extcon bindings are a complete mess if you've seen my recent 
comments. I'm inclined to NAK anything that amends broken bindings. This 
one is headed in the right direction though...


> Signed-off-by: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/extcon/extcon-usb-gpio.txt | 28 ++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> index af0b903de293..7096f399b771 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> @@ -1,16 +1,40 @@
>  USB GPIO Extcon device
>  
> -This is a virtual device used to generate USB cable states from the USB ID pin
> -connected to a GPIO pin.
> +This is a virtual device used to generate USB cable states from the USB
> +ID and VBUS signals connected to GPIO pins.

It is not a virtual device, but a connector and connector states.

> +
> +The extcon cable states USB and USB_HOST are actually VBUS and !ID
> +pin states and do not indicate what mode the USB needs to operate in.
> +That decision is done by the USB stack.
> +
> +Some devices have only one of these GPIO pins, so we support cases when
> +only one of them is present. Hence properties 'id-gpio' and 'vbus-gpio'
> +are described as optional, but at least one of them has to be present
> +in extcon-usb-gpio node.
> +
> +In general we have three cases:
> +1. If VBUS and ID gpios are present we pass them as is
> +	USB-HOST = !ID, USB = VBUS
> +2. If only VBUS gpio is present we assume that ID pin is always High.
> +	USB-HOST = false, USB = VBUS.
> +3. If only ID pin is available we infer the VBUS pin states based on ID.
> +	USB-HOST = !ID, USB = ID

USB and USB-HOST look like driver details. Shouldn't this just be in 
terms of host and device?

>  
>  Required properties:
>  - compatible: Should be "linux,extcon-usb-gpio"

I'd prefer to see this deprecated in favor of a string that defines the 
type of connector (usb-a-connector, usb-microab-connector, etc.)

> +
> +Optional properties
>  - id-gpio: gpio for USB ID pin. See gpio binding.
> +- vbus-gpio: gpio for USB VBUS pin. See gpio binding.

vbus-gpios

> +- debounce: gpio debounce time in milliseconds (u32).

debounce of which gpio? Needs a unit suffix.

> +
>  
>  Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed below:
>  	extcon_usb1 {
>  		compatible = "linux,extcon-usb-gpio";
>  		id-gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
> +		vbus-gpio = <&gpio6 2 GPIO_ACTIVE_HIGH>;
> +		debounce = <25>;
>  	}
>  
>  	&omap_dwc3_1 {
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
