From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH] ARM: S5P: fix bug in spdif_clk_get_rate
Date: Fri, 19 Aug 2011 16:56:55 +0530
Message-ID: <1313753215-29173-1-git-send-email-ch.naveen@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:29122 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752800Ab1HSLcz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 07:32:55 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ600BT3AQH8360@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 20:32:53 +0900 (KST)
Received: from Hawshines.sisodomain.com ([107.108.83.161])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ600IEBAPSRS@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 20:32:54 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, jassisinghbrar@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Should be passing the parent clk object when
calling for parent rate.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
 arch/arm/plat-s5p/clock.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-s5p/clock.c b/arch/arm/plat-s5p/clock.c
index 02af235..5f84a3f 100644
--- a/arch/arm/plat-s5p/clock.c
+++ b/arch/arm/plat-s5p/clock.c
@@ -192,7 +192,7 @@ unsigned long s5p_spdif_get_rate(struct clk *clk)
 	if (IS_ERR(pclk))
 		return -EINVAL;
 
-	rate = pclk->ops->get_rate(clk);
+	rate = pclk->ops->get_rate(pclk);
 	clk_put(pclk);
 
 	return rate;
-- 
1.7.2.3
