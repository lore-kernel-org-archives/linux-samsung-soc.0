From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH v2 2/3] arm: exynos5: Enable PM generic domain support in
 Kconfig
Date: Thu, 20 Dec 2012 17:56:17 +0530
Message-ID: <1356006378-17441-3-git-send-email-prasanna.ps@samsung.com>
References: <CAPmaG0uqkRcoUBR8Gjv_+BSJ3hwxUCz0G-YKNQX=qvx83i6QOQ@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11663 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752491Ab2LTMGA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 07:06:00 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFB0019KW9UJCY0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Dec 2012 21:05:58 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFB00BM9W63ML00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Dec 2012 21:05:58 +0900 (KST)
In-reply-to: <CAPmaG0uqkRcoUBR8Gjv_+BSJ3hwxUCz0G-YKNQX=qvx83i6QOQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org

This patch adds support to enable PM generic domains
under Exynos5 family

Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
---
 This patch is same as v1
 arch/arm/mach-exynos/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 91d5b6f..1c77f17 100644
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
