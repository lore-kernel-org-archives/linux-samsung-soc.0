From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 05/15] pinctrl: samsung: Distinguish between pin group and bank
 nodes
Date: Thu, 11 Oct 2012 10:11:11 +0200
Message-ID: <1349943081-27939-6-git-send-email-t.figa@samsung.com>
References: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56844 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757931Ab2JKIL5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 04:11:57 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBP00EIPYR2YEI0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 17:11:56 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBP005FVYR04E50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 17:11:56 +0900 (KST)
In-reply-to: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, tony@atomide.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch modifies the loop iterating over all child nodes and parsing
pin groups to check whether the node is really a pin group node by
checking for existence of samsung,pins property.

This is a prerequisite for further patches adding additional subnodes to
the pinctrl node, required for per bank GPIO and interrupt specifiers.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index f219bb6..94e1378 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -609,7 +609,7 @@ static int __init samsung_pinctrl_parse_dt(struct platform_device *pdev,
 	 */
 	for_each_child_of_node(dev_np, cfg_np) {
 		u32 function;
-		if (of_find_property(cfg_np, "interrupt-controller", NULL))
+		if (!of_find_property(cfg_np, "samsung,pins", NULL))
 			continue;
 
 		ret = samsung_pinctrl_parse_dt_pins(pdev, cfg_np,
-- 
1.7.12
