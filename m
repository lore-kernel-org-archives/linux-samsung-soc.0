From: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: RE: [PATCH] ARM: dts: exynos4412-trats2: Add max77693 charger node
Date: Tue, 03 Feb 2015 12:28:54 +0900
Message-ID: <05c901d03f61$89861db0$9c925910$@kernel.org>
References: <1422023395-8407-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1422023395-8407-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Krzysztof Kozlowski' <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Kukjin Kim' <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: 'Kyungmin Park' <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Marek Szyprowski' <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Krzysztof Kozlowski wrote:
> 
> Add to Trats2 DTS new node for configuring the max77693 charger driver.
> Only the maxim,constant-microvolt differs from default value but set all
> of the optional properties anyway.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index 29231b452643..496a05faca37 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -549,6 +549,16 @@
>  				haptic-supply = <&ldo26_reg>;
>  				pwms = <&pwm 0 38022 0>;
>  			};
> +
> +			charger {
> +				compatible = "maxim,max77693-charger";
> +
> +				maxim,constant-microvolt = <4350000>;
> +				maxim,min-system-microvolt = <3600000>;
> +				maxim,thermal-regulation-celsius = <100>;
> +				maxim,battery-overcurrent-microamp = <3500000>;
> +				maxim,charge-input-threshold-microvolt = <4300000>;
> +			};
>  		};
>  	};
> 
> --

OK, applied.

Thanks,
Kukjin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
