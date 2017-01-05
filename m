From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/3] ARM64: dts: exynos5433: add DECON_TV node
Date: Thu, 5 Jan 2017 13:11:10 -0300
Message-ID: <4c426e7c-151b-7bdd-995f-33f3fb697e96@osg.samsung.com>
References: <CGME20170105152604eucas1p25340c974fa7f375905c958e2bff6d96f@eucas1p2.samsung.com>
 <1483629943-31183-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:43342
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750751AbdAEQLT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Jan 2017 11:11:19 -0500
In-Reply-To: <1483629943-31183-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org

Hello Andrzej,

It seems the subject line "arm64" is more common than the capitalized "ARM64".

On 01/05/2017 12:25 PM, Andrzej Hajda wrote:
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

You can use the GIC_SPI macro for the interrupt type instead. Also, I think
IRQ_TYPE_NONE (0) isn't a valid flag for GIC interrupts. AFAIU the platform
supports both IRQ_TYPE_EDGE_RISING and IRQ_TYPE_LEVEL_HIGH, and the latter
is what's used consistently in the other Exynos DTS.

Besides this comment, patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
