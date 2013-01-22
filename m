From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/6] ARM: S3C24XX: Cleanup mach-s3c2410,
 mach-s3c2412 and mach-s3c2440
Date: Mon, 21 Jan 2013 17:12:05 -0800
Message-ID: <1358817131-27169-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20035 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752036Ab3AVBM5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 20:12:57 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH0000Q6611QXL0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Jan 2013 10:12:56 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MH000NXU61A2ED0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Jan 2013 10:12:55 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This is for cleanup mach-s3c2410, mach-s3c2412 and mach-s3c2440 directories.
Basically, cpufreq driver in there should be implemented into drivers/cpufreq/
but I think, would be better if we could cleanup the mach- directories.

 arch/arm/Kconfig                                                                      |    4 ----
 arch/arm/Makefile                                                                     |    2 +-
 arch/arm/mach-s3c2410/Kconfig                                                         |   20 ----------------
 arch/arm/mach-s3c2410/Makefile                                                        |   14 -----------
 arch/arm/mach-s3c2412/Kconfig                                                         |   13 -----------
 arch/arm/mach-s3c2412/Makefile                                                        |   12 ----------
 arch/arm/mach-s3c2412/gpio.c                                                          |   62 -------------------------------------------------
 arch/arm/mach-s3c2440/Kconfig                                                         |   37 -----------------------------
 arch/arm/mach-s3c2440/Makefile                                                        |   15 ------------
 arch/arm/mach-s3c24xx/Kconfig                                                         |   56 ++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-s3c24xx/Makefile                                                        |    6 +++++
 arch/arm/{mach-s3c2410/cpu-freq.c => mach-s3c24xx/cpufreq-s3c2410.c}                  |    7 ++----
 arch/arm/{mach-s3c2412/cpu-freq.c => mach-s3c24xx/cpufreq-s3c2412.c}                  |    6 ++---
 arch/arm/{mach-s3c2440/s3c2440-cpufreq.c => mach-s3c24xx/cpufreq-s3c2440.c}           |    4 +---
 arch/arm/mach-s3c24xx/include/mach/hardware.h                                         |    6 -----
 arch/arm/{mach-s3c2410/pll.c => mach-s3c24xx/pll-s3c2410.c}                           |    5 +---
 arch/arm/{mach-s3c2440/s3c2440-pll-12000000.c => mach-s3c24xx/pll-s3c2440-12000000.c} |    5 +---
 arch/arm/{mach-s3c2440/s3c2440-pll-16934400.c => mach-s3c24xx/pll-s3c2440-16934400.c} |    5 +---
 18 files changed, 71 insertions(+), 208 deletions(-)

[PATCH 1/6] ARM: S3C24XX: Move mach-s3c2410/ cpufreq into
[PATCH 2/6] ARM: S3C24XX: Move mach-s3c2410/ pll into mach-s3c24xx/
[PATCH 3/6] ARM: S3C2412: Remove useless codes mach-s3c2412/gpio.c
[PATCH 4/6] ARM: S3C24XX: Move mach-s3c2412/ cpufreq driver into
[PATCH 5/6] ARM: S3C24XX: Move mach-s3c2440/ cpufreq driver into
[PATCH 6/6] ARM: S3C24XX: Move mach-s3c2440/ pll into mach-s3c24xx/
