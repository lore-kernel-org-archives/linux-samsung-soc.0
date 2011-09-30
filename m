From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 1/2] ARM: CLKDEV: Add Common Macro for clk_lookup
Date: Fri, 30 Sep 2011 16:41:36 +0530
Message-ID: <1317381097-2691-2-git-send-email-padma.v@samsung.com>
References: <1317381097-2691-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50848 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755517Ab1I3LGN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Sep 2011 07:06:13 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSC003801HR2OA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Sep 2011 20:06:01 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LSC00MDT1HMAOO1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Sep 2011 20:06:00 +0900 (KST)
In-reply-to: <1317381097-2691-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, kgene.kim@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: khilman@ti.com, nsekhar@ti.com, hsweeten@visionengravers.com, rmallon@gmail.com, s.hauer@pengutronix.de, u.kleine-koenig@pengutronix.de, plagnioj@jcrosoft.com, amit.kucheria@canonical.com, kernel@pengutronix.de, hjk@hansjkoch.de, linux@arm.linux.org.uk

Added a standardized macro CLKDEV_INIT which can used across all
the platforms to support clkdev

Suggested by: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 include/linux/clkdev.h |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/include/linux/clkdev.h b/include/linux/clkdev.h
index 457bcb0..f2db158 100644
--- a/include/linux/clkdev.h
+++ b/include/linux/clkdev.h
@@ -14,6 +14,13 @@
 
 #include <asm/clkdev.h>
 
+#define CLKDEV_INIT(d, n, c) \
+	{ \
+		.dev_id = d, \
+		.con_id = n, \
+		.clk = &c, \
+	},
+
 struct clk;
 struct device;
 
-- 
1.7.4.4
