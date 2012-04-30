From: "HeungJun, Kim" <riverful.kim@samsung.com>
Subject: ARM: Exynos4: NURI: Remove redundant S5P_SETUP_MIPIPHY configuration
Date: Mon, 30 Apr 2012 20:24:41 +0900
Message-ID: <1335785081-5398-1-git-send-email-riverful.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43784 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751696Ab2D3LYl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Apr 2012 07:24:41 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3A00JUXID4W600@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Apr 2012 20:24:40 +0900 (KST)
Received: from riverful-ubuntu.165.213.246.161 ([165.213.219.119])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M3A005MIID46A60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Apr 2012 20:24:40 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, "HeungJun, Kim" <riverful.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

From: "HeungJun, Kim" <riverful.kim@samsung.com>

Signed-off-by: HeungJun, Kim <riverful.kim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index eb35b8a..0f9bbca 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -297,7 +297,6 @@ config MACH_NURI
 	select S5P_DEV_G2D
 	select S5P_DEV_MFC
 	select S5P_DEV_USB_EHCI
-	select S5P_SETUP_MIPIPHY
 	select S3C_DEV_USB_HSOTG
 	select EXYNOS4_DEV_DMA
 	select EXYNOS_DEV_DRM
-- 
1.7.5.4
