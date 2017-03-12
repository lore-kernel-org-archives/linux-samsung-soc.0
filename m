From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 5/8] ARM: dts: exynos: Enable watchdog on all Exynos4
 boards
Date: Sun, 12 Mar 2017 13:50:15 -0700
Message-ID: <3934457a-7bd7-d380-aacd-d901d8bec361@roeck-us.net>
References: <20170311172527.16368-1-krzk@kernel.org>
 <20170311172527.16368-6-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170311172527.16368-6-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 03/11/2017 09:25 AM, Krzysztof Kozlowski wrote:
> Watchdog module does not have external dependencies so it can be safely
> enabled in exynos4.dtsi thus making it available for all Exynos4-based
> boards.
>
> Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Acked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>  arch/arm/boot/dts/exynos4210-origen.dts         | 4 ----
>  arch/arm/boot/dts/exynos4210.dtsi               | 1 -
>  arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 4 ----
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 4 ----
>  arch/arm/boot/dts/exynos4412-origen.dts         | 4 ----
>  arch/arm/boot/dts/exynos4412.dtsi               | 1 -
>  6 files changed, 18 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
> index a2c6a13fe67b..312650e2450f 100644
> --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -328,7 +328,3 @@
>  &tmu {
>  	status = "okay";
>  };
> -
> -&watchdog {
> -	status = "okay";
> -};
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index 8bff2253acca..9d51d4d62d94 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -125,7 +125,6 @@
>  		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&clock CLK_WDT>;
>  		clock-names = "watchdog";
> -		status = "disabled";
>  	};
>
>  	clock: clock-controller@10030000 {
> diff --git a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
> index a36cd36a26b8..4cd62487bb16 100644
> --- a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
> @@ -495,7 +495,3 @@
>  	vtmu-supply = <&ldo16_reg>;
>  	status = "okay";
>  };
> -
> -&watchdog {
> -	status = "okay";
> -};
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index 78f118cb73d4..0f1ff792fe44 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -555,7 +555,3 @@
>  	vtmu-supply = <&ldo10_reg>;
>  	status = "okay";
>  };
> -
> -&watchdog {
> -	status = "okay";
> -};
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
> index a1ab6f94bb64..7a83e2df18a6 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -541,7 +541,3 @@
>  &serial_3 {
>  	status = "okay";
>  };
> -
> -&watchdog {
> -	status = "okay";
> -};
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index 6f47988a1ab5..cc69466f17c0 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -222,7 +222,6 @@
>  		clocks = <&clock CLK_WDT>;
>  		clock-names = "watchdog";
>  		samsung,syscon-phandle = <&pmu_system_controller>;
> -		status = "disabled";
>  	};
>
>  	adc: adc@126C0000 {
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
