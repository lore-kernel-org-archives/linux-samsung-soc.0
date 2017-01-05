From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] ARM64: dts: exynos5433: add DECON_TV node
Date: Thu, 5 Jan 2017 19:26:31 +0200
Message-ID: <20170105172631.ymu5tlywe44ewb5b@kozik-lap>
References: <CGME20170105152604eucas1p25340c974fa7f375905c958e2bff6d96f@eucas1p2.samsung.com>
 <1483629943-31183-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35268 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936821AbdAER0h (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Jan 2017 12:26:37 -0500
Content-Disposition: inline
In-Reply-To: <1483629943-31183-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org

On Thu, Jan 05, 2017 at 04:25:41PM +0100, Andrzej Hajda wrote:
> DECON_TV is 2nd display controller on Exynos5433, used in HDMI path
> or 2nd DSI path.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 44 ++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 8cbfd1d..b47951b 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -821,6 +821,28 @@
>  			};
>  		};
>  
> +		decon_tv: decon@13880000 {
> +			compatible = "samsung,exynos5433-decon-tv";
> +			reg = <0x13880000 0x20B8>;
> +			clocks = <&cmu_disp CLK_PCLK_DECON_TV>,
> +				 <&cmu_disp CLK_ACLK_DECON_TV>,
> +				 <&cmu_disp CLK_ACLK_SMMU_TV0X>,
> +				 <&cmu_disp CLK_ACLK_XIU_TV0X>,
> +				 <&cmu_disp CLK_PCLK_SMMU_TV0X>,
> +				 <&cmu_disp CLK_SCLK_DECON_TV_VCLK>,
> +				 <&cmu_disp CLK_SCLK_DECON_TV_ECLK>;
> +			clock-names = "pclk", "aclk_decon", "aclk_smmu_decon0x",
> +				      "aclk_xiu_decon0x", "pclk_smmu_decon0x",
> +				      "sclk_decon_vclk", "sclk_decon_eclk";
> +			samsung,disp-sysreg = <&syscon_disp>;
> +			interrupt-names = "fifo", "vsync", "lcd_sys";
> +			interrupts = <0 210 0>, <0 211 0>, <0 212 0>;
> +			power-domains = <&pd_disp>;
> +			status = "disabled";
> +			iommus = <&sysmmu_tv0x>, <&sysmmu_tv1x>;
> +			iommu-names = "m0", "m1";
> +		};
> +
>  		syscon_disp: syscon@13b80000 {
>  			compatible = "syscon";
>  			reg = <0x13b80000 0x1010>;
> @@ -926,6 +948,28 @@
>  			power-domains = <&pd_disp>;
>  		};
>  
> +		sysmmu_tv0x: sysmmu@0x13a20000 {

Without the '0x' in the address, please. I see that you copied it from
existing nodes, so maybe you could fix them as well in following patch.

Beside that (and Javier's comments) looks okay, but please choose
suitable subject prefix matching recent commits. I think it is the third
time I am mentioning this recently (to different Samsung folks,
though)... 

Best regards,
Krzysztof
