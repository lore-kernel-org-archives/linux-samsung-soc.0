From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: exynos: Add remaining power domains
 to Exynos5433 SoC
Date: Fri, 01 Dec 2017 10:21:09 +0900
Message-ID: <5A20AE85.1040203@samsung.com>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
        <CGME20171129112651eucas1p1a0058dd31edffbe9dbd62ea4c2fb0f6f@eucas1p1.samsung.com>
        <20171129112638.15813-7-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63634 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751491AbdLABVL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 20:21:11 -0500
In-reply-to: <20171129112638.15813-7-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>

Dear Marek,

On 2017년 11월 29일 20:26, Marek Szyprowski wrote:
> This patch adds support for G2D, G3D, CAM0, CAM1, ISP, HVEC power domains
> to Exynos5433 SoCs. Currently only clock controllers for those domains are
> defined. CAM1 is a parent of CAM0 power domain and CAM0 is a parent of ISP
> power domain.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 50 ++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 2c019a0fd8e3..1962b8074349 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -361,6 +361,7 @@
>  			clocks = <&xxti>,
>  				<&cmu_top CLK_ACLK_G2D_266>,
>  				<&cmu_top CLK_ACLK_G2D_400>;
> +			power-domains = <&pd_g2d>;
>  		};
>  
>  		cmu_disp: clock-controller@13b90000 {
> @@ -432,6 +433,7 @@
>  
>  			clock-names = "oscclk", "aclk_g3d_400";
>  			clocks = <&xxti>, <&cmu_top CLK_ACLK_G3D_400>;
> +			power-domains = <&pd_g3d>;
>  		};
>  
>  		cmu_gscl: clock-controller@13cf0000 {
> @@ -497,6 +499,7 @@
>  
>  			clock-names = "oscclk", "aclk_hevc_400";
>  			clocks = <&xxti>, <&cmu_top CLK_ACLK_HEVC_400>;
> +			power-domains = <&pd_hevc>;
>  		};
>  
>  		cmu_isp: clock-controller@146d0000 {
> @@ -510,6 +513,7 @@
>  			clocks = <&xxti>,
>  				<&cmu_top CLK_ACLK_ISP_DIS_400>,
>  				<&cmu_top CLK_ACLK_ISP_400>;
> +			power-domains = <&pd_isp>;
>  		};
>  
>  		cmu_cam0: clock-controller@120d0000 {
> @@ -525,6 +529,7 @@
>  				<&cmu_top CLK_ACLK_CAM0_333>,
>  				<&cmu_top CLK_ACLK_CAM0_400>,
>  				<&cmu_top CLK_ACLK_CAM0_552>;
> +			power-domains = <&pd_cam0>;
>  		};
>  
>  		cmu_cam1: clock-controller@145d0000 {
> @@ -546,6 +551,7 @@
>  				<&cmu_top CLK_ACLK_CAM1_333>,
>  				<&cmu_top CLK_ACLK_CAM1_400>,
>  				<&cmu_top CLK_ACLK_CAM1_552>;
> +			power-domains = <&pd_cam1>;
>  		};
>  
>  		pd_gscl: power-domain@105c4000 {
> @@ -555,6 +561,14 @@
>  			label = "GSCL";
>  		};
>  
> +		pd_cam0: power-domain@105c4020 {
> +			compatible = "samsung,exynos5433-pd";
> +			reg = <0x105c4020 0x20>;
> +			#power-domain-cells = <0>;
> +			power-domains = <&pd_cam1>;
> +			label = "CAM0";
> +		};
> +
>  		pd_mscl: power-domain@105c4040 {
>  			compatible = "samsung,exynos5433-pd";
>  			reg = <0x105c4040 0x20>;
> @@ -562,6 +576,13 @@
>  			label = "MSCL";
>  		};
>  
> +		pd_g3d: power-domain@105c4060 {
> +			compatible = "samsung,exynos5433-pd";
> +			reg = <0x105c4060 0x20>;
> +			#power-domain-cells = <0>;
> +			label = "G3D";
> +		};
> +
>  		pd_disp: power-domain@105c4080 {
>  			compatible = "samsung,exynos5433-pd";
>  			reg = <0x105c4080 0x20>;
> @@ -569,6 +590,13 @@
>  			label = "DISP";
>  		};
>  
> +		pd_cam1: power-domain@105c40a0 {
> +			compatible = "samsung,exynos5433-pd";
> +			reg = <0x105c40a0 0x20>;
> +			#power-domain-cells = <0>;
> +			label = "CAM1";
> +		};
> +
>  		pd_aud: power-domain@105c40c0 {
>  			compatible = "samsung,exynos5433-pd";
>  			reg = <0x105c40c0 0x20>;
> @@ -576,6 +604,21 @@
>  			label = "AUD";
>  		};
>  
> +		pd_g2d: power-domain@105c4120 {
> +			compatible = "samsung,exynos5433-pd";
> +			reg = <0x105c4120 0x20>;
> +			#power-domain-cells = <0>;
> +			label = "G2D";
> +		};
> +
> +		pd_isp: power-domain@105c4140 {
> +			compatible = "samsung,exynos5433-pd";
> +			reg = <0x105c4140 0x20>;
> +			#power-domain-cells = <0>;
> +			power-domains = <&pd_cam0>;
> +			label = "ISP";
> +		};
> +
>  		pd_mfc: power-domain@105c4180 {
>  			compatible = "samsung,exynos5433-pd";
>  			reg = <0x105c4180 0x20>;
> @@ -583,6 +626,13 @@
>  			label = "MFC";
>  		};
>  
> +		pd_hevc: power-domain@105c41c0 {
> +			compatible = "samsung,exynos5433-pd";
> +			reg = <0x105c41c0 0x20>;
> +			#power-domain-cells = <0>;
> +			label = "HEVC";
> +		};
> +
>  		tmu_atlas0: tmu@10060000 {
>  			compatible = "samsung,exynos5433-tmu";
>  			reg = <0x10060000 0x200>;
> 

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
