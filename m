From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/3] ARM64: dts: exynos5433: add DECON_TV node
Date: Fri, 06 Jan 2017 12:41:31 +0900
Message-ID: <586F11EB.4060309@samsung.com>
References: <CGME20170105152604eucas1p25340c974fa7f375905c958e2bff6d96f@eucas1p2.samsung.com>
 <1483629943-31183-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48195 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965546AbdAFDlf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Jan 2017 22:41:35 -0500
In-reply-to: <1483629943-31183-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org

Hi Andrej,

When I applied these patch on next-branch(20170105) for test,
these patch have the conflict.

On 2017년 01월 06일 00:25, Andrzej Hajda wrote:
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

As I knew, the maintainer prefer to use the small letter
on offset instead of capital letter.
- 0x20B8 -> 0x20b8

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

Use the interrupt definitions with GIC_SPI.
Also, decon of Exynos5433 uses the IRQ_TYPE_LEVEL_HIGH
intead of IRQ_TYPE_NONE(0). I think you need to check it.

> +			power-domains = <&pd_disp>;

The exynos5433.dtsi has not yet supported the power domains.
Exynos5433.dtsi does not include the all of power domains.


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

ditto.

>  		};
>  
> +		sysmmu_tv0x: sysmmu@0x13a20000 {
> +			compatible = "samsung,exynos-sysmmu";
> +			reg = <0x13a20000 0x1000>;
> +			interrupts = <0 214 0>;

Use the interrupt definitions with GIC_SPI.
Also, other sysmmu of Exynos5433 uses the IRQ_TYPE_LEVEL_HIGH
intead of IRQ_TYPE_NONE(0). I think you need to check it.


> +			clock-names = "pclk", "aclk";
> +			clocks = <&cmu_disp CLK_PCLK_SMMU_TV0X>,
> +				<&cmu_disp CLK_ACLK_SMMU_TV0X>;
> +			#iommu-cells = <0>;
> +			power-domains = <&pd_disp>;

ditto.

> +		};
> +
> +		sysmmu_tv1x: sysmmu@0x13a30000 {
> +			compatible = "samsung,exynos-sysmmu";
> +			reg = <0x13a30000 0x1000>;
> +			interrupts = <0 216 0>;

ditto. Use the interrupt definitions.

> +			clock-names = "pclk", "aclk";
> +			clocks = <&cmu_disp CLK_PCLK_SMMU_TV1X>,
> +				<&cmu_disp CLK_ACLK_SMMU_TV1X>;
> +			#iommu-cells = <0>;
> +			power-domains = <&pd_disp>;

ditto.

> +		};
> +
>  		sysmmu_gscl0: sysmmu@0x13C80000 {

ditto.
- 0x13C80000 -> 0x13c80000

>  			compatible = "samsung,exynos-sysmmu";
>  			reg = <0x13C80000 0x1000>;

ditto.
- 0x13C80000 -> 0x13c80000

> 

-- 
Best Regards,
Chanwoo Choi
S/W Center, Samsung Electronics
