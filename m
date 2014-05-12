From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 0/6] Further cleanup and enable multiplat build
Date: Tue, 13 May 2014 07:30:04 +0900
Message-ID: <53714B6C.7060206@samsung.com>
References: <1397554134-11827-1-git-send-email-sachin.kamat@linaro.org>	<534E8AF9.4050206@samsung.com> <CAK9yfHxu+9Lh47ULOb7PWy=JJZqjU3jB9wteJsLvnhDDr=_PQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:44591 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751100AbaELWaL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 18:30:11 -0400
Received: by mail-pb0-f42.google.com with SMTP id rp16so168138pbb.29
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 May 2014 15:30:10 -0700 (PDT)
In-Reply-To: <CAK9yfHxu+9Lh47ULOb7PWy=JJZqjU3jB9wteJsLvnhDDr=_PQw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>

On 05/05/14 00:35, Sachin Kamat wrote:
> On 16 April 2014 19:21, Tomasz Figa<t.figa@samsung.com>  wrote:
>> Hi Sachin,
>>
>>
>> On 15.04.2014 11:28, Sachin Kamat wrote:
>>>
>>> This series is based on latest linux-next and depends on the
>>> following patch:
>>> ARM: EXYNOS: Consolidate Kconfig entries
>>> http://article.gmane.org/gmane.linux.kernel.samsung-soc/28642
>>>
>>> Changes since v2:
>>> Replaced patch 2, "ARM: EXYNOS: Staticize exynos_subsys"
>>> with "ARM: EXYNOS: Remove exynos_subsys registration" as that
>>> code is no more used.
>>>
>>> Tested on Exynos4210, 4412, 5250 and 5420 based boards.
>>>
>>> Arnd Bergmann (1):
>>>     ARM: EXYNOS: Enable multi-platform build support
>>>
>>> Sachin Kamat (5):
>>>     ARM: EXYNOS: Remove duplicate lines in Makefile
>>>     ARM: EXYNOS: Remove exynos_subsys registration
>>>     ARM: EXYNOS: Migrate Exynos specific macros from plat to mach
>>>     ARM: EXYNOS: Remove unnecessary inclusion of cpu.h
>>>     ARM: multi_v7_defconfig: Enable Exynos platform
>>>
>>>    arch/arm/Kconfig                         |   27 ++---------
>>>    arch/arm/configs/exynos_defconfig        |    2 +-
>>>    arch/arm/configs/multi_v7_defconfig      |   10 +++++
>>>    arch/arm/mach-exynos/Kconfig             |   27 +++++++++++
>>>    arch/arm/mach-exynos/Makefile            |    9 ++--
>>>    arch/arm/mach-exynos/common.h            |   72
>>> ++++++++++++++++++++++++++++++
>>>    arch/arm/mach-exynos/cpuidle.c           |    1 -
>>>    arch/arm/mach-exynos/exynos.c            |   13 ------
>>>    arch/arm/mach-exynos/hotplug.c           |    2 -
>>>    arch/arm/mach-exynos/platsmp.c           |    2 -
>>>    arch/arm/mach-exynos/pm.c                |    1 -
>>>    arch/arm/mach-exynos/pmu.c               |    2 -
>>>    arch/arm/plat-samsung/Makefile           |    3 ++
>>>    arch/arm/plat-samsung/include/plat/cpu.h |   61
>>> -------------------------
>>>    14 files changed, 119 insertions(+), 113 deletions(-)
>>>
>>
>> For the whole series:
>>
>> Reviewed-by: Tomasz Figa<t.figa@samsung.com>
>
> Kukjin,
>
> Can you please apply the first 4 patches in this series for now?
>
Yes, I've applied the first 4 patches just now and I need to look at the 
5/6 patch...

Thanks,
Kukjin
