From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH v5 6/6] arm: exynos: Select SOC_SAMSUNG config option
Date: Sat, 29 Nov 2014 19:45:08 +0530
Message-ID: <1417270508-11174-7-git-send-email-amit.daniel@samsung.com>
References: <1417270508-11174-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37728 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751205AbaK2OVy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 29 Nov 2014 09:21:54 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFT0027818G5S00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 29 Nov 2014 23:21:52 +0900 (KST)
In-reply-to: <1417270508-11174-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, b.zolnierkie@samsung.com, pankaj.dubey@samsung.com, Amit Daniel Kachhap <amit.daniel@samsung.com>

The config option SOC_SAMSUNG is needed to enable all soc samsung
drivers inside driver/soc/samsung folder. Currently, this will be useful to
enable exynos pmu driver which is moved to that folder.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 arch/arm/mach-exynos/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index b9e3f1c..17880b6 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -25,6 +25,7 @@ menuconfig ARCH_EXYNOS
 	select S5P_DEV_MFC
 	select SRAM
 	select MFD_SYSCON
+	select SOC_SAMSUNG
 	help
 	  Support for SAMSUNG EXYNOS SoCs (EXYNOS4/5)
 
-- 
1.7.9.5
