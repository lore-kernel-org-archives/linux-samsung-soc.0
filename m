From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 3/8] ARM: dts: exynos: Fix watchdog reset on Exynos4412
Date: Sun, 12 Mar 2017 13:48:31 -0700
Message-ID: <050544d8-5513-16b3-3d8f-117aa173226f@roeck-us.net>
References: <20170311172527.16368-1-krzk@kernel.org>
 <20170311172527.16368-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170311172527.16368-4-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 03/11/2017 09:25 AM, Krzysztof Kozlowski wrote:
> The Exynos4412 has the same watchdog as newer SoCs (e.g. Exynos5250).
> Just like the others, for working it requires additional steps in Power
> Management Unit: unmasking the reset request and enabling the system
> reset.  Without these additional steps in PMU, the watchdog will not be
> able to reset the system on expiration event.
>
> Change the compatible of Exynos4412 watchdog device node to
> samsung,exynos5250-wdt which includes the additional PMU steps.
>
> This will also fix infinite watchdog interrupt in soft mode (lack of
> interrupt clear) because it is also included in samsung,exynos5250-wdt.
>
> Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Acked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

I assume this patch will be pushed through some arm tree.

Thanks,
Guenter

> ---
>  arch/arm/boot/dts/exynos4.dtsi    |  9 ---------
>  arch/arm/boot/dts/exynos4210.dtsi |  9 +++++++++
>  arch/arm/boot/dts/exynos4412.dtsi | 10 ++++++++++
>  3 files changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 18def1c774d5..71e2cdae6068 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -283,15 +283,6 @@
>  		};
>  	};
>
> -	watchdog: watchdog@10060000 {
> -		compatible = "samsung,s3c2410-wdt";
> -		reg = <0x10060000 0x100>;
> -		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&clock CLK_WDT>;
> -		clock-names = "watchdog";
> -		status = "disabled";
> -	};
> -
>  	rtc: rtc@10070000 {
>  		compatible = "samsung,s3c6410-rtc";
>  		reg = <0x10070000 0x100>;
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index f9408188f97f..8bff2253acca 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -119,6 +119,15 @@
>  		};
>  	};
>
> +	watchdog: watchdog@10060000 {
> +		compatible = "samsung,s3c2410-wdt";
> +		reg = <0x10060000 0x100>;
> +		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&clock CLK_WDT>;
> +		clock-names = "watchdog";
> +		status = "disabled";
> +	};
> +
>  	clock: clock-controller@10030000 {
>  		compatible = "samsung,exynos4210-clock";
>  		reg = <0x10030000 0x20000>;
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index 235bbb69ad7c..6f47988a1ab5 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -215,6 +215,16 @@
>  		};
>  	};
>
> +	watchdog: watchdog@10060000 {
> +		compatible = "samsung,exynos5250-wdt";
> +		reg = <0x10060000 0x100>;
> +		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&clock CLK_WDT>;
> +		clock-names = "watchdog";
> +		samsung,syscon-phandle = <&pmu_system_controller>;
> +		status = "disabled";
> +	};
> +
>  	adc: adc@126C0000 {
>  		compatible = "samsung,exynos-adc-v1";
>  		reg = <0x126C0000 0x100>;
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
