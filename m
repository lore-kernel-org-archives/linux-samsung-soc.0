From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH v2 0/3] Adds PMU and S2R support for exynos5800
Date: Thu, 21 Aug 2014 18:52:34 +0545
Message-ID: <1408626457-3422-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:51848 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755041AbaHUNHt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Aug 2014 09:07:49 -0400
Received: by mail-pa0-f44.google.com with SMTP id eu11so14573400pac.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Aug 2014 06:07:48 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, olof@lixom.net

Rebased on
1] Kukjin Kim's tree, master branch
http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/
2] My 5420 PMU Series :
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg35699.html

Tested on Exynos5800 based chromebook (peach-pi board) with help of
http://www.spinics.net/lists/linux-samsung-soc/msg33750.html (modified to support 5800)

Below procedures were followed to test S2R:
Procedure A:
	1. make multi_v7_defconfig 
	2  enable MCPM for 5420
	3. enable S3C RTC
	4. pass "no_console_suspend" in bootargs
	5. echo +20 > /sys/class/rtc/rtc0/wakealarm && echo mem > /sys/power/state
Procedure B:
	1. make exynos_defconfig 
	2  disable BL_SWITCHER
	3. pass "no_console_suspend" in bootargs
	4. echo +20 > /sys/class/rtc/rtc0/wakealarm && echo mem > /sys/power/state

Vikas Sajjan (3):
  ARM: dts: Add pmu node for exynos5800 SoC
  ARM: exynos: Add exynos5800-pmu compatible entry
  ARM: exynos: Add PMU and S2R support for exynos5800 SoC

 .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
 arch/arm/boot/dts/exynos5800.dtsi                  |    4 ++++
 arch/arm/mach-exynos/exynos.c                      |    1 +
 arch/arm/mach-exynos/pm.c                          |    3 +++
 arch/arm/mach-exynos/pmu.c                         |   22 ++++++++++++++++++++
 arch/arm/mach-exynos/regs-pmu.h                    |    3 ++-
 6 files changed, 33 insertions(+), 1 deletion(-)

-- 
1.7.9.5
