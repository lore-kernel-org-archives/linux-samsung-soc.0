From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: MM: use 64bytes of L1 cache on plat S5PC1xx
Date: Tue, 17 Nov 2009 08:47:54 +0100
Message-ID: <1258444074-20679-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39416 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754053AbZKQHs3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2009 02:48:29 -0500
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KT800KBPTOXGP@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Nov 2009 07:48:34 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KT8005FDTOXBR@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Nov 2009 07:48:33 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux@arm.linux.org.uk, m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

From: Kyungmin Park <kyungmin.park@samsung.com>

Samsung S5PC1xx SoCs are Coretex8 based, so use 64 bytes of L1 cache
line instead of the default 32 bytes.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mm/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 9264d81..7b7d4c3 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -774,5 +774,5 @@ config CACHE_XSC3L2
 
 config ARM_L1_CACHE_SHIFT
 	int
-	default 6 if ARCH_OMAP3
+	default 6 if ARCH_OMAP3 || ARCH_S5PC1XX
 	default 5
-- 
1.6.4
