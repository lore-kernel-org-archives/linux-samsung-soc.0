From: Gusakov Andrey <dron0gus@gmail.com>
Subject: [PATCH] S3C: enable debuging over UART3
Date: Thu, 29 Dec 2011 17:07:15 +0400
Message-ID: <1325164036-15638-2-git-send-email-dron0gus@gmail.com>
References: <1325164036-15638-1-git-send-email-dron0gus@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:42331 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754008Ab1L2NIA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 08:08:00 -0500
Received: by werm1 with SMTP id m1so6139992wer.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Dec 2011 05:07:59 -0800 (PST)
In-Reply-To: <1325164036-15638-1-git-send-email-dron0gus@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Gusakov Andrey <dron_gus@mail.ru>, Gusakov Andrey <dron0gus@gmail.com>

From: Gusakov Andrey <dron_gus@mail.ru>

Some S3C24XX SoCs have 4 uarts. This patch allow set uart3 for
debug output.

Signed-off-by: Gusakov Andrey <dron0gus@gmail.com>
---
 arch/arm/Kconfig.debug        |   11 +++++++++++
 arch/arm/plat-samsung/Kconfig |    1 +
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index c5213e7..0b3debd 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -231,6 +231,17 @@ choice
 		  The uncompressor code port configuration is now handled
 		  by CONFIG_S3C_LOWLEVEL_UART_PORT.
 
+	config DEBUG_S3C_UART3
+		depends on PLAT_SAMSUNG
+		bool "Use S3C UART 3 for low-level debug"
+		help
+		  Say Y here if you want the debug print routines to direct
+		  their output to UART 3. The port must have been initialised
+		  by the boot-loader before use.
+
+		  The uncompressor code port configuration is now handled
+		  by CONFIG_S3C_LOWLEVEL_UART_PORT.
+
 	config DEBUG_REALVIEW_STD_PORT
 		bool "RealView Default UART"
 		depends on ARCH_REALVIEW
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 313eb26..7ead783 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -344,5 +344,6 @@ config DEBUG_S3C_UART
 	default "0" if DEBUG_S3C_UART0
 	default "1" if DEBUG_S3C_UART1
 	default "2" if DEBUG_S3C_UART2
+	default "3" if DEBUG_S3C_UART3
 
 endif
-- 
1.7.0.4
