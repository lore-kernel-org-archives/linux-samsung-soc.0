From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 5/7] tty: Remove to support serial for S5PC100
Date: Thu, 12 May 2011 10:11:12 +0900
Message-ID: <1305162674-25860-6-git-send-email-kgene.kim@samsung.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:44672 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751434Ab1ELBRT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2011 21:17:19 -0400
In-Reply-To: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>

According to removing ARCH_S5PC100, we don't need to support
serial for S5PC100.

Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Greg Kroah-Hartman <gregkh@suse.de
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/tty/serial/Kconfig |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 80484af..28c4f1a 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -527,13 +527,13 @@ config SERIAL_S3C24A0
 	  Serial port support for the Samsung S3C24A0 SoC
 
 config SERIAL_S3C6400
-	tristate "Samsung S3C6400/S3C6410/S5P6440/S5P6450/S5PC100 Serial port support"
-	depends on SERIAL_SAMSUNG && (CPU_S3C6400 || CPU_S3C6410 || CPU_S5P6440 || CPU_S5P6450 || CPU_S5PC100)
+	tristate "Samsung S3C6400/S3C6410/S5P6440/S5P6450 Serial port support"
+	depends on SERIAL_SAMSUNG && (CPU_S3C6400 || CPU_S3C6410 || CPU_S5P6440 || CPU_S5P6450)
 	select SERIAL_SAMSUNG_UARTS_4
 	default y
 	help
-	  Serial port support for the Samsung S3C6400, S3C6410, S5P6440, S5P6450
-	  and S5PC100 SoCs
+	  Serial port support for the Samsung S3C6400, S3C6410, S5P6440
+	  and S5P6450 SoCs
 
 config SERIAL_S5PV210
 	tristate "Samsung S5PV210 Serial port support"
-- 
1.7.1
