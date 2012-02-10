From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH 5/6] ARM: EXYNOS: select EXYNOS4_SETUP_USB_PHY at Universal_C210
Date: Fri, 10 Feb 2012 11:35:45 +0100
Message-ID: <1328870146-20312-6-git-send-email-l.majewski@samsung.com>
References: <1328870146-20312-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:29797 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759018Ab2BJKfx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 05:35:53 -0500
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LZ600FMXARSV1@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 10:35:52 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LZ6000KLARRN0@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 10:35:52 +0000 (GMT)
In-reply-to: <1328870146-20312-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds EXYNOS4_SETUP_USB_PHY to Kconfig for C210
Universal.

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index bd4600e..47de403 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -252,6 +252,7 @@ config MACH_UNIVERSAL_C210
 	select EXYNOS4_SETUP_SDHCI
 	select EXYNOS4_SETUP_FIMC
 	select S5P_SETUP_MIPIPHY
+	select EXYNOS4_SETUP_USB_PHY
 	help
 	  Machine support for Samsung Mobile Universal S5PC210 Reference
 	  Board.
-- 
1.7.2.3
