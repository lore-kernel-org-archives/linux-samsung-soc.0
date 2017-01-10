From: hoegeun kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: exynos5433: add DECON_TV node
Date: Tue, 10 Jan 2017 11:31:34 +0900
Message-ID: <963e1acb-8676-c71e-35f3-85845f4da66f@samsung.com>
References: <CGME20170109104054eucas1p258d1df5ecff1d8b8c9aa882d8c86d5df@eucas1p2.samsung.com>
 <1483958437-6572-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59759 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161988AbdAJCbg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 21:31:36 -0500
In-reply-to: <1483958437-6572-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Hi Andrzej,


Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>


Hoegeun



On 01/09/2017 07:40 PM, Andrzej Hajda wrote:
> DECON_TV is 2nd display controller on Exynos5433, used in HDMI path
> or 2nd DSI path.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>
> Hi Krzysztof,
>
> These patches are based on latest patches separating tm2 and tm2e and
> touchscreen patches. I hope this is good base.
> Thanks all for quick response/review.
>
> Regards
> Andrzej
>
> v2:
>    - replaced magic numbers with macros,
>    - removed power domains,
>    - removed 0x prefixes from node names
> ---
>   arch/arm64/boot/dts/exynos/exynos5433.dtsi | 43 ++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 68f764e..5552f77 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -814,6 +814,29 @@
>   			};
>   		};
>   
> +		decon_tv: decon@13880000 {
> +			compatible = "samsung,exynos5433-decon-tv";
> +			reg = <0x13880000 0x20b8>;
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
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +			iommus = <&sysmmu_tv0x>, <&sysmmu_tv1x>;
> +			iommu-names = "m0", "m1";
> +		};
> +
>   		syscon_disp: syscon@13b80000 {
>   			compatible = "syscon";
>   			reg = <0x13b80000 0x1010>;
> @@ -912,6 +935,26 @@
>   			#iommu-cells = <0>;
>   		};
>   
> +		sysmmu_tv0x: sysmmu@13a20000 {
> +			compatible = "samsung,exynos-sysmmu";
> +			reg = <0x13a20000 0x1000>;
> +			interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-names = "pclk", "aclk";
> +			clocks = <&cmu_disp CLK_PCLK_SMMU_TV0X>,
> +				<&cmu_disp CLK_ACLK_SMMU_TV0X>;
> +			#iommu-cells = <0>;
> +		};
> +
> +		sysmmu_tv1x: sysmmu@13a30000 {
> +			compatible = "samsung,exynos-sysmmu";
> +			reg = <0x13a30000 0x1000>;
> +			interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-names = "pclk", "aclk";
> +			clocks = <&cmu_disp CLK_PCLK_SMMU_TV1X>,
> +				<&cmu_disp CLK_ACLK_SMMU_TV1X>;
> +			#iommu-cells = <0>;
> +		};
> +
>   		sysmmu_gscl0: sysmmu@0x13C80000 {
>   			compatible = "samsung,exynos-sysmmu";
>   			reg = <0x13C80000 0x1000>;
