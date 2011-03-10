From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 0/3] ARM: S5P: Add platform helpers for MIPI-CSIS/DSIM DPHY
Date: Thu, 10 Mar 2011 14:03:10 +0100
Message-ID: <1299762193-7791-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:47250 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751852Ab1CJNDW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 08:03:22 -0500
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LHU002IAEXKJ880@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 13:03:20 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LHU003G1EXJKP@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 13:03:19 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com

Hello,

the following is a fourth version of a change set adding platform helpers 
for the MIPI-CSIS and MIPI-DSIM PHYs control on S5PV210 and Exynos4.

Changes since v3:
 - further copyright change (ptach 1/3)
 - fixed_phy_vdd type changed to bool (p. 2/3);  	

Changes since v2:
 - renamed setup-mipi.c/setup-mipidphy.c
 - regs-pmu.h header included in regs-clock.s in mach-exynos4 to get
   rid of CONFIG_ARCH_EXYNOS4 in setup-mipiphy.c

Changes since v1:
 - updated the platform data structure with an additional flag indicating
   whether the driver should attempt to control the external mipi-csis 
   (VDD18_MIPI) voltage regulator or not. This might be needed on systems 
   where MIPI VDD power supply cannot be separately switched on/off.


The patch series contains:
 [PATCH v4 1/3] ARM: S5P: Rename MIPI-CSIS driver header and update Copyright
 [PATCH v4 2/3] ARM: S5P: Extend MIPI-CSIS platform_data with the PHY control callback
 [PATCH v4 3/3] ARM: S5P: Add support for common MIPI CSIS/DSIM D-PHY control

Created against for-next branch at:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 

Regards,
--
Sylwester Nawrocki
Samsung Poland R&D Center
