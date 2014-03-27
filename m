From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH V2 0/3] Add PMU and S2R support for exynos5420
Date: Thu, 27 Mar 2014 11:43:02 +0530
Message-ID: <1395900785-11334-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39817 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750771AbaC0GNF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Mar 2014 02:13:05 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3200JCZZXRYC70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Mar 2014 15:13:03 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, Vikas Sajjan <vikas.sajjan@samsung.com>

rebased on kgene tree for-next branch
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next

changes since v1:
	- Addressed comments from Tomasz figa.
	- restructured/consolidated as per Tomasz figa's PM consolidations for exynos 

Abhilash Kesavan (1):
  ARM: dts: Add node for GPIO keys on SMDK5420

Vikas Sajjan (2):
  ARM: EXYNOS5: Add PMU settings for exynos5420
  ARM: EXYNOS5: Support Suspend-to-RAM on EXYNOS5420

 arch/arm/boot/dts/exynos5420-smdk5420.dts    |   11 +
 arch/arm/mach-exynos/common.h                |   10 +
 arch/arm/mach-exynos/pm.c                    |  148 +++++++++++--
 arch/arm/mach-exynos/pmu.c                   |  307 ++++++++++++++++++++++++++
 arch/arm/mach-exynos/regs-pmu.h              |  230 +++++++++++++++++++
 arch/arm/plat-samsung/include/plat/map-s5p.h |    2 +
 drivers/clk/samsung/clk-exynos5420.c         |   32 +++
 7 files changed, 722 insertions(+), 18 deletions(-)

-- 
1.7.9.5
