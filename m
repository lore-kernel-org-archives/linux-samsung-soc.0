From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/6] ARM: dts: exynos: Add clean name of compatible.
Date: Fri, 8 Sep 2017 12:33:29 +0100
Message-ID: <1a2dfeb9-b2e1-3bc6-772a-e3b55fc51b7f@arm.com>
References: <1504850560-27950-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170908060308epcas1p2b275c76f63f5742092a7bc4ef14c05a5@epcas1p2.samsung.com>
 <1504850560-27950-3-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504850560-27950-3-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/09/17 07:02, Hoegeun Kwon wrote:
> Exynos 5250 and 5420 have different hardware rotation limits. However,
> currently it uses only one compatible - "exynos5-gsc". Since we have
> to distinguish between these two, we add different compatible.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 8 ++++----
>  arch/arm/boot/dts/exynos5420.dtsi | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 8dbeb87..bf08101 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -637,7 +637,7 @@
>  		};
>  
>  		gsc_0:  gsc@13e00000 {
> -			compatible = "samsung,exynos5-gsc";
> +			compatible = "samsung,exynos5-gsc", "samsung,exynos5250-gsc";

These should be the other way round - the most specific compatible
should come first, then the more general fallback afterwards.

(and similarly in all cases below)

Robin.

>  			reg = <0x13e00000 0x1000>;
>  			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains = <&pd_gsc>;
> @@ -647,7 +647,7 @@
>  		};
>  
>  		gsc_1:  gsc@13e10000 {
> -			compatible = "samsung,exynos5-gsc";
> +			compatible = "samsung,exynos5-gsc", "samsung,exynos5250-gsc";
>  			reg = <0x13e10000 0x1000>;
>  			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains = <&pd_gsc>;
> @@ -657,7 +657,7 @@
>  		};
>  
>  		gsc_2:  gsc@13e20000 {
> -			compatible = "samsung,exynos5-gsc";
> +			compatible = "samsung,exynos5-gsc", "samsung,exynos5250-gsc";
>  			reg = <0x13e20000 0x1000>;
>  			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains = <&pd_gsc>;
> @@ -667,7 +667,7 @@
>  		};
>  
>  		gsc_3:  gsc@13e30000 {
> -			compatible = "samsung,exynos5-gsc";
> +			compatible = "samsung,exynos5-gsc", "samsung,exynos5250-gsc";
>  			reg = <0x13e30000 0x1000>;
>  			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains = <&pd_gsc>;
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 02d2f89..86afe77 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -658,7 +658,7 @@
>  		};
>  
>  		gsc_0: video-scaler@13e00000 {
> -			compatible = "samsung,exynos5-gsc";
> +			compatible = "samsung,exynos5-gsc", "samsung,exynos5420-gsc";
>  			reg = <0x13e00000 0x1000>;
>  			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clock CLK_GSCL0>;
> @@ -668,7 +668,7 @@
>  		};
>  
>  		gsc_1: video-scaler@13e10000 {
> -			compatible = "samsung,exynos5-gsc";
> +			compatible = "samsung,exynos5-gsc", "samsung,exynos5420-gsc";
>  			reg = <0x13e10000 0x1000>;
>  			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clock CLK_GSCL1>;
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
