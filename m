From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 4/6] ARM: S3C2443: Update notes on MPLLREF clock
Date: Sat, 30 Jan 2010 15:11:31 +0200
Message-ID: <1264857093-4040-5-git-send-email-ben-linux@fluff.org>
References: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [82.203.205.227] ([82.203.205.227]:45549 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752583Ab0A3NXc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jan 2010 08:23:32 -0500
In-Reply-To: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add note on MPLLREF clock source and why it cannot be easily removed.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2443/clock.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index 1307f69..3fa37aa 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -83,10 +83,12 @@ static int s3c2443_clkcon_enable_s(struct clk *clk, int enable)
 	return s3c2443_gate(S3C2443_SCLKCON, clk, enable);
 }
 
-/* s3c2443_roundate_clksrc is close enough to s3c_roundate_clksrc */
-
 /* clock selections */
 
+/* mpllref is a direct descendant of clk_xtal by default, but it is not
+ * elided as the EPLL can be either sourced by the XTAL or EXTCLK and as
+ * such directly equating the two source clocks is impossible.
+ */
 static struct clk clk_mpllref = {
 	.name		= "mpllref",
 	.parent		= &clk_xtal,
-- 
1.6.3.3
