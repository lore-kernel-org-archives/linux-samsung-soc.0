From: Ben Dooks <ben@trinity.fluff.org>
Subject: [PATCH] tmp - fix clk_def_setrate
Date: Tue, 12 Jan 2010 04:20:12 +0000
Message-ID: <1263270017-25155-4-git-send-email-ben@trinity.fluff.org>
References: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-2-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-3-git-send-email-ben@trinity.fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:40849 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753641Ab0ALEUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 23:20:22 -0500
Received: from ben by trinity.fluff.org with local (Exim 4.69)
	(envelope-from <ben@trinity.fluff.org>)
	id 1NUYEr-0006a0-Hu
	for linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 04:20:17 +0000
In-Reply-To: <1263270017-25155-3-git-send-email-ben@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

From: Ben Dooks <ben-linux@fluff.org>

---
 arch/arm/plat-s5pc1xx/clock.c |   14 ++------------
 1 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm/plat-s5pc1xx/clock.c b/arch/arm/plat-s5pc1xx/clock.c
index 0aff16d..aec0305 100644
--- a/arch/arm/plat-s5pc1xx/clock.c
+++ b/arch/arm/plat-s5pc1xx/clock.c
@@ -64,16 +64,6 @@ struct clk clk_54m = {
 	.rate		= 54000000,
 };
 
-static int clk_default_setrate(struct clk *clk, unsigned long rate)
-{
-	clk->rate = rate;
-	return 0;
-}
-
-static struct clk_ops clk_ops_default_setrate = {
-	.set_rate	= clk_default_setrate,
-};
-
 static int clk_dummy_enable(struct clk *clk, int enable)
 {
 	return 0;
@@ -86,7 +76,7 @@ struct clk clk_hd0 = {
 	.parent		= NULL,
 	.ctrlbit	= 0,
 	.enable		= clk_dummy_enable,
-	.ops		= &clk_ops_default_setrate,
+	.ops		= &clk_ops_def_setrate,
 };
 
 struct clk clk_pd0 = {
@@ -95,7 +85,7 @@ struct clk clk_pd0 = {
 	.rate		= 0,
 	.parent		= NULL,
 	.ctrlbit	= 0,
-	.ops		= &clk_ops_default_setrate,
+	.ops		= &clk_ops_def_setrate,
 	.enable		= clk_dummy_enable,
 };
 
-- 
1.6.0.4
