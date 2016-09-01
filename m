From: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Fix mismatched value for SD4 pull
 up/down configuration on exynos4210
Date: Thu, 01 Sep 2016 13:17:35 +0200
Message-ID: <2498577.5hS2QaaMmd@amdc1976>
References: <1472719022-27226-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1472719022-27226-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Thursday, September 01, 2016 10:37:01 AM Krzysztof Kozlowski wrote:
> The pinctrl pull up/down register on exynos4210 is 2-bit wide for each
> pin and it accepts only values of 0, 1 and 3.  The pins sd4-bus-width8
> were configured with value of 4.  The driver does not validate the value
> so this overflow effectively set a bit 1 in adjacent pins thus
> configuring them to pull down.
> 
> The author's intention was probably to set drive strength of 4x.  All
> other bus-widths pins are configured with pull up and drive strength of
> 4x.  Fix this one with same pattern.
> 
> Fixes: 87711d8c7c70 ("ARM: dts: Add pinctrl node entries for SAMSUNG EXYNOS4210 SoC")
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

sd4_bus8 is currently unused by other drivers so there should be no
problem with this change.

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> ---
>  arch/arm/boot/dts/exynos4210-pinctrl.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
> index 8046340e50ac..d9b6d25e4abe 100644
> --- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
> @@ -649,7 +649,7 @@
>  		sd4_bus8: sd4-bus-width8 {
>  			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
>  			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> -			samsung,pin-pud = <4>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
>  			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
>  		};

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
