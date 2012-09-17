From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/7] ARM: samsung: Remove unused fields from FIMC and CSIS
 platform data
Date: Mon, 17 Sep 2012 20:02:38 +0900
Message-ID: <050d01cd94c3$f39c4210$dad4c630$%kim@samsung.com>
References: <1347878888-30001-1-git-send-email-s.nawrocki@samsung.com>
 <1347879100-30150-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43419 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755725Ab2IQLCl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Sep 2012 07:02:41 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAH00FGTQNWVIR0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Sep 2012 20:02:39 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAH004BXQOFKG40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Sep 2012 20:02:39 +0900 (KST)
In-reply-to: <1347879100-30150-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Sylwester Nawrocki wrote:
> 
> The MIPI-CSI2 bus data alignment is now being derived from the media
> bus pixel code, the drivers don't use the corresponding structure
> fields, so remove them. Also remove the s5p_csis_phy_enable callback
> which is now used directly by s5p-csis driver.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
> ---
>  arch/arm/mach-exynos/mach-nuri.c           | 3 ---
>  arch/arm/mach-exynos/mach-universal_c210.c | 3 ---
>  2 files changed, 6 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-
> nuri.c
> index 667aefc..da6e7ce 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -1180,9 +1180,7 @@ static struct platform_device cam_8m_12v_fixed_rdev
> = {
>  static struct s5p_platform_mipi_csis mipi_csis_platdata = {
>  	.clk_rate	= 166000000UL,
>  	.lanes		= 2,
> -	.alignment	= 32,
>  	.hs_settle	= 12,
> -	.phy_enable	= s5p_csis_phy_enable,
>  };
> 
>  #define GPIO_CAM_MEGA_RST	EXYNOS4_GPY3(7) /* ISP_RESET */
> @@ -1226,7 +1224,6 @@ static struct s5p_fimc_isp_info
nuri_camera_sensors[]
> = {
>  		.bus_type	= FIMC_MIPI_CSI2,
>  		.board_info	= &m5mols_board_info,
>  		.clk_frequency	= 24000000UL,
> -		.csi_data_align	= 32,
>  	},
>  };
> 
> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-
> exynos/mach-universal_c210.c
> index 3056fa7..0b0a2d0 100644
> --- a/arch/arm/mach-exynos/mach-universal_c210.c
> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> @@ -944,9 +944,7 @@ static struct platform_device cam_s_if_fixed_reg_dev =
> {
>  static struct s5p_platform_mipi_csis mipi_csis_platdata = {
>  	.clk_rate	= 166000000UL,
>  	.lanes		= 2,
> -	.alignment	= 32,
>  	.hs_settle	= 12,
> -	.phy_enable	= s5p_csis_phy_enable,
>  };
> 
>  #define GPIO_CAM_LEVEL_EN(n)	EXYNOS4210_GPE4(n + 3)
> @@ -1011,7 +1009,6 @@ static struct s5p_fimc_isp_info
> universal_camera_sensors[] = {
>  		.board_info	= &m5mols_board_info,
>  		.i2c_bus_num	= 0,
>  		.clk_frequency	= 24000000UL,
> -		.csi_data_align	= 32,
>  	},
>  #endif
>  };
> --
> 1.7.11.3
