From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2 0/6] Further cleanup and enable multiplat build
Date: Sun, 4 May 2014 21:05:21 +0530
Message-ID: <CAK9yfHxu+9Lh47ULOb7PWy=JJZqjU3jB9wteJsLvnhDDr=_PQw@mail.gmail.com>
References: <1397554134-11827-1-git-send-email-sachin.kamat@linaro.org>
	<534E8AF9.4050206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:40302 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751071AbaEDPfV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 May 2014 11:35:21 -0400
Received: by mail-ob0-f181.google.com with SMTP id wm4so588173obc.40
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 May 2014 08:35:21 -0700 (PDT)
In-Reply-To: <534E8AF9.4050206@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>

On 16 April 2014 19:21, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Sachin,
>
>
> On 15.04.2014 11:28, Sachin Kamat wrote:
>>
>> This series is based on latest linux-next and depends on the
>> following patch:
>> ARM: EXYNOS: Consolidate Kconfig entries
>> http://article.gmane.org/gmane.linux.kernel.samsung-soc/28642
>>
>> Changes since v2:
>> Replaced patch 2, "ARM: EXYNOS: Staticize exynos_subsys"
>> with "ARM: EXYNOS: Remove exynos_subsys registration" as that
>> code is no more used.
>>
>> Tested on Exynos4210, 4412, 5250 and 5420 based boards.
>>
>> Arnd Bergmann (1):
>>    ARM: EXYNOS: Enable multi-platform build support
>>
>> Sachin Kamat (5):
>>    ARM: EXYNOS: Remove duplicate lines in Makefile
>>    ARM: EXYNOS: Remove exynos_subsys registration
>>    ARM: EXYNOS: Migrate Exynos specific macros from plat to mach
>>    ARM: EXYNOS: Remove unnecessary inclusion of cpu.h
>>    ARM: multi_v7_defconfig: Enable Exynos platform
>>
>>   arch/arm/Kconfig                         |   27 ++---------
>>   arch/arm/configs/exynos_defconfig        |    2 +-
>>   arch/arm/configs/multi_v7_defconfig      |   10 +++++
>>   arch/arm/mach-exynos/Kconfig             |   27 +++++++++++
>>   arch/arm/mach-exynos/Makefile            |    9 ++--
>>   arch/arm/mach-exynos/common.h            |   72
>> ++++++++++++++++++++++++++++++
>>   arch/arm/mach-exynos/cpuidle.c           |    1 -
>>   arch/arm/mach-exynos/exynos.c            |   13 ------
>>   arch/arm/mach-exynos/hotplug.c           |    2 -
>>   arch/arm/mach-exynos/platsmp.c           |    2 -
>>   arch/arm/mach-exynos/pm.c                |    1 -
>>   arch/arm/mach-exynos/pmu.c               |    2 -
>>   arch/arm/plat-samsung/Makefile           |    3 ++
>>   arch/arm/plat-samsung/include/plat/cpu.h |   61
>> -------------------------
>>   14 files changed, 119 insertions(+), 113 deletions(-)
>>
>
> For the whole series:
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Kukjin,

Can you please apply the first 4 patches in this series for now?

-- 
With warm regards,
Sachin
