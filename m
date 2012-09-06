From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH 2/2] ARM: SAMSUNG: Add check for NULL in clock interface
Date: Thu,  6 Sep 2012 19:55:34 +0530
Message-ID: <1346941534-4501-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:53206 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756078Ab2IFO0H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 10:26:07 -0400
Received: by pbbrr13 with SMTP id rr13so2577541pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Sep 2012 07:26:06 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

The clock instance parameter in Samsung clock interface is not being checked
for NULL pointers. Add checks for NULL pointers.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
---
 arch/arm/plat-samsung/clock.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 65c5eca..7938fbc 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -119,7 +119,7 @@ void clk_disable(struct clk *clk)
 
 unsigned long clk_get_rate(struct clk *clk)
 {
-	if (IS_ERR(clk))
+	if (IS_ERR_OR_NULL(clk))
 		return 0;
 
 	if (clk->rate != 0)
@@ -136,7 +136,7 @@ unsigned long clk_get_rate(struct clk *clk)
 
 long clk_round_rate(struct clk *clk, unsigned long rate)
 {
-	if (!IS_ERR(clk) && clk->ops && clk->ops->round_rate)
+	if (!IS_ERR_OR_NULL(clk) && clk->ops && clk->ops->round_rate)
 		return (clk->ops->round_rate)(clk, rate);
 
 	return rate;
@@ -146,7 +146,7 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
 {
 	int ret;
 
-	if (IS_ERR(clk))
+	if (IS_ERR_OR_NULL(clk))
 		return -EINVAL;
 
 	/* We do not default just do a clk->rate = rate as
@@ -175,7 +175,7 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 {
 	int ret = 0;
 
-	if (IS_ERR(clk))
+	if (IS_ERR_OR_NULL(clk) || IS_ERR_OR_NULL(parent))
 		return -EINVAL;
 
 	spin_lock(&clocks_lock);
-- 
1.7.9.5
