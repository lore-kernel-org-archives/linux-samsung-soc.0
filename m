From: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: RE: [PATCH V9 13/14] ARM: dts: snow: represent the connection between
 bridge and panel using videoport and endpoints
Date: Fri, 23 Jan 2015 16:01:41 +0900
Message-ID: <0c9401d036da$71046bf0$530d43d0$@kernel.org>
References: <1421771935-31618-1-git-send-email-ajaykumar.rs@samsung.com>
 <1421771935-31618-14-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1421771935-31618-14-git-send-email-ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Ajay Kumar' <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, bhushan.r-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Ajay Kumar wrote:
> 
> Define videoports and use endpoints to describe the connection between
> the encoder, bridge and the panel, instead of using phandles.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Tested-by: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Tested-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> Tested-by: Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> Tested-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts |   30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index b9aeec4..1bd5d3a 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -183,7 +183,20 @@
>  			powerdown-gpios = <&gpy2 5 GPIO_ACTIVE_HIGH>;
>  			reset-gpios = <&gpx1 5 GPIO_ACTIVE_HIGH>;
>  			edid-emulation = <5>;
> -			panel = <&panel>;
> +
> +			ports {
> +				port@0 {
> +					bridge_out: endpoint {
> +						remote-endpoint = <&panel_in>;
> +					};
> +				};
> +
> +				port@1 {
> +					bridge_in: endpoint {
> +						remote-endpoint = <&dp_out>;
> +					};
> +				};
> +			};
>  		};
>  	};
> 
> @@ -228,6 +241,12 @@
>  		compatible = "auo,b116xw03";
>  		power-supply = <&fet6>;
>  		backlight = <&backlight>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&bridge_out>;
> +			};
> +		};
>  	};
>  };
> 
> @@ -242,7 +261,14 @@
>  	samsung,link-rate = <0x0a>;
>  	samsung,lane-count = <2>;
>  	samsung,hpd-gpio = <&gpx0 7 GPIO_ACTIVE_HIGH>;
> -	bridge = <&ptn3460>;
> +
> +	ports {
> +		port@0 {
> +			dp_out: endpoint {
> +				remote-endpoint = <&bridge_in>;
> +			};
> +		};
> +	};
>  };
> 
>  &ehci {
> --
> 1.7.9.5

I'm fine on the DT changes in this series, shall I take 13/14 and 14/14 in
Samsung tree?

- Kukjin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
