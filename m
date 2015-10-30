From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 1/4] Documentation: dt-bindings: Describe SROMc
 configuration
Date: Fri, 30 Oct 2015 15:30:06 +0900
Message-ID: <56330E6E.50003@samsung.com>
References: <cover.1446122247.git.p.fedin@samsung.com>
 <f1fbd1a7877090f4318705f0fccbf4d96c0ebc9c.1446122247.git.p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <f1fbd1a7877090f4318705f0fccbf4d96c0ebc9c.1446122247.git.p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 29.10.2015 21:42, Pavel Fedin wrote:
> Add documentation for new subnode properties, allowing bank configuration.
> Based on u-boot implementation, but heavily reworked.

Please, carefully look at:
Documentation/devicetree/bindings/net/gpmc-eth.txt
Documentation/devicetree/bindings/bus/ti-gpmc.txt

1. Try to re-use existing bindings. Although I see existing bank-width
and gpmc,device-width but yours samsung,srom-data-width seems better.
Maybe there are other to re-use?

2. The array of "PMC, Tacp, Tcah, Tcoh, Tacc, Tcos, Tacs" is poorly
extendable and not very descriptive/readable. You mapped directly device
register which is the easier way for the driver but that is not the
purpose of binding.

3. Please provide ranges for valid values and units.

4. PMC is not a timing.

I doubt that TI GPMC could be used in Exynos SROM but please look at it
and get useful stuff from it.

Best regards,
Krzysztof

> 
> Signed-off-by: Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../bindings/arm/samsung/exynos-srom.txt           | 50 +++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
> index 33886d5..02ecc7f 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
> @@ -5,8 +5,54 @@ Required properties:
>  
>  - reg: offset and length of the register set
>  
> -Example:
> +- #address-cells, #size-cells : should be '1' if the device has sub-nodes
> +				with 'reg' property.
> +- ranges: allows valid 1:1 translation between child's address space and
> +	  parent's address space
> +
> +Sub-nodes:
> +The SROM controller can be used to attach external peripherials. In this case
> +device nodes should be added as subnodes to the SROMc node. These subnodes,
> +except regular device specification, should contain the following properties,
> +describing configuration of the relevant SROM bank:
> +
> +Required properties:
> +- samsung,srom-bank : bank number (0 - 3)
> +
> +- samsung,srom-timing : array of 7 integers: PMC, Tacp, Tcah, Tcoh, Tacc, Tcos,
> +			Tacs
> +
> +Optional properties:
> +- samsung,srom-data-width : data width in bytes (1 or 2). If omitted, default
> +			    of 1 is used.
> +
> +Example: basic definition, no banks are configured
>  	sromc@12570000 {
>  		compatible = "samsung,exynos-srom";
> -		reg = <0x12570000 0x10>;
> +		reg = <0x12570000 0x14>;
> +	};
> +
> +Example: SROMc with smsc 911x ethernet chip on bank 3
> +	sromc@12570000 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		compatible = "samsung,exynos-srom";
> +		reg = <0x12570000 0x14>;
> +
> +		ethernet@07000000 {
> +			compatible = "smsc,lan9115";
> +			reg = <0x07000000 0x10000>;
> +			phy-mode = "mii";
> +			interrupt-parent = <&gpx0>;
> +			interrupts = <5 8>;
> +			reg-io-width = <2>;
> +			smsc,irq-push-pull;
> +			smsc,force-internal-phy;
> +
> +			samsung,srom-bank = <3>;
> +			samsung,srom-data-width = <2>;
> +			samsung,srom-timing = <1 9 12 1 9 1 1>;
> +		};
>  	};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
