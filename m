From: Boojin Kim <boojin.kim@samsung.com>
Subject: [PATCH] ARM: S5PV310: Fix physical address of System Controller Register
Date: Thu, 16 Sep 2010 11:17:03 +0900
Message-ID: <1284603423-12139-1-git-send-email-boojin.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:43508 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753217Ab0IPCdm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Sep 2010 22:33:42 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, Boojin Kim <boojin.kim@samsung.com>

The physical address of SYSCON(System Controller) is wrong.
This patch fixs this wrong physical address value from 0x10020000 to 0x10010000.

Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/map.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index d771c79..b0f98fb 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -44,7 +44,7 @@
 #define S5PV310_PA_CHIPID		(0x10000000)
 #define S5P_PA_CHIPID			S5PV310_PA_CHIPID
 
-#define S5PV310_PA_SYSCON		(0x10020000)
+#define S5PV310_PA_SYSCON		(0x10010000)
 #define S5P_PA_SYSCON			S5PV310_PA_SYSCON
 
 #define S5PV310_PA_CMU			(0x10030000)
-- 
1.6.3.3
