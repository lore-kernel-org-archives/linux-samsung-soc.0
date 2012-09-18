From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 0/3] Add device tree based discovery support for drm-fimd
Date: Tue, 18 Sep 2012 23:52:08 +0530
Message-ID: <1347992531-27279-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20978 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932954Ab2IRMXX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Sep 2012 08:23:23 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAJ00JWKP2L0J80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 21:23:22 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAJ004DPP1JBZB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 21:23:21 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, jg1.han@samsung.com

This patch set adds arch side support for device tree based discovery
for drm-fimd.

The patches are created against "for-next" branch of Kukjin Kim's tree on 3.6-rc6 at:
 git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

This patchset has been tested on smdk5250 board and seen the bootup logo on LCD
using the patchset http://www.spinics.net/lists/arm-kernel/msg193348.html which was 
applied on inki-dae's next branch

Leela Krishna Amudala (3):
  ARM: EXYNOS5: Add fimd node to the exynos5250 dtsi file
  ARM: EXYNOS: add device tree based discovery support for FIMD
  ARM: EXYNOS: Add drm-device node to the dtsi file

 arch/arm/boot/dts/exynos5250-smdk5250.dts |   16 ++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   11 +++++++++++
 arch/arm/mach-exynos/include/mach/map.h   |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c    |    2 ++
 4 files changed, 30 insertions(+), 0 deletions(-)
