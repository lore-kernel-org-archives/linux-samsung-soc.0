From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 00/17] ARM: exynos: cpuidle: Move the driver to drivers/cpuidle
Date: Fri,  4 Apr 2014 09:47:46 +0200
Message-ID: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:58151 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbaDDHrs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 03:47:48 -0400
Received: by mail-we0-f170.google.com with SMTP id w61so3006094wes.29
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 00:47:47 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

This patchset relies on the cpm_pm notifier to initiate the powerdown sequence
operations from pm.c instead cpuidle.c. Thus the cpuidle driver is no longer
dependent from arch specific code as everything is called from the pm.c file.

The patchset applies on top of v3.14.

Tested on exynos4: 4210
Tested on exynos5: 5250

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
  ARM: exynos: cpuidle: Pass the AFTR callback to the platform_data
  ARM: exynos: cpuidle: Move the driver to drivers/cpuidle directory
  ARM: exynos: config: Enable cpuidle

 arch/arm/configs/exynos_defconfig |    1 +
 arch/arm/mach-exynos/Makefile     |    1 -
 arch/arm/mach-exynos/common.c     |    5 +-
 arch/arm/mach-exynos/common.h     |    1 +
 arch/arm/mach-exynos/cpuidle.c    |  256 -------------------------------------
 arch/arm/mach-exynos/pm.c         |  191 ++++++++++++++++++++++-----
 arch/arm/mach-exynos/pmu.c        |    6 +
 arch/arm/mach-exynos/regs-pmu.h   |    1 +
 drivers/cpuidle/Kconfig.arm       |    7 +
 drivers/cpuidle/Makefile          |    1 +
 drivers/cpuidle/cpuidle-exynos.c  |  102 +++++++++++++++
 11 files changed, 281 insertions(+), 291 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/cpuidle.c
 create mode 100644 drivers/cpuidle/cpuidle-exynos.c

-- 
1.7.9.5
