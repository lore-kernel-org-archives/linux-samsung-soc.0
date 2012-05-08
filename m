From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Add platform resource definitions for
 FIMC-LITE
Date: Tue, 08 May 2012 14:42:07 +0900
Message-ID: <017b01cd2cdd$4e4ff570$eaefe050$%kim@samsung.com>
References: <1336148260-19952-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48961 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750737Ab2EHFmJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 May 2012 01:42:09 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3O00CEYVQ59YP0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 May 2012 14:42:08 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3O00AVSVU8EDZ0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 May 2012 14:42:08 +0900 (KST)
In-reply-to: <1336148260-19952-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

Sylwester Nawrocki wrote:
> 
> Add the gate clocks and register region address definition for
> FIMC-LITE devices available in Exynos4x12 and Exynos5 SoCs.
> 
This is right description? I can't find your changes for EXYNOS4412 and
EXYNOS5 here. Only this is for EXYNOS4212 SoC.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/clock-exynos4212.c |   10 ++++++++++
>  arch/arm/mach-exynos/include/mach/map.h |    3 +++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos4212.c b/arch/arm/mach-
> exynos/clock-exynos4212.c
> index 9882312..da397d2 100644
> --- a/arch/arm/mach-exynos/clock-exynos4212.c
> +++ b/arch/arm/mach-exynos/clock-exynos4212.c
> @@ -92,6 +92,16 @@ static struct clk init_clocks_off[] = {
>  		.devname	= SYSMMU_CLOCK_DEVNAME(isp, 9),
>  		.enable		= exynos4212_clk_ip_isp1_ctrl,
>  		.ctrlbit	= (1 << 4),
> +	}, {
> +		.name		= "flite",
> +		.devname	= "exynos-fimc-lite.0",
> +		.enable		= exynos4212_clk_ip_isp0_ctrl,
> +		.ctrlbit	= (1 << 4),
> +	}, {
> +		.name		= "flite",
> +		.devname	= "exynos-fimc-lite.1",
> +		.enable		= exynos4212_clk_ip_isp0_ctrl,
> +		.ctrlbit	= (1 << 3),
>  	}
>  };
> 
> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-
> exynos/include/mach/map.h
> index 0e2292d..d30643b 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -34,6 +34,9 @@
> 
>  #define EXYNOS4_PA_JPEG			0x11840000
> 
> +/* x = 0...1 */
> +#define EXYNOS4_PA_FIMC_LITE(x)		(0x12390000 + ((x) *
0x10000))
> +
>  #define EXYNOS4_PA_G2D			0x12800000
> 
>  #define EXYNOS4_PA_I2S0			0x03830000
> --
> 1.7.10
