From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 3/3] ARM: S5PC210: Set the common L2 cache configurations
Date: Tue, 05 Oct 2010 17:47:30 +0900
Message-ID: <001f01cb6469$f65aa370$e30fea50$%kim@samsung.com>
References: <20100930074959.GA11798@july>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64264 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755383Ab0JEIrS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 04:47:18 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9T0039672SCC20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Oct 2010 17:47:16 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9T00ICI72S5D@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Oct 2010 17:47:16 +0900 (KST)
In-reply-to: <20100930074959.GA11798@july>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

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

It would be helpful that could use more detailed function name like
s5pv310_l2x0_cache_init().

> +{
> +#ifdef CONFIG_CACHE_L2X0
> +	void __iomem *p = S5P_VA_L2CC;
> +
> +	/* TAG,  Data latency control */
> +	writel(0x110, p + L2X0_TAG_LATENCY_CTRL);
> +	writel(0x110, p + L2X0_DATA_LATENCY_CTRL);

I still thinking, __raw_writel is more suitable here...
Because no need to add barriers between each write here.

> +
> +	/* L2 cache prefetch control */
> +	writel(0x30000007, p + L2X0_PREFETCH_CTRL);
> +
> +	l2x0_init(p, 0x3C070001, 0xC200FFFF);

0x7C070001 is better...or should be?...because it is for early write
response.
I think need it for optimization...so please change it.

And it'd better if you could add PL310(L2 cache controller) power control
here.
It can help to reduce power consumption.

> +#endif
> +	return 0;
> +}
> +early_initcall(s5pv310_init_cache);
> +

And in my opinion, following format is better even if do not consider the
coding-style.
Because if not defined CACHE_L2X0, no need to add empty function into
early_initcall().

#ifdef CONFIG_CACHE_L2X0
static int __init s5pv310_l2x0_cache_init(void)
{

/* */

	return 0;
}
early_initcall(s5p_l2x0_cache_init);
#endif


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
