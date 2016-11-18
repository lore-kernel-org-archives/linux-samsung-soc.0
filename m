From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] clk/samsung: exynos5433: mark some clocks as critical
Date: Fri, 18 Nov 2016 18:41:04 +0900
Message-ID: <582ECCB0.4050904@samsung.com>
References: <CGME20161118091556epcas4p4d36c8530ab8fec90be72341ed13dbe65@epcas4p4.samsung.com>
 <1479460453-23620-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37564 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751713AbcKRJlH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 04:41:07 -0500
In-reply-to: <1479460453-23620-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>

Hi Marek,

Looks good to me and I tested it on TM2.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com
Tested-by: Chanwoo Choi <cw00.choi@samsung.com

Best Regards,
Chanwoo Choi

On 2016년 11월 18일 18:14, Marek Szyprowski wrote:
> Some parent clocks of the Exynos5433 CMUs must be always enabled to access
> any register in the given CMU or devices connected to it. For the time
> being, until a proper solution based on runtime PM is applied, mark those
> clocks as critical (instead of ignore unused) to prevent disabling them.
> 
> Reported-by: Jaehoon Chung <jh80.chung@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index a8bb60b1f804..f096bd7df40c 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -543,7 +543,7 @@
>  static const struct samsung_gate_clock top_gate_clks[] __initconst = {
>  	/* ENABLE_ACLK_TOP */
>  	GATE(CLK_ACLK_G3D_400, "aclk_g3d_400", "div_aclk_g3d_400",
> -			ENABLE_ACLK_TOP, 30, 0, 0),
> +			ENABLE_ACLK_TOP, 30, CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK_IMEM_SSX_266, "aclk_imem_ssx_266",
>  			"div_aclk_imem_sssx_266", ENABLE_ACLK_TOP,
>  			29, CLK_IGNORE_UNUSED, 0),
> @@ -555,25 +555,25 @@
>  			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
>  	GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_266",
>  			ENABLE_ACLK_TOP, 24,
> -			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
> +			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
>  	GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_200",
>  			ENABLE_ACLK_TOP, 23,
>  			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
>  	GATE(CLK_ACLK_PERIC_66, "aclk_peric_66", "div_aclk_peric_66_b",
>  			ENABLE_ACLK_TOP, 22,
> -			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK_PERIS_66, "aclk_peris_66", "div_aclk_peris_66_b",
>  			ENABLE_ACLK_TOP, 21,
> -			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK_MSCL_400, "aclk_mscl_400", "div_aclk_mscl_400",
>  			ENABLE_ACLK_TOP, 19,
> -			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK_FSYS_200, "aclk_fsys_200", "div_aclk_fsys_200",
>  			ENABLE_ACLK_TOP, 18,
> -			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK_GSCL_111, "aclk_gscl_111", "div_aclk_gscl_111",
>  			ENABLE_ACLK_TOP, 15,
> -			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK_GSCL_333, "aclk_gscl_333", "div_aclk_gscl_333",
>  			ENABLE_ACLK_TOP, 14,
>  			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> @@ -582,7 +582,7 @@
>  			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
>  	GATE(CLK_ACLK_CAM1_400, "aclk_cam1_400", "div_aclk_cam1_400",
>  			ENABLE_ACLK_TOP, 12,
> -			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK_CAM1_552, "aclk_cam1_552", "div_aclk_cam1_552",
>  			ENABLE_ACLK_TOP, 11,
>  			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> @@ -591,7 +591,7 @@
>  			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
>  	GATE(CLK_ACLK_CAM0_400, "aclk_cam0_400", "div_aclk_cam0_400",
>  			ENABLE_ACLK_TOP, 9,
> -			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK_CAM0_552, "aclk_cam0_552", "div_aclk_cam0_552",
>  			ENABLE_ACLK_TOP, 8,
>  			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> @@ -600,19 +600,19 @@
>  			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
>  	GATE(CLK_ACLK_ISP_400, "aclk_isp_400", "div_aclk_isp_400",
>  			ENABLE_ACLK_TOP, 6,
> -			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK_HEVC_400, "aclk_hevc_400", "div_aclk_hevc_400",
>  			ENABLE_ACLK_TOP, 5,
> -			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK_MFC_400, "aclk_mfc_400", "div_aclk_mfc_400",
>  			ENABLE_ACLK_TOP, 3,
> -			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK_G2D_266, "aclk_g2d_266", "div_aclk_g2d_266",
>  			ENABLE_ACLK_TOP, 2,
>  			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
>  	GATE(CLK_ACLK_G2D_400, "aclk_g2d_400", "div_aclk_g2d_400",
>  			ENABLE_ACLK_TOP, 0,
> -			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
> +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, 0),
>  
>  	/* ENABLE_SCLK_TOP_MSCL */
>  	GATE(CLK_SCLK_JPEG_MSCL, "sclk_jpeg_mscl", "div_sclk_jpeg",
> @@ -1385,7 +1385,7 @@ static void __init exynos5433_cmu_cpif_init(struct device_node *np)
>  			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
>  	GATE(CLK_ACLK_DISP_333, "aclk_disp_333", "div_aclk_disp_333",
>  			ENABLE_ACLK_MIF3, 1,
> -			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
> +			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
>  	GATE(CLK_ACLK_CPIF_200, "aclk_cpif_200", "div_aclk_cpif_200",
>  			ENABLE_ACLK_MIF3, 0,
>  			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
> 
