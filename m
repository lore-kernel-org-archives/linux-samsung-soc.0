From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 0/3] Add FIMD DT support for Exynos5 DT Machines
Date: Tue, 26 Feb 2013 06:25:37 -0500
Message-ID: <1361877940-8559-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:21729 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753754Ab3BZLFS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 06:05:18 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MIT00JT7QSSJF00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Feb 2013 20:05:16 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

This patch series adds support for FIMD DT for Exynos5 DT Machines
Adds display timing node for smdk5250 board.

This series is rebased on branch
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;a=shortlog;h=refs/heads/for-next



Leela Krishna Amudala (3):
  ARM: dts: Add FIMD node to exynos5
  ARM: dts: Add display timing node to exynos5250-smdk5250.dts
  ARM: Exynos5: add FIMD AUXDATA entry for exynos5 DT

 arch/arm/boot/dts/exynos5250-smdk5250.dts | 16 ++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |  7 +++++++
 arch/arm/mach-exynos/include/mach/map.h   |  1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c    |  2 ++
 4 files changed, 26 insertions(+)

-- 
1.8.0
