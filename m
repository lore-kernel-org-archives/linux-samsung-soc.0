From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] video: exynos: Add a dependency to the menu
Date: Tue, 8 Apr 2014 12:00:56 +0200
Message-ID: <20140408120056.57556a00@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56387 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750800AbaDHKBD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 06:01:03 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kukjin Kim <kgene.kim@samsung.com>

All drivers under menu EXYNOS_VIDEO depend on either ARCH_S5PV210 or
ARCH_EXYNOS, so add these as dependencies to the menu itself. This
avoids presenting an empty and useless menu on other architectures.

Then drivers under the menu only need a dependency if they depend on
one of the supported architectures specifically.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/video/exynos/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-3.15-rc0.orig/drivers/video/exynos/Kconfig	2014-04-07 10:23:07.316226676 +0200
+++ linux-3.15-rc0/drivers/video/exynos/Kconfig	2014-04-08 11:50:17.406723187 +0200
@@ -4,6 +4,7 @@
 
 menuconfig EXYNOS_VIDEO
 	bool "Exynos Video driver support"
+	depends on ARCH_S5PV210 || ARCH_EXYNOS
 	help
 	  This enables support for EXYNOS Video device.
 
@@ -15,7 +16,6 @@ if EXYNOS_VIDEO
 
 config EXYNOS_MIPI_DSI
 	bool "EXYNOS MIPI DSI driver support."
-	depends on ARCH_S5PV210 || ARCH_EXYNOS
 	select GENERIC_PHY
 	help
 	  This enables support for MIPI-DSI device.


-- 
Jean Delvare
SUSE L3 Support
