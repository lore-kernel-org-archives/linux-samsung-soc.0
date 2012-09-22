From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v4] Add MFC device tree support
Date: Sat, 22 Sep 2012 23:37:16 +0530
Message-ID: <1348337237-15426-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:8630 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753830Ab2IVLcw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Sep 2012 07:32:52 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAR00EN01EQ7VB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Sep 2012 20:32:50 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAR001KW1EL9H70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Sep 2012 20:32:50 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, thomas.abraham@linaro.org, k.lewandowsk@samsung.com, s.nawrocki@samsung.com, ch.naveen@samsung.com, arun.kk@samsung.com, joshi@samsung.com

This patch adds the device tree entries for MFC on Exynos5.
This is rebased to the linux-samsung for-next branch.

Changelog v4
- Addressed review comments from Karol Lewandowski
http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/12703

Changelog v3
- Addressed review comments given by Sylwester Nawrocki
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg12340.html

Changelog v2
- Use fdt functions to parse dtsi file for mfc memory info

Changelog v1
- Moved board specific DT information to different dtsi file
- Changed compatible name for the device
- Addressed other review comments

Arun Kumar K (1):
  ARM: EXYNOS: Add MFC device tree support

 .../devicetree/bindings/media/s5p-mfc.txt          |   27 ++++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    7 ++++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 +++
 arch/arm/mach-exynos/Kconfig                       |    1 +
 arch/arm/mach-exynos/clock-exynos5.c               |    2 +-
 arch/arm/mach-exynos/common.c                      |   37 ++++++++++++++++++++
 arch/arm/mach-exynos/common.h                      |   10 +++++
 arch/arm/mach-exynos/mach-exynos5-dt.c             |   16 ++++++++
 8 files changed, 105 insertions(+), 1 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt
