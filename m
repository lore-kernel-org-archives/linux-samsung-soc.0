From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/4] ARM: EXYNOS4: Support for generic Clock manipulation
 PM callbacks
Date: Sun, 02 Oct 2011 16:08:02 +0900
Message-ID: <001801cc80d2$065939a0$130bace0$%kim@samsung.com>
References: <4E4360B5.3050203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63206 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751652Ab1JBHID convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Oct 2011 03:08:03 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSF00DR2FTENE30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 02 Oct 2011 16:08:02 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSF007GEFTELM50@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sun, 02 Oct 2011 16:08:02 +0900 (KST)
In-reply-to: <4E4360B5.3050203@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-pm@lists.linux-foundation.org, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Chanwoo Choi wrote:
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos4/Makefile     |    2 +-
>  arch/arm/mach-exynos4/pm-runtime.c |   56 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/pm-runtime.c
> 
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
> index 97c31ce..28cdb8b 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -5,7 +5,7 @@
>  #
>  # Licensed under GPLv2
> 
> -obj-y				:=
> +obj-y				:= pm-runtime.o

To move under depending CONFIG_ARCH_EXYNOS4 like others is better.

>  obj-m				:=
>  obj-n				:=
>  obj-				:=
> diff --git a/arch/arm/mach-exynos4/pm-runtime.c b/arch/arm/mach-exynos4/pm-runtime.c
> new file mode 100644
> index 0000000..4fe9f73
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/pm-runtime.c
> @@ -0,0 +1,56 @@
> +/* linux/arch/arm/mach-exynos4/pm-runtime.c
> +
> + * Exynos4210 Power management support
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/io.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/bitmap.h>
> +#include <linux/slab.h>
> +
> +#ifdef CONFIG_PM_RUNTIME
> +
> +static int default_platform_runtime_idle(struct device *dev)
> +{
> +	return pm_runtime_suspend(dev);
> +}
> +
> +static struct dev_pm_domain default_pm_domain = {
> +	.ops = {
> +		.runtime_suspend = pm_clk_suspend,
> +		.runtime_resume = pm_clk_resume,
> +		.runtime_idle = default_platform_runtime_idle,
> +		USE_PLATFORM_PM_SLEEP_OPS
> +	},
> +};
> +
> +#define DEFAULT_PM_DOMAIN_PTR	(&default_pm_domain)
> +
> +#else
> +
> +#define DEFAULT_PM_DOMAIN_PTR	NULL
> +
> +#endif /* CONFIG_PM_RUNTIME */
> +
> +static struct pm_clk_notifier_block platform_bus_notifier = {
> +	.pm_domain = DEFAULT_PM_DOMAIN_PTR,
> +	.con_ids = { NULL, },
> +};
> +
> +static int __init exynos4_pm_runtime_init(void)
> +{
> +	pm_clk_add_notifier(&platform_bus_type, &platform_bus_notifier);
> +	return 0;
> +}
> +core_initcall(exynos4_pm_runtime_init);
> --
> 1.7.0.4

How about to make common stuff in ARM instead of each platform has their own...

I think you can consolidate this pm_runtime with other ARM platform like omap, shmobile.

arch/arm/mach-omap1/pm_bus.c
arch/arm/mach-shmobile/pm_runtime.c

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
