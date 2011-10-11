From: Padmavathi Venna <padma.v@samsung.com>
Subject: [RESEND][PATCH V2 1/2] ARM: CLKDEV: Add Common Macro for clk_lookup
Date: Tue, 11 Oct 2011 17:15:29 +0530
Message-ID: <1318333530-7023-2-git-send-email-padma.v@samsung.com>
References: <1318333530-7023-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30814 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750756Ab1JKLk4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 07:40:56 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSW00E96GG72ZU0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Oct 2011 20:40:55 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LSW00C76GFL9D00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Oct 2011 20:40:54 +0900 (KST)
In-reply-to: <1318333530-7023-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, kgene.kim@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: khilman@ti.com, nsekhar@ti.com, hsweeten@visionengravers.com, rmallon@gmail.com, s.hauer@pengutronix.de, u.kleine-koenig@pengutronix.de, plagnioj@jcrosoft.com, amit.kucheria@canonical.com, kernel@pengutronix.de, hjk@hansjkoch.de, linux@arm.linux.org.uk

From: Padmavathi Venna <padma.v@samsung.com> 

Added a standardized macro CLKDEV_INIT which can used across all
the platforms to support clkdev

Suggested by: Russell King <rmk+kernel@arm.linux.org.uk>
Acked-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Signed-off-by: Rajeshwari Shinde <rajeshwari.s@samsung.com>
---
 include/linux/clkdev.h |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/include/linux/clkdev.h b/include/linux/clkdev.h
index 457bcb0..34c9918 100644
--- a/include/linux/clkdev.h
+++ b/include/linux/clkdev.h
@@ -24,6 +24,13 @@ struct clk_lookup {
 	struct clk		*clk;
 };
 
+#define CLKDEV_INIT(d, n, c)	\
+	{	\
+		.dev_id = d,	\
+		.con_id = n,	\
+		.clk = c,	\
+	}
+
 struct clk_lookup *clkdev_alloc(struct clk *clk, const char *con_id,
 	const char *dev_fmt, ...);
 
-- 
1.7.4.4
