From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] ARM: S5PC210: Set the common L2 cache configurations
Date: Tue, 14 Sep 2010 18:48:14 +0900
Message-ID: <017301cb53f1$f57f3750$e07da5f0$%kim@samsung.com>
References: <20100911053115.GA23209@july>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:32977 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752174Ab0INJsB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Sep 2010 05:48:01 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8Q0091RDVZPOA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Sep 2010 18:47:59 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8Q000SQDVZ9E@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Sep 2010 18:47:59 +0900 (KST)
In-reply-to: <20100911053115.GA23209@july>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org
Cc: linux@arm.linux.org.uk, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
> 
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> S5PC210 has PL310 1MiB L2 cache.
> It uses the optimized data & tag latency and also enable the prefetch.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv310/cpu.c |   19 +++++++++++++++++++
>  1 files changed, 19 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu.c
> index e5b261a..b50312e 100644
> --- a/arch/arm/mach-s5pv310/cpu.c
> +++ b/arch/arm/mach-s5pv310/cpu.c
> @@ -15,6 +15,7 @@
>  #include <asm/mach/irq.h>
> 
>  #include <asm/proc-fns.h>
> +#include <asm/hardware/cache-l2x0.h>
> 
>  #include <plat/cpu.h>
>  #include <plat/clock.h>
> @@ -121,6 +122,24 @@ static int __init s5pv310_core_init(void)
> 
>  core_initcall(s5pv310_core_init);
> 
> +static int __init s5pv310_init_cache(void)
> +{
> +#ifdef CONFIG_CACHE_L2X0
> +	void __iomem *p = S5P_VA_L2CC;
> +
> +	/* TAG,  Data latency control */
> +	writel(0x110, p + L2X0_TAG_LATENCY_CTRL);

Please use '__raw_writel' instead of 'writel' here...

> +	writel(0x110, p + L2X0_DATA_LATENCY_CTRL);
> +
> +	/* L2 cache prefetch control */
> +	writel(0x6, p + L2X0_PREFETCH_CTRL);

As I know, there is more suitable value which has been tested.
It means should be changed...but now it is under testing.

> +
> +	l2x0_init(p, 0x3C070001, 0xC200FFFF);
> +#endif
> +	return 0;
> +}
> +early_initcall(s5pv310_init_cache);
> +
>  int __init s5pv310_init(void)
>  {
>  	printk(KERN_INFO "S5PV310: Initializing architecture\n");
> --

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
