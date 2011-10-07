From: Rajeshwari Shinde <rajeshwari.s@samsung.com>
Subject: [PATCH V2 1/2] ARM: CLKDEV: Add Common Macro for clk_lookup
Date: Fri, 07 Oct 2011 15:23:30 +0530
Message-ID: <1317981211-15745-2-git-send-email-rajeshwari.s@samsung.com>
References: <1317981211-15745-1-git-send-email-rajeshwari.s@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46186 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965051Ab1JGJ52 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Oct 2011 05:57:28 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSO00B8RWZKJ310@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Oct 2011 18:57:27 +0900 (KST)
Received: from rajeshwari-linux.sisodomain.com ([107.108.215.115])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LSO00E5NWZHO450@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Oct 2011 18:57:27 +0900 (KST)
In-reply-to: <1317981211-15745-1-git-send-email-rajeshwari.s@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: khilman@ti.com, nsekhar@ti.com, hsweeten@visionengravers.com, rmallon@gmail.com, s.hauer@pengutronix.de, u.kleine-koenig@pengutronix.de, plagnioj@jcrosoft.com, amit.kucheria@canonical.com, kernel@pengutronix.de, hjk@hansjkoch.de, linux@arm.linux.org.uk, rajeshwari.s@samsung.com

Added a standardized macro CLKDEV_INIT which can used across all
the platforms to support clkdev

Suggested-by: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Signed-off-by: Rajeshwari Shinde <rajeshwari.s@samsung.com>
Acked-by: H Hartley Sweeten <hsweeten@visionengravers.com>
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
