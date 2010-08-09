From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/4] ARM: S5PV210: Override FIMC driver name on Aquila board
Date: Mon, 09 Aug 2010 09:51:55 +0200
Message-ID: <1281340315-26676-5-git-send-email-m.szyprowski@samsung.com>
References: <1281340315-26676-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:29767 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755627Ab0HIHwB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Aug 2010 03:52:01 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L6V001BCKIL4D40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Aug 2010 08:51:58 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L6V002CWKILPO@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Aug 2010 08:51:57 +0100 (BST)
In-reply-to: <1281340315-26676-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com, p.osciak@samsung.com

From: Sylwester Nawrocki <s.nawrocki@samsung.com>

Change variant of the FIMC driver for compatibility with older
SoC version (EVT0) used on Aquila board.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pv210/mach-aquila.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 5c470dc..e412664 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -35,6 +35,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/fb.h>
+#include <plat/fimc-core.h>
 #include <plat/sdhci.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
@@ -503,6 +504,10 @@ static void __init aquila_machine_init(void)
 	/* SDHCI */
 	aquila_setup_sdhci();
 
+	s3c_fimc_setname(0, "s5p-fimc");
+	s3c_fimc_setname(1, "s5p-fimc");
+	s3c_fimc_setname(2, "s5p-fimc");
+
 	/* FB */
 	s3c_fb_set_platdata(&aquila_lcd_pdata);
 
-- 
1.7.1.569.g6f426
