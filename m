From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Set clock parent if provided
Date: Thu,  7 Mar 2013 11:01:41 +0530
Message-ID: <1362634301-9706-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:58971 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750800Ab3CGFcH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 00:32:07 -0500
Received: by mail-pb0-f43.google.com with SMTP id md12so89058pbc.30
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Mar 2013 21:32:07 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, shaik.samsung@gmail.com

s3c_set_clksrc() updates the clock source as per u-boot settings.
This patch adds the functionality to overwrite u-boot settings,
if user provides the clock parent field. In case of wrong source
provided by the user, it will retain the u-boot settings.

Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 arch/arm/plat-samsung/clock-clksrc.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
index 786a410..4fecd80 100644
--- a/arch/arm/plat-samsung/clock-clksrc.c
+++ b/arch/arm/plat-samsung/clock-clksrc.c
@@ -150,7 +150,12 @@ void __init_or_cpufreq s3c_set_clksrc(struct clksrc_clk *clk, bool announce)
 		return;
 	}
 
-	clk->clk.parent = srcs->sources[clksrc];
+	if (clk->clk.parent) {
+		if (s3c_setparent_clksrc(&clk->clk, clk->clk.parent))
+			clk->clk.parent = srcs->sources[clksrc];
+	} else {
+		clk->clk.parent = srcs->sources[clksrc];
+	}
 
 	if (announce)
 		printk(KERN_INFO "%s: source is %s (%d), rate is %ld\n",
-- 
1.7.9.5
