From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 0/3] ARM: Exynos5: Add support for MSHC controller
Date: Sun, 26 Aug 2012 17:29:28 +0530
Message-ID: <1345982371-26483-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:22871 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751471Ab2HZLl0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 26 Aug 2012 07:41:26 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9D0080D1T02H10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 26 Aug 2012 20:41:25 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9D00JEH1SVN450@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 26 Aug 2012 20:41:25 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, cjb@laptop.org, kgene.kim@samsung.com, girish.shivananjappa@linaro.org, jh80.chung@samsung.com, tgih.jun@samsung.com, patches@linaro.org

This patch series adds Exynos5250 platform support for MSHC controllers.

Thomas Abraham (3):
  ARM: Samsung: Add support for MSHC controller clocks
  ARM: Exynos5: Add AUXDATA support for MSHC controllers
  ARM: dts: Add nodes for dw_mmc controllers for Samsung Exynos5250 platforms

 arch/arm/boot/dts/exynos5250-smdk5250.dts |   57 ++++++++++++++++++++++++++++-
 arch/arm/boot/dts/exynos5250.dtsi         |   32 ++++++++++++++++
 arch/arm/mach-exynos/clock-exynos5.c      |   45 ++++++++---------------
 arch/arm/mach-exynos/include/mach/map.h   |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c    |    8 ++++
 5 files changed, 113 insertions(+), 30 deletions(-)
