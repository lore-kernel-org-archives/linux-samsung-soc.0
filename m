From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH] ARM: S5PV210: Fix build error on pm debug
Date: Thu,  7 Oct 2010 14:41:36 +0900
Message-ID: <1286430096-23111-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39454 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754396Ab0JGFtn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 01:49:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Sangbeom Kim <sbkim73@samsung.com>

    This patch fixes build error by S3C2410 PM
    Suspend debug option due to undefined address

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5pv210/include/mach/map.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index bd9afd5..9f2bee2 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -57,6 +57,8 @@
 
 #define S5P_SZ_UART		SZ_256
 
+#define S3C_VA_UARTx(x)		(S3C_VA_UART + ((x) * S3C_UART_OFFSET))
+
 #define S5PV210_PA_SROMC	(0xE8000000)
 
 #define S5PV210_PA_CFCON	(0xE8200000)
-- 
1.6.2.5
