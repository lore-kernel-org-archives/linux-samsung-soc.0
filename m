From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH] soc: samsung: pmu: split up SoC specific PMU data
Date: Thu, 04 Dec 2014 09:02:22 +0530
Message-ID: <547FD5C6.3030308@samsung.com>
References: <1417364162-29981-1-git-send-email-pankaj.dubey@samsung.com>
 <547EA0DC.70800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25279 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751482AbaLDDc6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 22:32:58 -0500
In-reply-to: <547EA0DC.70800@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jonghwa3.lee@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, amit.daniel@samsung.com, kgene.kim@samsung.com, arnd@arndb.de, thomas.ab@samsung.com

On Wednesday 03 December 2014 11:04 AM, jonghwa3.lee@samsung.com wrote:
> On 2014=EB=85=84 12=EC=9B=94 01=EC=9D=BC 01:16, Pankaj Dubey wrote:
>
>> This patch splits up exynos-pmu.c file, and moves PMU configuration =
data
>> and functions handing those data into SoC specific PMU files, keepin=
g
>> driver structure and common functionality into exynos-pmu.c.
>>
>> At the same time it also separates compilation of these different So=
C PMU files
>> based on CONFIG_ARM64 and CONFIG_ARM. This way we can reduce overhea=
d of ARM64
>> SoC's PMU getting compiled when kernel is built for ARM and vice-ver=
sa.
>>
>> This patch also removes .owner field from exynos-pmu.c as it's redun=
dant for
>> drivers calling platform_driver_register to register platform_driver=
=2E
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>> This patch is prepared on top of kgene/for-next and following patch =
[1] from
>> Amit Daniel.
>>
>> [1]: http://www.spinics.net/lists/linux-samsung-soc/msg39797.html
>>
>> This patch tries to address some of concerns raised for using exynos=
-pmu.c for
>> ARM and ARM64 based SoC at these threads [2], [3].
>>
>> [2]: http://www.spinics.net/lists/linux-samsung-soc/msg39809.html
>> [3]: https://lkml.org/lkml/2014/11/24/322
>>
>> Since Exynos SoC's has similar PMU IP, and already existing bindings=
 can be
>> used, it makes sense to keep single driver for both ARM and ARM64 ba=
sed SoCs.
>> All common functionalties are in exynos-pmu.c whereas SoC specific d=
ata and
>> handling are moved into SoC specific exynosNNNN-pmu files.
>>
>> All changes are compiled tested only. Any improvements/suggestions a=
re most
>> welcome.
>>
>>   drivers/soc/samsung/Makefile         |    9 +-
>>   drivers/soc/samsung/exynos-pmu.c     | 1293 +---------------------=
------------
>>   drivers/soc/samsung/exynos-pmu.h     |   63 ++
>>   drivers/soc/samsung/exynos3250-pmu.c |  176 +++++
>>   drivers/soc/samsung/exynos4-pmu.c    |  223 ++++++
>>   drivers/soc/samsung/exynos5250-pmu.c |  196 ++++++
>>   drivers/soc/samsung/exynos5420-pmu.c |  298 ++++++++
>>   drivers/soc/samsung/exynos7-pmu.c    |  441 ++++++++++++
>>   8 files changed, 1412 insertions(+), 1287 deletions(-)
>>   create mode 100644 drivers/soc/samsung/exynos-pmu.h
>>   create mode 100644 drivers/soc/samsung/exynos3250-pmu.c
>>   create mode 100644 drivers/soc/samsung/exynos4-pmu.c
>>   create mode 100644 drivers/soc/samsung/exynos5250-pmu.c
>>   create mode 100644 drivers/soc/samsung/exynos5420-pmu.c
>>   create mode 100644 drivers/soc/samsung/exynos7-pmu.c
>>
>
> ...
>
>> diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/=
exynos-pmu.h
>> new file mode 100644
>> index 0000000..4adc5a3
>> --- /dev/null
>> +++ b/drivers/soc/samsung/exynos-pmu.h
>> @@ -0,0 +1,63 @@
>> +/*
>> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
>> + *		http://www.samsung.com
>> + *
>> + * Header for EXYNOS PMU Driver support
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#ifndef __EXYNOSPMU_H
>> +#define __EXYNOSPMU_H
>> +
>> +#include <linux/io.h>
>> +
>> +#define PMU_TABLE_END	(-1U)
>> +
>> +static void __iomem *pmu_base_addr;
>> +
>
> AFAIK, static variable in header file can't be used globally. It woul=
d be placed
> in exynos-pmu.c or elsewhere and then only extern declaration is allo=
wed here.
> If I'm wrong, please let me know.
>

Thanks for review.
You are right. I will change this.
I am waiting for review from other concerned people so that if any=20
suggestions or improvements I can do it in next version.

> Thanks.
> Jonghwa
>
