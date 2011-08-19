From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Subject: [RFC PATCH 0/4] ARM: EXYNOS4: Use cpuidle common save/restore framework code
Date: Fri, 19 Aug 2011 18:39:00 +0530
Message-ID: <1313759340-31319-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:53634 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751277Ab1HSNJN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 09:09:13 -0400
Received: by iye16 with SMTP id 16so5569785iye.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Aug 2011 06:09:13 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, amit.kachhap@linaro.org, patches@linaro.org

These patch adds support for samsung exynos4 platform cpuidle driver to use
the common cpuidle framework submitted earlier by Lorenzo Pieralisi. Basically
a single interface cpu_enter_idle takes care of saving and restoring single 
cpu or whole cluster information.  The link to the framework patchset is,
http://www.spinics.net/lists/arm-kernel/msg132044.html

Description of patches in this list:
1)Patch (ARM: kernel: Some fixes in save/restore common code) adds some
essential fixes for the common save/restore to work on exynos4 platform.

2)Patch (ARM: EXYNOS4: Fix to work with origen boards) adds a fix for 
extracting chip revision number.

3)Patch (ARM: EXYNOS4: Add support AFTR mode cpuidle state on EXYNOS4210) 
rebases the L2 retention C state cpuidle driver submitted earlier by 
Jaecheol Lee.

4)Patch (Modify cpuidle code to adapt to save/restore common code) uses the
generic infrastructure to enter and exit from the retention idle state. 

All these codes have been tested on Samsung ORIGEN board against the tree
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next.

Amit Daniel Kachhap (4):
  ARM: kernel: Some fixes in save/restore common code.
  ARM: EXYNOS4: Fix to work with origen boards.
  ARM: EXYNOS4: Add support AFTR mode cpuidle state on EXYNOS4210
  ARM: EXYNOS4: Modify cpuidle code to adapt to save/restore common
    code

 arch/arm/Kconfig                         |    1 +
 arch/arm/common/gic.c                    |    1 -
 arch/arm/kernel/sr_helpers.h             |    2 +-
 arch/arm/mach-exynos4/cpu.c              |   10 ++
 arch/arm/mach-exynos4/cpuidle.c          |  150 +++++++++++++++++++++++++++++-
 arch/arm/mach-exynos4/include/mach/pmu.h |    1 -
 arch/arm/mm/cache-l2x0.c                 |   10 ++-
 arch/arm/plat-s5p/include/plat/exynos4.h |    1 +
 8 files changed, 169 insertions(+), 7 deletions(-)
