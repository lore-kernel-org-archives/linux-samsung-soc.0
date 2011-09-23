From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 2/7] ARM: SAMSUNG: Add CLK Macro for clkdev support
Date: Fri, 23 Sep 2011 17:23:42 +0530
Message-ID: <1316778827-24694-3-git-send-email-padma.v@samsung.com>
References: <1316778827-24694-1-git-send-email-padma.v@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31018 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752240Ab1IWLr3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Sep 2011 07:47:29 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRZ00D644R03AG0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Sep 2011 20:47:28 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRZ009KD4QTUT@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Sep 2011 20:47:28 +0900 (KST)
In-reply-to: <1316778827-24694-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: grant.likely@secretlab.ca, jassisinghbrar@gmail.com, ben-linux@fluff.org, kgene.kim@samsung.com, s.nawrocki@samsung.com

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/plat-samsung/include/plat/clock.h |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
index 73c66d4..c864825 100644
--- a/arch/arm/plat-samsung/include/plat/clock.h
+++ b/arch/arm/plat-samsung/include/plat/clock.h
@@ -17,6 +17,13 @@
 
 struct clk;
 
+#define CLK(dev, con, ck)	\
+	{			\
+		.dev_id = dev,	\
+		.con_id = con,	\
+		.clk = ck,	\
+	}
+
 /**
  * struct clk_ops - standard clock operations
  * @set_rate: set the clock rate, see clk_set_rate().
-- 
1.7.4.4
