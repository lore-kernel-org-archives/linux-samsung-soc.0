From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: exynos: remove the cd-gpios property for eMMC
 of odroid-xu3/4
Date: Mon, 21 Nov 2016 19:06:05 +0200
Message-ID: <20161121170605.GA8181@kozik-lap>
References: <20161121071032.10183-1-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161121071032.10183-1-jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Nov 21, 2016 at 04:10:32PM +0900, Jaehoon Chung wrote:
> Odroid-xu3/4 didn't need to use the cd-gpios for detecting card.
> Because Host controller has the CDETECT register through SDx_CDN line.
> Host controller can know whether card is inserted or not with this
> register.
> 
> When i have checked the Odroid-xu3/4, they are using CDETECT register.
> (Not using exteranl cd-gpio.)

Makes sense. Just one question: the sd0_cd pinctrl setting should stay,
right?

Best regards,
Krzysztof

> Fixes: fb1aeedb61ad ("ARM: dts: add mmc detect gpio for exynos5422-odroidxu3")
> Signed-off-by: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index 9e63328..05b9afdd 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -510,7 +510,6 @@
>  &mmc_0 {
>  	status = "okay";
>  	mmc-pwrseq = <&emmc_pwrseq>;
> -	cd-gpios = <&gpc0 2 GPIO_ACTIVE_LOW>;
>  	card-detect-delay = <200>;
>  	samsung,dw-mshc-ciu-div = <3>;
>  	samsung,dw-mshc-sdr-timing = <0 4>;
> -- 
> 2.10.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
