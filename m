From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH] ARM: S5PC100: Fix for compilation error
Date: Mon, 04 Jul 2011 13:41:52 -0400
Message-ID: <1309801312-27377-1-git-send-email-padma.v@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39247 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751340Ab1GDLyM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 07:54:12 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNT00BB3526YAX0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 20:54:10 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNT00428525ES@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 20:54:10 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: padmavathi venna <padma.v@samsung.com>

From: padmavathi venna <padma.v@samsung.com>

S5PC100 Compilation fails without this patch

Signed-off-by: padmavathi venna <padma.v@samsung.com>
---
 arch/arm/mach-s5pc100/dev-spi.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pc100/dev-spi.c b/arch/arm/mach-s5pc100/dev-spi.c
index 2b58c9a..e5d6c4d 100644
--- a/arch/arm/mach-s5pc100/dev-spi.c
+++ b/arch/arm/mach-s5pc100/dev-spi.c
@@ -15,6 +15,7 @@
 #include <mach/dma.h>
 #include <mach/map.h>
 #include <mach/spi-clocks.h>
+#include <mach/irqs.h>
 
 #include <plat/s3c64xx-spi.h>
 #include <plat/gpio-cfg.h>
-- 
1.7.0.4
