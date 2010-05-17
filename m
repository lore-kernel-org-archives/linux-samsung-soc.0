From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 1/2] ARM: S3C64XX: Add USB external clock definition
Date: Mon, 17 May 2010 20:17:42 +0200
Message-ID: <4BF18846.9030809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f216.google.com ([209.85.219.216]:43850 "EHLO
	mail-ew0-f216.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752565Ab0EQSRq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 14:17:46 -0400
Received: by ewy8 with SMTP id 8so2036368ewy.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 May 2010 11:17:44 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ben Dooks <ben-linux@fluff.org>

This adds the xusbxti clock to S3C64XX platform.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c64xx/clock.c              |    7 +++++++
 arch/arm/plat-samsung/include/plat/clock.h |    1 +
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/clock.c
index 2ac2e7d..6830bb7 100644
--- a/arch/arm/mach-s3c64xx/clock.c
+++ b/arch/arm/mach-s3c64xx/clock.c
@@ -88,6 +88,12 @@ struct clk clk_48m = {
 	.enable		= clk_48m_ctrl,
 };
 
+struct clk clk_xusbxti = {
+	.name		= "xusbxti",
+	.id		= -1,
+	.rate		= 48000000,
+};
+
 static int inline s3c64xx_gate(void __iomem *reg,
 				struct clk *clk,
 				int enable)
@@ -762,6 +768,7 @@ static struct clk *clks[] __initdata = {
 	&clk_27m,
 	&clk_48m,
 	&clk_h2,
+	&clk_xusbxti,
 };
 
 /**
diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
index 60b6269..efbc984 100644
--- a/arch/arm/plat-samsung/include/plat/clock.h
+++ b/arch/arm/plat-samsung/include/plat/clock.h
@@ -74,6 +74,7 @@ extern struct clk clk_ext;
 extern struct clk clk_h2;
 extern struct clk clk_27m;
 extern struct clk clk_48m;
+extern struct clk clk_xusbxti;
 
 extern int clk_default_setrate(struct clk *clk, unsigned long rate);
 extern struct clk_ops clk_ops_def_setrate;
-- 
1.7.1
