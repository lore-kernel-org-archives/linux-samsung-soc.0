From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3 00/17] ARM: exynos: cpuidle: Move the driver to
 drivers/cpuidle
Date: Wed, 09 Apr 2014 14:30:37 +0200
Message-ID: <53453D6D.8030903@samsung.com>
References: <1396959579-18268-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12607 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933121AbaDIMan (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 08:30:43 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3R003UKK2WWFB0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Apr 2014 13:30:32 +0100 (BST)
In-reply-to: <1396959579-18268-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

Hi Daniel,

On 08.04.2014 14:19, Daniel Lezcano wrote:
> Changelog:
>
> V3:
> 	* Added patch   : "ARM: exynos: cpuidle: Disable cpuidle for 5440"
> 	* Removed patch : "ARM: exynos: config: Enable cpuidle"
> 	* Removed default ARM_EXYNOS4210_CPUIDLE=y
> 	* Added comment about bug fix side effect 'for_each_possible_cpu'
> V2:
> 	* Added comment in changelog for calls order (5/17)
> 	* Call the powerdown only for cpu0 in the pm notifier
> 	* Set the pm notifier for all boards
>
> V1: initial post
>
> This patchset relies on the cpm_pm notifier to initiate the powerdown sequence
> operations from pm.c instead cpuidle.c. Thus the cpuidle driver is no longer
> dependent from arch specific code as everything is called from the pm.c file.
>
> The patchset applies on top of linux-samsung/for-next.
>
> Tested on exynos4: 4210
> Tested on exynos5: 5250 (without AFTR)
>
> Daniel Lezcano (17):
>    ARM: exynos: cpuidle: Prevent forward declaration
>    ARM: exynos: cpuidle: use cpuidle_register
>    ARM: exynos: cpuidle: change function name prefix
>    ARM: exynos: cpuidle: encapsulate register access inside a function
>    ARM: exynos: cpuidle: Move some code inside the idle_finisher
>    ARM: exynos: cpuidle: Fix S5P_WAKEUP_STAT call
>    ARM: exynos: cpuidle: Use the cpu_pm notifier
>    ARM: exynos: cpuidle: Move scu_enable in the cpu_pm notifier
>    ARM: exynos: cpuidle: Remove ifdef for scu_enable
>    ARM: exynos: cpuidle: Move exynos_set_wakeupmask in the cpu_pm
>      notifier
>    ARM: exynos: cpuidle: Move the power sequence call in the cpu_pm
>      notifier
>    ARM: exynos: cpuidle: Move S5P_CHECK_AFTR in a header
>    ARM: exynos: cpuidle: Move clock setup to pm.c
>    ARM: exynos: cpuidle: Move the boot vector in pm.c
>    ARM: exynos: cpuidle: Disable cpuidle for 5440
>    ARM: exynos: cpuidle: Pass the AFTR callback to the platform_data
>    ARM: exynos: cpuidle: Move the driver to drivers/cpuidle directory
>
>   arch/arm/mach-exynos/Makefile    |    1 -
>   arch/arm/mach-exynos/common.h    |    1 +
>   arch/arm/mach-exynos/cpuidle.c   |  255 --------------------------------------
>   arch/arm/mach-exynos/exynos.c    |    8 +-
>   arch/arm/mach-exynos/pm.c        |  177 +++++++++++++++++++++-----
>   arch/arm/mach-exynos/pmu.c       |    6 +
>   arch/arm/mach-exynos/regs-pmu.h  |   20 +++
>   drivers/cpuidle/Kconfig.arm      |    6 +
>   drivers/cpuidle/Makefile         |    1 +
>   drivers/cpuidle/cpuidle-exynos.c |   97 +++++++++++++++
>   10 files changed, 285 insertions(+), 287 deletions(-)
>   delete mode 100644 arch/arm/mach-exynos/cpuidle.c
>   create mode 100644 drivers/cpuidle/cpuidle-exynos.c
>

For all patches except 10-12, 14 and 16:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
