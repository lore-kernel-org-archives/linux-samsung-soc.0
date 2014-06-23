From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 2/2] clk: samsung: add more aliases for s3c24xx
Date: Mon, 23 Jun 2014 23:29:10 +0300
Message-ID: <1403555350-14895-2-git-send-email-anarsoul@gmail.com>
References: <1403555350-14895-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:34057 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756507AbaFWUbd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 16:31:33 -0400
Received: by mail-we0-f174.google.com with SMTP id u57so7841621wes.33
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 13:31:32 -0700 (PDT)
In-Reply-To: <1403555350-14895-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Without these aliases clock lookup fails in s3c2410fb,
s3cmci, s3c2410-nand, s3c24xx-i2s, and i2c-s3c2410 drivers.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/samsung/clk-s3c2410.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/clk-s3c2410.c
index bd9a873..140f473 100644
--- a/drivers/clk/samsung/clk-s3c2410.c
+++ b/drivers/clk/samsung/clk-s3c2410.c
@@ -152,6 +152,11 @@ struct samsung_clock_alias s3c2410_common_aliases[] __initdata = {
 	ALIAS(HCLK, NULL, "hclk"),
 	ALIAS(MPLL, NULL, "mpll"),
 	ALIAS(FCLK, NULL, "fclk"),
+	ALIAS(PCLK, NULL, "watchdog"),
+	ALIAS(PCLK_SDI, NULL, "sdi"),
+	ALIAS(HCLK_NAND, NULL, "nand"),
+	ALIAS(PCLK_I2S, NULL, "iis"),
+	ALIAS(PCLK_I2C, NULL, "i2c"),
 };
 
 /* S3C2410 specific clocks */
-- 
2.0.0
