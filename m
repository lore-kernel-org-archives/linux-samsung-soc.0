From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v3 0/7] ARM: S5PV210: CPUFREQ Initial Support
Date: Mon, 19 Jul 2010 14:31:16 +0900
Message-ID: <1279517483-22751-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:24217 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752648Ab0GSFb2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 01:31:28 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5S000TMI0BRA60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Jul 2010 14:31:23 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5S0082KI0BF4@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Jul 2010 14:31:23 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

S5PV210 CPUFREQ Initial Support.

This is a series of patches to enable CPUFREQ for S5PV210.

Although this works without PMIC's DVS support, it is not
as effective without DVS support as supposed. AVS is not
supported in this version.


MyungJoo Ham (7):
  ARM: S5PV210: Add a Kconfig entry "S5PC110_EVT0_WORKAROUND"
  ARM: Samsung SoC: added hclk/pclk info to s3c_freq for s5pv210
    cpu-freq
  ARM: S5P: Added default pll values for APLL 800/1000MHz
  ARM: S5P: Virtual Addresses for DMCx registers.
  ARM: S5PV210: macros for clock registers at regs-clock.h
  ARM: S5PV210: Access for DMCx registers
  ARM: S5PV210: Initial CPUFREQ Support

 arch/arm/Kconfig                                |    1 +
 arch/arm/mach-s5pv210/Kconfig                   |    7 +
 arch/arm/mach-s5pv210/Makefile                  |    3 +
 arch/arm/mach-s5pv210/cpu.c                     |   12 +-
 arch/arm/mach-s5pv210/cpufreq-s5pv210.c         |  766 +++++++++++++++++++++++
 arch/arm/mach-s5pv210/include/mach/cpu-freq.h   |   51 ++
 arch/arm/mach-s5pv210/include/mach/map.h        |    4 +
 arch/arm/mach-s5pv210/include/mach/regs-clock.h |   45 ++-
 arch/arm/plat-s5p/include/plat/map-s5p.h        |    3 +
 arch/arm/plat-s5p/include/plat/pll.h            |    8 +
 arch/arm/plat-samsung/include/plat/cpu-freq.h   |    6 +
 11 files changed, 902 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/cpufreq-s5pv210.c
 create mode 100644 arch/arm/mach-s5pv210/include/mach/cpu-freq.h
