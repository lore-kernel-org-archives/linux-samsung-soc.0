From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 0/3] Exynos5420 Cpufreq support
Date: Fri,  6 Dec 2013 15:18:01 +0530
Message-ID: <1386323284-15646-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:55231 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755124Ab3LFJtD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Dec 2013 04:49:03 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, rjw@rjwysocki.net, viresh.kumar@linaro.org, tomasz.figa@gmail.com, arjun.kv@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com

The patch series adds the cpufreq driver for exynos5420 with
its dependencies. This initial version of the driver only
modifies the A15 core frequencies.

Arjun.K.V (1):
  cpufreq: exynos: Add exynos5420 cpufreq driver

Arun Kumar K (2):
  ARM: EXYNOS: Add exynos5 CPU clock divider offsets
  clk: exynos5420: Add alias names for cpu clocks

 arch/arm/mach-exynos/include/mach/regs-clock.h |   24 ++
 drivers/clk/samsung/clk-exynos5420.c           |    9 +-
 drivers/cpufreq/Kconfig.arm                    |   11 +
 drivers/cpufreq/Makefile                       |    1 +
 drivers/cpufreq/exynos-cpufreq.c               |    2 +
 drivers/cpufreq/exynos-cpufreq.h               |    8 +
 drivers/cpufreq/exynos5420-cpufreq.c           |  346 ++++++++++++++++++++++++
 7 files changed, 397 insertions(+), 4 deletions(-)
 create mode 100644 drivers/cpufreq/exynos5420-cpufreq.c

-- 
1.7.9.5
