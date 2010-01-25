From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: SAMSUNG: Add documentation to the clock registration calls.
Date: Mon, 25 Jan 2010 01:57:20 +0000
Message-ID: <1264384641-8211-3-git-send-email-ben-linux@fluff.org>
References: <1264384641-8211-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:39228 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932131Ab0AYB5Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jan 2010 20:57:25 -0500
In-Reply-To: <1264384641-8211-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add some kerneldoc documentation to the s3c24xx_register_clock and the
s3c24xx_register_clocks() call.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-samsung/clock.c |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index e9cdbe4..4b95b39 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -307,6 +307,12 @@ struct clk s3c24xx_uclk = {
 
 /* initialise the clock system */
 
+/**
+ * s3c24xx_register_clock() - register a clock
+ * @clk: The clock to register
+ *
+ * Add the specified clock to the list of clocks known by the system.
+ */
 int s3c24xx_register_clock(struct clk *clk)
 {
 	if (clk->enable == NULL)
@@ -324,6 +330,14 @@ int s3c24xx_register_clock(struct clk *clk)
 	return 0;
 }
 
+/**
+ * s3c24xx_register_clocks() - register an array of clock pointers
+ * @clks: Pointer to an array of struct clk pointers
+ * @nr_clks: The number of clocks in the @clks array.
+ *
+ * Call s3c24xx_register_clock() for all the clock pointers contained
+ * in the @clks list. Returns the number of failures.
+ */
 int s3c24xx_register_clocks(struct clk **clks, int nr_clks)
 {
 	int fails = 0;
-- 
1.6.0.4
