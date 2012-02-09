From: Boojin Kim <boojin.kim@samsung.com>
Subject: [PATCHv2] ARM: EXYNOS: Config ARM_NR_BANKS for EXYNOS SoC
Date: Thu, 09 Feb 2012 09:51:11 +0900
Message-ID: <000301cce6c4$eb2c9dd0$c185d970$%kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44181 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756727Ab2BIAvN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Feb 2012 19:51:13 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ3000LWP126U60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 09:51:12 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.119.77])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ3000F3P1BTU50@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 09:51:12 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Boojin Kim' <boojin.kim@samsung.com>

This patch increases the number of banks for EXYNOS4 and EXYNOS5 to
support bigger than 2GB memory on it.

Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
---
 arch/arm/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f9d7c47..877dd61 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1134,7 +1134,7 @@ source arch/arm/mm/Kconfig

 config ARM_NR_BANKS
 	int
-	default 16 if ARCH_EP93XX
+	default 16 if ARCH_EP93XX || ARCH_EXYNOS
 	default 8

 config IWMMXT
--
1.7.1
