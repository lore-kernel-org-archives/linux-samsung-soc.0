From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 0/6] Further cleanup and enable multiplat build
Date: Wed, 16 Apr 2014 15:51:53 +0200
Message-ID: <534E8AF9.4050206@samsung.com>
References: <1397554134-11827-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49684 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161259AbaDPNv5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 09:51:57 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N44007GUMIAAH10@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Apr 2014 14:51:46 +0100 (BST)
In-reply-to: <1397554134-11827-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, arnd@arndb.de

Hi Sachin,

On 15.04.2014 11:28, Sachin Kamat wrote:
> This series is based on latest linux-next and depends on the
> following patch:
> ARM: EXYNOS: Consolidate Kconfig entries
> http://article.gmane.org/gmane.linux.kernel.samsung-soc/28642
>
> Changes since v2:
> Replaced patch 2, "ARM: EXYNOS: Staticize exynos_subsys"
> with "ARM: EXYNOS: Remove exynos_subsys registration" as that
> code is no more used.
>
> Tested on Exynos4210, 4412, 5250 and 5420 based boards.
>
> Arnd Bergmann (1):
>    ARM: EXYNOS: Enable multi-platform build support
>
> Sachin Kamat (5):
>    ARM: EXYNOS: Remove duplicate lines in Makefile
>    ARM: EXYNOS: Remove exynos_subsys registration
>    ARM: EXYNOS: Migrate Exynos specific macros from plat to mach
>    ARM: EXYNOS: Remove unnecessary inclusion of cpu.h
>    ARM: multi_v7_defconfig: Enable Exynos platform
>
>   arch/arm/Kconfig                         |   27 ++---------
>   arch/arm/configs/exynos_defconfig        |    2 +-
>   arch/arm/configs/multi_v7_defconfig      |   10 +++++
>   arch/arm/mach-exynos/Kconfig             |   27 +++++++++++
>   arch/arm/mach-exynos/Makefile            |    9 ++--
>   arch/arm/mach-exynos/common.h            |   72 ++++++++++++++++++++++++++++++
>   arch/arm/mach-exynos/cpuidle.c           |    1 -
>   arch/arm/mach-exynos/exynos.c            |   13 ------
>   arch/arm/mach-exynos/hotplug.c           |    2 -
>   arch/arm/mach-exynos/platsmp.c           |    2 -
>   arch/arm/mach-exynos/pm.c                |    1 -
>   arch/arm/mach-exynos/pmu.c               |    2 -
>   arch/arm/plat-samsung/Makefile           |    3 ++
>   arch/arm/plat-samsung/include/plat/cpu.h |   61 -------------------------
>   14 files changed, 119 insertions(+), 113 deletions(-)
>

For the whole series:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
