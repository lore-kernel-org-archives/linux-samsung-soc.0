From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH 1/2] arm: exynos5: Enable PM generic domain support in Kconfig
Date: Wed, 09 Jan 2013 17:45:32 +0530
Message-ID: <1357733733-18769-2-git-send-email-prasanna.ps@samsung.com>
References: <1357733733-18769-1-git-send-email-prasanna.ps@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26314 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756165Ab3AIMMf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 07:12:35 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGC00F3OXWJC810@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 21:12:33 +0900 (KST)
Received: from user-ubuntu.sisodomain.com ([107.108.83.235])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGC00D24XT4IT90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 21:12:33 +0900 (KST)
In-reply-to: <1357733733-18769-1-git-send-email-prasanna.ps@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: Prasanna Kumar <prasanna.ps@samsung.com>

This patch adds support to enable PM generic domains
under Exynos5 family

Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
---
 arch/arm/mach-exynos/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index e103c29..871be97 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -63,6 +63,7 @@ config SOC_EXYNOS5250
 	depends on ARCH_EXYNOS5
 	select S5P_PM if PM
 	select S5P_SLEEP if PM
+	select PM_GENERIC_DOMAINS if PM
 	select S5P_DEV_MFC
 	select SAMSUNG_DMADEV
 	help
-- 
1.7.5.4
