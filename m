From: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 02/13] ARM: dts: exynos4: Use labels for overriding
 nodesin Exynos4210
Date: Wed, 13 May 2015 18:02:05 +0900
Message-ID: <5553130D.3010909@kernel.org>
References: <1431351773-2031-1-git-send-email-k.kozlowski.k@gmail.com> <1431351773-2031-3-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431351773-2031-3-git-send-email-k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/11/15 22:42, Krzysztof Kozlowski wrote:
> Usage of labels instead of full paths reduces possible mistakes when
> overriding nodes.
> 
Well, I'm not sure what kind of the possible mistakes you mentioned...?

I don't think we need to use the label for gic, combiner.

- Kukjin

> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos4210.dtsi | 43 +++++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index 76b84852f29c..a9a55304e31a 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -52,16 +52,6 @@
>  		};
>  	};
>  
> -	pmu_system_controller: system-controller@10020000 {
> -		clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
> -				"clkout4", "clkout8", "clkout9";
> -		clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
> -			<&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
> -			<&clock CLK_OUT_CPU>, <&clock CLK_XXTI>,
> -			<&clock CLK_XUSBXTI>;
> -		#clock-cells = <1>;
> -	};
> -
>  	sysram: sysram@02020000 {
>  		compatible = "mmio-sram";
>  		reg = <0x02020000 0x20000>;
> @@ -95,18 +85,6 @@
>  		arm,data-latency = <2 2 1>;
>  	};
>  
> -	gic: interrupt-controller@10490000 {
> -		cpu-offset = <0x8000>;
> -	};
> -
> -	combiner: interrupt-controller@10440000 {
> -		samsung,combiner-nr = <16>;
> -		interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
> -			     <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
> -			     <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> -			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
> -	};
> -
>  	mct: mct@10050000 {
>  		compatible = "samsung,exynos4210-mct";
>  		reg = <0x10050000 0x800>;
> @@ -245,3 +223,24 @@
>  		status = "disabled";
>  	};
>  };
> +
> +&gic {
> +	cpu-offset = <0x8000>;
> +};
> +
> +&combiner {
> +	samsung,combiner-nr = <16>;
> +	interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
> +		     <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
> +		     <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> +		     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
> +};
> +
> +&pmu_system_controller {
> +	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
> +			"clkout4", "clkout8", "clkout9";
> +	clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
> +		<&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
> +		<&clock CLK_OUT_CPU>, <&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
> +	#clock-cells = <1>;
> +};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
