From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH v4 2/5] arm: dts: Add the burst and esc clock frequency
 properties to DSI node
Date: Mon, 6 Mar 2017 09:38:51 +0100
Message-ID: <20170306093851.3870ab29@ipc1.ka-ro>
References: <1488775343-6236-1-git-send-email-hoegeun.kwon@samsung.com>
        <CGME20170306044234epcas1p22e9481182e11330cea0d169ce0ad2666@epcas1p2.samsung.com>
        <1488775343-6236-3-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488775343-6236-3-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Mon, 06 Mar 2017 13:42:20 +0900 Hoegeun Kwon wrote:
> The OF graph is not needed because the panel is a child of dsi. Add
>
This is obviously from your patch #5 and doesn't make sense in this
context.

> the burst and esc clock frequency properties to the parent (DSI node).
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos3250-rinato.dts | 2 ++
>  arch/arm/boot/dts/exynos4210-trats.dts  | 2 ++
>  arch/arm/boot/dts/exynos4412-trats2.dts | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
> index 548413e..c9f191c 100644
> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
> @@ -215,6 +215,8 @@
>  &dsi_0 {
>  	vddcore-supply = <&ldo6_reg>;
>  	vddio-supply = <&ldo6_reg>;
> +	samsung,burst-clock-frequency = <250000000>;
> +	samsung,esc-clock-frequency = <20000000>;
>  	samsung,pll-clock-frequency = <24000000>;
>  	status = "okay";
>  
> diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
> index 0ca1b4d..1743ca8 100644
> --- a/arch/arm/boot/dts/exynos4210-trats.dts
> +++ b/arch/arm/boot/dts/exynos4210-trats.dts
> @@ -197,6 +197,8 @@
>  &dsi_0 {
>  	vddcore-supply = <&vusb_reg>;
>  	vddio-supply = <&vmipi_reg>;
> +	samsung,burst-clock-frequency = <500000000>;
> +	samsung,esc-clock-frequency = <20000000>;
>  	samsung,pll-clock-frequency = <24000000>;
>  	status = "okay";
>  
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index 41ecd6d..82221a0 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -385,6 +385,8 @@
>  &dsi_0 {
>  	vddcore-supply = <&ldo8_reg>;
>  	vddio-supply = <&ldo10_reg>;
> +	samsung,burst-clock-frequency = <500000000>;
> +	samsung,esc-clock-frequency = <20000000>;
>  	samsung,pll-clock-frequency = <24000000>;
>  	status = "okay";
>  


Lothar Waßmann
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
