From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: Use lower case hex addresses in
 node unit addresses
Date: Thu, 21 Dec 2017 09:51:21 +0900
Message-ID: <5A3B0589.8010106@samsung.com>
References: <CGME20171220192737epcas4p17c4e71c11e5864fd59f06396c0867a3a@epcas4p1.samsung.com>
        <20171220192702.32515-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20171220192702.32515-1-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Dear Krzysztof,

On 2017년 12월 21일 04:27, Krzysztof Kozlowski wrote:
> Convert all hex addresses in node unit addresses to lower case to
> fix warnings like:
>     arch/arm64/boot/dts/exynos/exynos5433-tm2e.dtb: Warning (simple_bus_reg):
>       Node /soc/video-scaler@13C00000 simple-bus unit address format error, expected "13c00000"
> 
> Conversion was done using sed:
>     $ sed -e 's/@\([a-zA-Z0-9_-]*\) {/@\L\1 {/' -i arch/arm64/boot/dts/exynos/*.dts*
> 
> Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 8 ++++----
>  arch/arm64/boot/dts/exynos/exynos7.dtsi    | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 1962b8074349..0ba5df825eff 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -994,7 +994,7 @@
>  			reg = <0x145f0000 0x1038>;
>  		};
>  
> -		gsc_0: video-scaler@13C00000 {
> +		gsc_0: video-scaler@13c00000 {
>  			compatible = "samsung,exynos5433-gsc";
>  			reg = <0x13c00000 0x1000>;
>  			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1008,7 +1008,7 @@
>  			power-domains = <&pd_gscl>;
>  		};
>  
> -		gsc_1: video-scaler@13C10000 {
> +		gsc_1: video-scaler@13c10000 {
>  			compatible = "samsung,exynos5433-gsc";
>  			reg = <0x13c10000 0x1000>;
>  			interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1022,7 +1022,7 @@
>  			power-domains = <&pd_gscl>;
>  		};
>  
> -		gsc_2: video-scaler@13C20000 {
> +		gsc_2: video-scaler@13c20000 {
>  			compatible = "samsung,exynos5433-gsc";
>  			reg = <0x13c20000 0x1000>;
>  			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1049,7 +1049,7 @@
>  			power-domains = <&pd_mscl>;
>  		};
>  
> -		mfc: codec@152E0000 {
> +		mfc: codec@152e0000 {
>  			compatible = "samsung,exynos5433-mfc";
>  			reg = <0x152E0000 0x10000>;
>  			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> index 9a3fbed1765a..3504837b1d43 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> @@ -103,7 +103,7 @@
>  			#size-cells = <1>;
>  			ranges;
>  
> -			pdma0: pdma@10E10000 {
> +			pdma0: pdma@10e10000 {
>  				compatible = "arm,pl330", "arm,primecell";
>  				reg = <0x10E10000 0x1000>;
>  				interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> @@ -114,7 +114,7 @@
>  				#dma-requests = <32>;
>  			};
>  
> -			pdma1: pdma@10EB0000 {
> +			pdma1: pdma@10eb0000 {
>  				compatible = "arm,pl330", "arm,primecell";
>  				reg = <0x10EB0000 0x1000>;
>  				interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
> 

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
