From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2 0/3] Add FIMD DT support for Exynos5 DT Machines
Date: Wed, 27 Feb 2013 04:40:44 -0500
Message-ID: <1361958047-21994-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28882 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754981Ab3B0JUP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 04:20:15 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MIV00H5VGLMHRV0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Feb 2013 18:20:13 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

This patch series adds support for FIMD DT for Exynos5 DT Machines
Adds display timing node for smdk5250 board.

changes since v1:
        - modified compatible string for exynos5 fimd as "exynos5250-fimd"

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
