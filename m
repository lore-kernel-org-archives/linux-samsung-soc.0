From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v3] Add MFC device tree support
Date: Fri, 14 Sep 2012 21:08:16 +0530
Message-ID: <1347637097-15015-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40129 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758497Ab2INKPd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Sep 2012 06:15:33 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAC00EXU4H7LF40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Sep 2012 19:15:31 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAC00ARO4G9R9A0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Sep 2012 19:15:31 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, thomas.abraham@linaro.org, k.lewandowsk@samsung.com, s.nawrocki@samsung.com, ch.naveen@samsung.com, arun.kk@samsung.com, joshi@samsung.com

This patch adds the device tree entries for MFC on Exynos5.
This is rebased to the linux-samsung for-next branch.

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

 .../devicetree/bindings/media/s5p-mfc.txt          |   27 ++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    7 +++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++
 arch/arm/mach-exynos/Kconfig                       |    1 +
 arch/arm/mach-exynos/clock-exynos5.c               |    2 +-
 arch/arm/mach-exynos/mach-exynos5-dt.c             |   55 ++++++++++++++++++++
 6 files changed, 97 insertions(+), 1 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt
