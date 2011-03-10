From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 3/3] ARM: S5P: Add support for common MIPI CSIS/DSIM
	D-PHY control
Date: Thu, 10 Mar 2011 12:20:01 +0100
Message-ID: <4D78B3E1.6030506@samsung.com>
References: <01a701cbd95d$9873c160$c95b4420$%kim@samsung.com>
 <1299179061-30959-4-git-send-email-s.nawrocki@samsung.com>
 <002601cbdead$0f1cb840$2d5628c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:31935 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751069Ab1CJLUF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 06:20:05 -0500
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LHU00LPXA5E6660@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 11:20:02 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LHU008AQA5DEN@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 11:20:02 +0000 (GMT)
In-reply-to: <002601cbdead$0f1cb840$2d5628c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com

On 03/09/2011 11:55 PM, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
>>
>> Add common code for MIPI-CSIS and MIPI-DSIM drivers to support
>> their corresponding D-PHY's enable and reset control.
>> Tested with S5PV210 and EXYNOS4 SoCs.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/mach-exynos4/include/mach/regs-pmu.h   |    5 ++
>>  arch/arm/mach-s5pv210/include/mach/regs-clock.h |    5 +-
>>  arch/arm/plat-s5p/Kconfig                       |    5 ++
>>  arch/arm/plat-s5p/Makefile                      |    1 +
>>  arch/arm/plat-s5p/setup-mipi.c                  |   68
>> +++++++++++++++++++++++
>>  5 files changed, 83 insertions(+), 1 deletions(-)
>>  create mode 100644 arch/arm/plat-s5p/setup-mipi.c
...
>> diff --git a/arch/arm/plat-s5p/setup-mipi.c
> b/arch/arm/plat-s5p/setup-mipi.c
>> new file mode 100644
>> index 0000000..4d8ae96
>> --- /dev/null
>> +++ b/arch/arm/plat-s5p/setup-mipi.c
> 
> I think, "setup-mipiphy.c" is more clearly :)

OK.

> 
>> @@ -0,0 +1,68 @@
>> +/*
>> + * Copyright (C) 2011 Samsung Electronics Co., Ltd
>> + *
>> + * S5P - Helper functions for MIPI-CSIS and MIPI-DSIM D-PHY control
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/io.h>
>> +#include <linux/spinlock.h>
>> +
>> +#ifdef CONFIG_ARCH_EXYNOS4
>> +#include <mach/regs-pmu.h>
>> +#else
>> +#include <mach/regs-clock.h>
>> +#endif
> 
> How about following?
> 
> --- a/arch/arm/mach-exynos4/include/mach/regs-clock.h
> +++ b/arch/arm/mach-exynos4/include/mach/regs-clock.h
> @@ -160,7 +160,9 @@
>  #define S5P_CLKDIV_BUS_GPLR_SHIFT      (4)
>  #define S5P_CLKDIV_BUS_GPLR_MASK       (0x7 << S5P_CLKDIV_BUS_GPLR_SHIFT)
> 
> -/* Compatibility defines */
> +/* Compatibility defines and inclusion */
> +
> +#include <mach/regs-pmu.h>
> 
>  #define S5P_EPLL_CON                   S5P_EPLL_CON0
> 
> Then, just adding regs-clock.h here.
> 
> +#include <mach/regs-clock.h>
> 

Yeah, that should do the trick, thanks. At least for now it's fine.
But I think the concept of having common code for peripherals and just
different headers for register address offset definitions for various
ARCH_S5P* need to be reconsidered to be able to build single image
for a few SoCs.

>> +
>> +static int __s5p_mipi_phy_control(struct platform_device *pdev,
>> +				  bool on, u32 reset)
...

Regards,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
