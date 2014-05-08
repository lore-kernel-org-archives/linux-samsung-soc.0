From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH V3 0/3] Add PMU and S2R support for exynos5420
Date: Thu, 08 May 2014 16:15:31 +0530
Message-ID: <1399545934-29674-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:21962 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753015AbaEHKrH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 06:47:07 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5900KTJ4MHTF40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 May 2014 19:47:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, pankaj.dubey@samsung.com, sajjan.linux@gmail.com, Vikas Sajjan <vikas.sajjan@samsung.com>

Adds PMU and S2R support for exynos5420.

rebased on
1] kgene tree for-next branch 
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
2] and Pankaj's V3 patchset https://lkml.org/lkml/2014/5/2/612

changes since v2:
	- Addressed comments from Tomasz figa
	- rebased on Pankaj's V3 patchset https://lkml.org/lkml/2014/5/2/612
	- dropped patch "ARM: dts: Add node for GPIO keys on SMDK5420",
	  will be sent separately.

changes since v1:
	- Addressed comments from Tomasz figa.
	- restructured/consolidated as per Tomasz figa's PM consolidations for exynos 

Tested on peach-pit board on top of shaik ameer basha's CLK v3 patchset
http://www.spinics.net/lists/arm-kernel/msg325313.html 

Vikas Sajjan (3):
  ARM: EXYNOS5: PMU support for 5420
  ARM: EXYNOS5: Add Suspend-to-RAM support for 5420
  CLK: EXYNOS: Add clk save/restore registers for 5420

 arch/arm/mach-exynos/common.h        |    9 +
 arch/arm/mach-exynos/exynos.c        |    1 +
 arch/arm/mach-exynos/pm.c            |  163 +++++++++++++++--
 arch/arm/mach-exynos/pmu.c           |  325 ++++++++++++++++++++++++++++++++++
 arch/arm/mach-exynos/regs-pmu.h      |  233 ++++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos5420.c |   30 ++++
 6 files changed, 742 insertions(+), 19 deletions(-)

-- 
1.7.9.5
