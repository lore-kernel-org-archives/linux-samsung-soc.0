From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P6440: Add IO descriptor for ChipID block.
Date: Tue, 19 Jan 2010 11:21:39 +0900
Message-ID: <1263867699-28672-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45833 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751674Ab0ASCaL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2010 21:30:11 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds the IO descriptor for ChipID block in S5P6440.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6440/include/mach/map.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p6440/include/mach/map.h b/arch/arm/mach-s5p6440/include/mach/map.h
index b370329..dc922d6 100644
--- a/arch/arm/mach-s5p6440/include/mach/map.h
+++ b/arch/arm/mach-s5p6440/include/mach/map.h
@@ -15,6 +15,11 @@
 
 #include <plat/map-base.h>
 
+/* Chip ID */
+#define S5P6440_PA_CHIPID	(0xE0000000)
+#define S5P_PA_CHIPID		S5P6440_PA_CHIPID
+#define S5P_VA_CHIPID		S3C_ADDR(0x00700000)
+
 /* SYSCON */
 #define S5P6440_PA_SYSCON	(0xE0100000)
 #define S5P_PA_SYSCON		S5P6440_PA_SYSCON
-- 
1.6.2.5
