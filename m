From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2 0/3] Add device tree based discovery support for drm-fimd
Date: Fri, 21 Sep 2012 18:29:54 +0530
Message-ID: <1348232397-2477-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34085 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132Ab2IUGgN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Sep 2012 02:36:13 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAO00E9VT0523L0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Sep 2012 15:36:12 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAO00G6VT02A030@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Sep 2012 15:36:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, jg1.han@samsung.com, thomas.abraham@linaro.org

This patch set adds arch side support for device tree based discovery
for drm-fimd.

The patches are created against "for-next" branch of Kukjin Kim's tree on 3.6-rc6 at:
 git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

This patchset has been tested on smdk5250 board and seen the bootup logo on LCD
using the patchset http://www.spinics.net/lists/arm-kernel/msg193348.html which was 
applied on inki-dae's next branch

Changes since V1:
	- Renamed the compatible string from "samsung,exynos5-drm" to "samsung,exynos5-fimd"
	- Renamed the macro from EXYNOS5_PA_FIMD to EXYNOS5_PA_FIMD1

Leela Krishna Amudala (3):
  ARM: EXYNOS5: Add fimd node to the exynos5250 dtsi file
  ARM: EXYNOS: add device tree based discovery support for FIMD
  ARM: EXYNOS: Add drm-device node to the dtsi file

 arch/arm/boot/dts/exynos5250-smdk5250.dts |   15 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   11 +++++++++++
 arch/arm/mach-exynos/include/mach/map.h   |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c    |    2 ++
 4 files changed, 29 insertions(+), 0 deletions(-)
