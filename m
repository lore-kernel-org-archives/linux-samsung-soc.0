From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 1/8] S3C24XX: Remove extern declaration of clk_msysclk
Date: Sat, 7 Jan 2012 00:23:50 +0100
Message-ID: <201201070023.51657.heiko@sntech.de>
References: <201201070022.40431.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:43096 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759201Ab2AFXYC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jan 2012 18:24:02 -0500
In-Reply-To: <201201070022.40431.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

clk_msysclk is not needed outside of s3c2443-clock.c.

Removing the extern declaration will prevent conflicts with the
s3c2412 clk_msysclk in the following cleanups.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/plat-samsung/include/plat/s3c2443.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/s3c2443.h b/arch/arm/plat-samsung/include/plat/s3c2443.h
index dce05b4..ffaecb9 100644
--- a/arch/arm/plat-samsung/include/plat/s3c2443.h
+++ b/arch/arm/plat-samsung/include/plat/s3c2443.h
@@ -51,4 +51,3 @@ extern int s3c2443_clkcon_enable_s(struct clk *clk, int enable);
 
 extern struct clksrc_clk clk_epllref;
 extern struct clksrc_clk clk_esysclk;
-extern struct clksrc_clk clk_msysclk;
-- 
1.7.5.4
