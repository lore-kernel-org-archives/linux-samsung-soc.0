From: Hatim Ali <hatim.rv@samsung.com>
Subject: [PATCH 0/2] Add TVOUT support for SMDKV310
Date: Fri, 26 Aug 2011 12:09:05 +0530
Message-ID: <1314340747-13816-1-git-send-email-hatim.rv@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57893 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751357Ab1HZGjt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Aug 2011 02:39:49 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQI00IQUVT2IAE0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Aug 2011 15:39:47 +0900 (KST)
Received: from hatim-linux.sisodomain.com ([107.108.73.95])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQI000VMVTXBB@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Aug 2011 15:39:47 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, t.stanislaws@samsung.com, banajit.g@samsung.com

This patchset adds TVOUT support for SMDKV310 board.

These patches are based on Tomasz Stanislawski's patchset
"Updated s5p-tv platform definitions"
(http://www.spinics.net/lists/linux-samsung-soc/msg06138.html)
and "add support for HDMIPHY dedicated controller"
(http://www.spinics.net/lists/linux-i2c/msg05932.html)
on for-next branch of kgene's tree
(git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git)

The TVOUT driver has a dependency on PM_RUNTIME. So you need to
enable the PM_RUNTIME support in "Power Management" option in
menuconfig.

These patches have been tested for 720x480 and 1280x720 resolutions
on SMDKV310 EVT1.

The SDO functionality has not been tested because it has a
dependency on PMIC support. Once PMIC support is added,
SDO can also be tested.

NOTE: Patch 2 is for testing TVOUT driver on SMDKV310 till CMA
support gets merged.

Hatim Ali (2):
  ARM: EXYNOS4: Add TVOUT support for SMDKV310
  ARM: EXYNOS4: Update consistent DMA size to 8MB

 arch/arm/mach-exynos4/Kconfig               |    2 ++
 arch/arm/mach-exynos4/include/mach/memory.h |    1 +
 arch/arm/mach-exynos4/mach-smdkv310.c       |    5 +++++
 3 files changed, 8 insertions(+), 0 deletions(-)

--
1.7.2.3
