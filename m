From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH 0/3] Adds PMU and S2R support for exynos5800
Date: Wed, 09 Jul 2014 16:55:44 +0530
Message-ID: <1404905147-30319-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35714 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755278AbaGIL2s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jul 2014 07:28:48 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8F007SSZVK9P10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jul 2014 20:28:32 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, Vikas Sajjan <vikas.sajjan@samsung.com>

Rebased on
1] Kukjin Kim's tree, for-next branch
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
2] My 5420 PMU Series :
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg33675.html

Tested on Exynos5800 based chromebook (peach-pi board) with help of
 1] http://www.spinics.net/lists/linux-samsung-soc/msg33750.html (modified to support 5800)
 2] http://www.spinics.net/lists/linux-samsung-soc/msg32923.html

Below are steps followed to test S2R:
	1. make multi_v7_defconfig 
	2  enable MCPM for 5420
	3. enable S3C RTC
	4. pass "no_console_suspend" in bootargs
	5. echo +20 > /sys/class/rtc/rtc0/wakealarm && echo mem > /sys/power/state

Vikas Sajjan (3):
  arm: dts: Add pmu node for exynos5800 SoC
  arm: exynos: Add exynos5800-pmu compatible entry
  arm: exynos: Add PMU and S2R support for exynos5800 SoC

 .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
 arch/arm/boot/dts/exynos5800.dtsi                  |    4 ++++
 arch/arm/mach-exynos/exynos.c                      |    1 +
 arch/arm/mach-exynos/pm.c                          |    3 +++
 arch/arm/mach-exynos/pmu.c                         |   22 ++++++++++++++++++++
 arch/arm/mach-exynos/regs-pmu.h                    |    3 ++-
 6 files changed, 33 insertions(+), 1 deletion(-)

-- 
1.7.9.5
