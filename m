From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: SAMSUNG: Fix bad use of __initdata for s3c_register_clocks()
Date: Mon, 25 Jan 2010 01:57:19 +0000
Message-ID: <1264384641-8211-2-git-send-email-ben-linux@fluff.org>
References: <1264384641-8211-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:39227 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932102Ab0AYB5Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jan 2010 20:57:25 -0500
In-Reply-To: <1264384641-8211-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ben Dooks <ben-linux@fluff.org>

Functions should be marked __init, not __initdata.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-samsung/clock.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 0c746ae..e9cdbe4 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -344,7 +344,7 @@ int s3c24xx_register_clocks(struct clk **clks, int nr_clks)
  * Call s3c24xx_register_clock() on the @clkp array given, printing an
  * error if it fails to register the clock (unlikely).
  */
-void __initdata s3c_register_clocks(struct clk *clkp, int nr_clks)
+void __init s3c_register_clocks(struct clk *clkp, int nr_clks)
 {
 	int ret;
 
-- 
1.6.0.4
