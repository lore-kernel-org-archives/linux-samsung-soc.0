From: Boojin Kim <boojin.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Configure ARM_NR_BANKS for EXYNOS4
Date: Tue, 13 Dec 2011 08:55:06 +0900
Message-ID: <1323734106-26673-1-git-send-email-boojin.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:54819 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750742Ab1LOFBl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Dec 2011 00:01:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Boojin Kim <boojin.kim@samsung.com>

This patch increases the number of bank for EXYNOS4 to support bigger than
2GB memory on it.

Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
---
 arch/arm/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 928cbcc..5c90dee 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1127,7 +1127,7 @@ source arch/arm/mm/Kconfig
 
 config ARM_NR_BANKS
 	int
-	default 16 if ARCH_EP93XX
+	default 16 if ARCH_EP93XX || ARCH_EXYNOS4
 	default 8
 
 config IWMMXT
-- 
1.7.1
