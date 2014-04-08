From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V3 00/17] ARM: exynos: cpuidle: Move the driver to drivers/cpuidle
Date: Tue,  8 Apr 2014 14:19:22 +0200
Message-ID: <1396959579-18268-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:36929 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756351AbaDHMTX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 08:19:23 -0400
Received: by mail-wg0-f48.google.com with SMTP id l18so859875wgh.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2014 05:19:22 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

Changelog:

V3:
	* Added patch   : "ARM: exynos: cpuidle: Disable cpuidle for 5440"
	* Removed patch : "ARM: exynos: config: Enable cpuidle"
	* Removed default ARM_EXYNOS4210_CPUIDLE=y
	* Added comment about bug fix side effect 'for_each_possible_cpu'
V2: 
	* Added comment in changelog for calls order (5/17)
	* Call the powerdown only for cpu0 in the pm notifier
	* Set the pm notifier for all boards

V1: initial post

This patchset relies on the cpm_pm notifier to initiate the powerdown sequence
operations from pm.c instead cpuidle.c. Thus the cpuidle driver is no longer
dependent from arch specific code as everything is called from the pm.c file.

The patchset applies on top of linux-samsung/for-next.

Tested on exynos4: 4210
Tested on exynos5: 5250 (without AFTR)

Daniel Lezcano (17):
  ARM: exynos: cpuidle: Prevent forward declaration
  ARM: exynos: cpuidle: use cpuidle_register
  ARM: exynos: cpuidle: change function name prefix
  ARM: exynos: cpuidle: encapsulate register access inside a function
  ARM: exynos: cpuidle: Move some code inside the idle_finisher
  ARM: exynos: cpuidle: Fix S5P_WAKEUP_STAT call
  ARM: exynos: cpuidle: Use the cpu_pm notifier
  ARM: exynos: cpuidle: Move scu_enable in the cpu_pm notifier
  ARM: exynos: cpuidle: Remove ifdef for scu_enable
  ARM: exynos: cpuidle: Move exynos_set_wakeupmask in the cpu_pm
    notifier
  ARM: exynos: cpuidle: Move the power sequence call in the cpu_pm
    notifier
  ARM: exynos: cpuidle: Move S5P_CHECK_AFTR in a header
  ARM: exynos: cpuidle: Move clock setup to pm.c
  ARM: exynos: cpuidle: Move the boot vector in pm.c
  ARM: exynos: cpuidle: Disable cpuidle for 5440
  ARM: exynos: cpuidle: Pass the AFTR callback to the platform_data
  ARM: exynos: cpuidle: Move the driver to drivers/cpuidle directory

 arch/arm/mach-exynos/Makefile    |    1 -
 arch/arm/mach-exynos/common.h    |    1 +
 arch/arm/mach-exynos/cpuidle.c   |  255 --------------------------------------
 arch/arm/mach-exynos/exynos.c    |    8 +-
 arch/arm/mach-exynos/pm.c        |  177 +++++++++++++++++++++-----
 arch/arm/mach-exynos/pmu.c       |    6 +
 arch/arm/mach-exynos/regs-pmu.h  |   20 +++
 drivers/cpuidle/Kconfig.arm      |    6 +
 drivers/cpuidle/Makefile         |    1 +
 drivers/cpuidle/cpuidle-exynos.c |   97 +++++++++++++++
 10 files changed, 285 insertions(+), 287 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/cpuidle.c
 create mode 100644 drivers/cpuidle/cpuidle-exynos.c

-- 
1.7.9.5
