From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 5/6] ARM: S3C2443: Remove #if 0 for clk_mpll
Date: Sat, 30 Jan 2010 15:11:32 +0200
Message-ID: <1264857093-4040-6-git-send-email-ben-linux@fluff.org>
References: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [82.203.205.227] ([82.203.205.227]:45805 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752877Ab0A3NXf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jan 2010 08:23:35 -0500
In-Reply-To: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

The clk_mpll has long been moved into common clock code, remove the
code completely instead of the nasty #if 0 block.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2443/clock.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index 3fa37aa..177719c 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -95,14 +95,6 @@ static struct clk clk_mpllref = {
 	.id		= -1,
 };
 
-#if 0
-static struct clk clk_mpll = {
-	.name		= "mpll",
-	.parent		= &clk_mpllref,
-	.id		= -1,
-};
-#endif
-
 static struct clk clk_i2s_ext = {
 	.name		= "i2s-ext",
 	.id		= -1,
-- 
1.6.3.3
