From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/4] ARM: EXYNOS4: Support for generic Clock manipulation
 PM callbacks
Date: Wed, 05 Oct 2011 10:57:46 +0900
Message-ID: <4E8BB99A.30005@samsung.com>
References: <4E4360B5.3050203@samsung.com>
 <001801cc80d2$065939a0$130bace0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41100 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933050Ab1JEB6b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Oct 2011 21:58:31 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSK00LCRLGVU3B0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Oct 2011 10:58:30 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LSK00DQULHH7U80@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Oct 2011 10:58:29 +0900 (KST)
In-reply-to: <001801cc80d2$065939a0$130bace0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-pm@lists.linux-foundation.org, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Kukjin Kim wrote:
> Chanwoo Choi wrote:
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/mach-exynos4/Makefile     |    2 +-
>>  arch/arm/mach-exynos4/pm-runtime.c |   56 ++++++++++++++++++++++++++++++++++++
>>  2 files changed, 57 insertions(+), 1 deletions(-)
>>  create mode 100644 arch/arm/mach-exynos4/pm-runtime.c
>>
>> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
>> index 97c31ce..28cdb8b 100644
>> --- a/arch/arm/mach-exynos4/Makefile
>> +++ b/arch/arm/mach-exynos4/Makefile
>> @@ -5,7 +5,7 @@
>>  #
>>  # Licensed under GPLv2
>>
>> -obj-y				:=
>> +obj-y				:= pm-runtime.o
> 
> To move under depending CONFIG_ARCH_EXYNOS4 like others is better.
Ok, I will modify it.

> 
>>  obj-m				:=
>>  obj-n				:=
>>  obj-				:=
>> diff --git a/arch/arm/mach-exynos4/pm-runtime.c b/arch/arm/mach-exynos4/pm-runtime.c
>> new file mode 100644
>> index 0000000..4fe9f73
>> --- /dev/null
>> +++ b/arch/arm/mach-exynos4/pm-runtime.c
>> @@ -0,0 +1,56 @@
>> +/* linux/arch/arm/mach-exynos4/pm-runtime.c
>> +
>> + * Exynos4210 Power management support
>> + *
>> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
>> + *		http://www.samsung.com
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/io.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/clk.h>
>> +#include <linux/bitmap.h>
>> +#include <linux/slab.h>
>> +
>> +#ifdef CONFIG_PM_RUNTIME
>> +
>> +static int default_platform_runtime_idle(struct device *dev)
>> +{
>> +	return pm_runtime_suspend(dev);
>> +}
>> +
>> +static struct dev_pm_domain default_pm_domain = {
>> +	.ops = {
>> +		.runtime_suspend = pm_clk_suspend,
>> +		.runtime_resume = pm_clk_resume,
>> +		.runtime_idle = default_platform_runtime_idle,
>> +		USE_PLATFORM_PM_SLEEP_OPS
>> +	},
>> +};
>> +
>> +#define DEFAULT_PM_DOMAIN_PTR	(&default_pm_domain)
>> +
>> +#else
>> +
>> +#define DEFAULT_PM_DOMAIN_PTR	NULL
>> +
>> +#endif /* CONFIG_PM_RUNTIME */
>> +
>> +static struct pm_clk_notifier_block platform_bus_notifier = {
>> +	.pm_domain = DEFAULT_PM_DOMAIN_PTR,
>> +	.con_ids = { NULL, },
>> +};
>> +
>> +static int __init exynos4_pm_runtime_init(void)
>> +{
>> +	pm_clk_add_notifier(&platform_bus_type, &platform_bus_notifier);
>> +	return 0;
>> +}
>> +core_initcall(exynos4_pm_runtime_init);
>> --
>> 1.7.0.4
> 
> How about to make common stuff in ARM instead of each platform has their own...
> 
> I think you can consolidate this pm_runtime with other ARM platform like omap, shmobile.
> 
> arch/arm/mach-omap1/pm_bus.c
> arch/arm/mach-shmobile/pm_runtime.c
> 
OK, I received the comment of consolidating geneirc power-domain of exynos series from Sylwester Nawrocki. 
I will reimplment for supporting various exynos series and resend it.

Thanks,

Best Regards,
Chanwoo Choi
