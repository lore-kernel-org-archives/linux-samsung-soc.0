From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Set appropriate I2C device variant
Date: Wed, 06 Jul 2011 16:12:54 +0900
Message-ID: <00ce01cc3bac$22844810$678cd830$%kim@samsung.com>
References: <1309357573-13632-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47308 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753058Ab1GFHNA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2011 03:13:00 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNW00JP2HDE4B00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Jul 2011 16:12:59 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNW009DRHDNCK@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Jul 2011 16:12:59 +0900 (KST)
In-reply-to: <1309357573-13632-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, 'Kyungmin Park' <kyungmin.park@samsung.com>

Sylwester Nawrocki wrote:
> 
> Set up a correct I2C bus controller variant name for Exynos4.
> Without this change the I2C bus driver fails to acquire its
> clocks.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> 
> This change is required to enable the I2C bus controller driver
> operation on exynos4 with the clkdev patches applied.
> 
> Regards,
> Sylwester
> ---
>  arch/arm/mach-exynos4/cpu.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
> index 1196f39..67918c0 100644
> --- a/arch/arm/mach-exynos4/cpu.c
> +++ b/arch/arm/mach-exynos4/cpu.c
> @@ -23,6 +23,7 @@
>  #include <plat/sdhci.h>
>  #include <plat/devs.h>
>  #include <plat/fimc-core.h>
> +#include <plat/iic-core.h>
> 
>  #include <mach/regs-irq.h>
> 
> @@ -137,6 +138,11 @@ void __init exynos4_map_io(void)
>  	s3c_fimc_setname(1, "exynos4-fimc");
>  	s3c_fimc_setname(2, "exynos4-fimc");
>  	s3c_fimc_setname(3, "exynos4-fimc");
> +
> +	/* The I2C bus controllers are directly compatible with s3c2440 */
> +	s3c_i2c0_setname("s3c2440-i2c");
> +	s3c_i2c1_setname("s3c2440-i2c");
> +	s3c_i2c2_setname("s3c2440-i2c");
>  }
> 
>  void __init exynos4_init_clocks(int xtal)
> --
> 1.7.2.5

Right, will apply into -fix tree.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
