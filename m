From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 1/3] ARM: EXYNOS: correct header comment in Kconfig file
Date: Mon, 22 Feb 2016 15:33:14 +0530
Message-ID: <1456135396-17767-2-git-send-email-pankaj.dubey@samsung.com>
References: <1456135396-17767-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55003 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753830AbcBVKCH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Feb 2016 05:02:07 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O2Y02HSI17G7850@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Feb 2016 19:02:04 +0900 (KST)
In-reply-to: <1456135396-17767-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, daniel.lezcano@linaro.org, thomas.ab@samsung.com, linux@arm.linux.org.uk, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch corrects header comment of Kconfig file by changing EXYNOS4 to
EXYNOS.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index eb26986..71ef48f 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -5,7 +5,7 @@
 #
 # Licensed under GPLv2
 
-# Configuration options for the EXYNOS4
+# Configuration options for the EXYNOS
 
 menuconfig ARCH_EXYNOS
 	bool "Samsung EXYNOS"
-- 
2.4.5
