From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 03/12] ARM: S3C24XX: Remove extern declaration of clk_msysclk
Date: Thu, 16 Feb 2012 07:55:37 +0900
Message-ID: <1329346545-16373-4-git-send-email-kgene.kim@samsung.com>
References: <1329346545-16373-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:60162 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756009Ab2BOW4F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Feb 2012 17:56:05 -0500
Received: by mail-pz0-f46.google.com with SMTP id d14so1335535dae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Feb 2012 14:56:05 -0800 (PST)
In-Reply-To: <1329346545-16373-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Heiko Stuebner <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>

From: Heiko Stuebner <heiko@sntech.de>

clk_msysclk is not needed outside of s3c2443-clock.c.

Removing the extern declaration will prevent conflicts with the
s3c2412 clk_msysclk in the following cleanups.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
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
1.7.4.4
