From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH] ARM: exynos: add UART3 to DEBUG_LL ports
Date: Tue, 20 Nov 2012 14:48:58 -0800
Message-ID: <1353451739-6317-1-git-send-email-dianders@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f74.google.com ([209.85.216.74]:45919 "EHLO
	mail-qa0-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751855Ab2KTWtb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 17:49:31 -0500
Received: by mail-qa0-f74.google.com with SMTP id g40so201219qab.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Nov 2012 14:49:31 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Olof Johansson <olof@lixom.net>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

From: Olof Johansson <olof@lixom.net>

UART3 is used for debugging on exynos5250-snow.

[dianders: cleaned commit message.]

Signed-off-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Doug Anderson <dianders@chromium.org>

---
 arch/arm/Kconfig.debug        |   11 +++++++++++
 arch/arm/plat-samsung/Kconfig |    1 +
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 33a8930..35ba7dc 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -355,6 +355,17 @@ choice
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
 	config DEBUG_SOCFPGA_UART
 		depends on ARCH_SOCFPGA
 		bool "Use SOCFPGA UART for low-level debug"
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 59401e1..d342ed0 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -502,5 +502,6 @@ config DEBUG_S3C_UART
 	default "0" if DEBUG_S3C_UART0
 	default "1" if DEBUG_S3C_UART1
 	default "2" if DEBUG_S3C_UART2
+	default "3" if DEBUG_S3C_UART3
 
 endif
-- 
1.7.7.3
