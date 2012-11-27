From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH 2/3] arm: exynos5: Enable PM generic domain support in Kconfig
Date: Tue, 27 Nov 2012 17:52:36 +0530
Message-ID: <1354018957-17752-3-git-send-email-prasanna.ps@samsung.com>
References: <1354018957-17752-1-git-send-email-prasanna.ps@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30472 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752728Ab2K0MAv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 07:00:51 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME500G8MAO2XQK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 21:00:49 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME500EEJAMW32A0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 21:00:49 +0900 (KST)
In-reply-to: <1354018957-17752-1-git-send-email-prasanna.ps@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

From: Prasanna Kumar <prasanna.ps@samsung.com>

This patch adds support to enable PM generic domains
under Exynos5 family

Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
---
 arch/arm/mach-exynos/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 945ce49..c07a29c 100644
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
1.7.0.4
