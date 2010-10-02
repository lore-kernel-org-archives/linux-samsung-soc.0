From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH] ARM: S5PV210: Fix build error on pm
Date: Sat,  2 Oct 2010 09:19:57 +0900
Message-ID: <1285978797-7964-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:42524 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753272Ab0JBAhN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 20:37:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Sangbeom Kim <sbkim73@samsung.com>

This patch fixes build error by S3C2410 PM
Suspend debug option due to undefined address

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5pv210/include/mach/map.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index bd9afd5..9722042 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -57,6 +57,9 @@
 
 #define S5P_SZ_UART		SZ_256
 
+#define S3C_VA_UARTx(x)		(S3C_VA_UART + (S3C_PA_UART & 0xfffff) \
+				+ ((x) * S3C_UART_OFFSET))
+
 #define S5PV210_PA_SROMC	(0xE8000000)
 
 #define S5PV210_PA_CFCON	(0xE8200000)
-- 
1.6.2.5
