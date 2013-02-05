From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH] ARM: S3C24XX: osiris: add missing platform_device.h include
Date: Tue, 5 Feb 2013 22:50:18 +0100
Message-ID: <201302052250.18818.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:58331 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756670Ab3BEVu0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 16:50:26 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The missing include led to a implcit declaration warning.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c24xx/mach-osiris.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index c2dc032..7d73626 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -21,6 +21,7 @@
 #include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
+#include <linux/platform_device.h>
 
 #include <linux/i2c/tps65010.h>
 
-- 
1.7.10.4
