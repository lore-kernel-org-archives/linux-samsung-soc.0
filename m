From: Boojin Kim <boojin.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Configure ARM_NR_BANKS for EXYNOS SoC
Date: Wed, 08 Feb 2012 10:25:13 +0900
Message-ID: <003201cce600$81c8f100$855ad300$%kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9494 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756613Ab2BHBZQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Feb 2012 20:25:16 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ100EZRVWZFBB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Feb 2012 10:25:14 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.119.77])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ100K78VY1Y730@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 08 Feb 2012 10:25:13 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Russell King' <linux@arm.linux.org.uk>, 'Boojin Kim' <boojin.kim@samsung.com>

This patch increases the number of bank for EXYNOS4 and EXYNOS5
to support bigger than 2GB memory on it.

Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
---
 arch/arm/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f9d7c47..d646810 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1134,7 +1134,7 @@ source arch/arm/mm/Kconfig

 config ARM_NR_BANKS
 	int
-	default 16 if ARCH_EP93XX
+	default 16 if ARCH_EP93XX || ARCH_EXYNOS4 || ARCH_EXYNOS5
 	default 8

 config IWMMXT
--
1.7.1
