From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH v3 7/8] tty/serial: samsung: enable usage for 64-bit Exynos
 platforms
Date: Thu, 11 Sep 2014 15:50:51 +0530
Message-ID: <1410430852-3491-8-git-send-email-ch.naveen@samsung.com>
References: <1410430852-3491-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61924 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754373AbaIKK0Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Sep 2014 06:26:25 -0400
In-reply-to: <1410430852-3491-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, tomasz.figa@gmail.com, kgene.kim@samsung.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Allow Samsung serial driver to be usable on Exynos 64-bit SoC based
platforms.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/serial/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 26cec64..3383744 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -220,7 +220,7 @@ config SERIAL_CLPS711X_CONSOLE
 
 config SERIAL_SAMSUNG
 	tristate "Samsung SoC serial support"
-	depends on PLAT_SAMSUNG
+	depends on PLAT_SAMSUNG || ARCH_EXYNOS
 	select SERIAL_CORE
 	help
 	  Support for the on-chip UARTs on the Samsung S3C24XX series CPUs,
-- 
1.7.9.5
