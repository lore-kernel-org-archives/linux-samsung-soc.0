From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH v5 0/6] add cpuidle support for Exynos5420
Date: Wed, 14 May 2014 13:33:51 +0530
Message-ID: <1400054637-21505-1-git-send-email-chander.kashyap@linaro.org>
References: <ANuQgHGSPJ45tbrVppAVpOqF0OfHacPWfX=S5mOVxTPr66f7vg@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:49338 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751145AbaENIEP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 04:04:15 -0400
Received: by mail-pb0-f54.google.com with SMTP id jt11so1397879pbb.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2014 01:04:14 -0700 (PDT)
In-Reply-To: <ANuQgHGSPJ45tbrVppAVpOqF0OfHacPWfX=S5mOVxTPr66f7vg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: daniel.lezcano@linaro.org, lorenzo.pieralisi@arm.com, rjw@rjwysocki.net, kgene.kim@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>

Exynos5420 is a big-little Soc from Samsung. It has 4 A15 and 4 A7 cores.

This patchset adds cpuidle support for Exynos5420 SoC based on
generic big.little cpuidle driver.

Tested on SMDK5420.

This patch set depends on:
	1. [PATCH 0/5] MCPM backend for Exynos5420
	   http://www.spinics.net/lists/arm-kernel/msg331100.html
Changelog is in respective patches.
Chander Kashyap (5):
  driver: cpuidle-big-little: add of_device_id structure
  arm: exynos: add generic function to calculate cpu number
  cpuidle: config: Add ARCH_EXYNOS entry to select cpuidle-big-little
    driver
  driver: cpuidle: cpuidle-big-little: init driver for Exynos5420
  exynos: cpuidle: do not allow cpuidle registration for Exynos5420
  mcpm: exynos: populate suspend and powered_up callbacks

 arch/arm/mach-exynos/cpuidle.c       |    3 +++
 arch/arm/mach-exynos/mcpm-exynos.c   |   36 ++++++++++++++++++++++++++++++++++
 arch/arm/mach-exynos/regs-pmu.h      |    9 +++++++++
 drivers/cpuidle/Kconfig.arm          |    2 +-
 drivers/cpuidle/cpuidle-big_little.c |   12 +++++++++++-
 5 files changed, 60 insertions(+), 2 deletions(-)

-- 
1.7.9.5
