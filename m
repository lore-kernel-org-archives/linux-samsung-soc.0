From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 7/7] arm64: exynos: Enable rtc and watchdog support for Exynos7
Date: Fri, 17 Oct 2014 21:41:55 +0530
Message-ID: <1413562315-12283-8-git-send-email-a.kesavan@samsung.com>
References: <1413562315-12283-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:64226 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752490AbaJQQMh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Oct 2014 12:12:37 -0400
In-Reply-To: <1413562315-12283-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, tomasz.figa@gmail.com

Enable rtc and watchdog support for exynos7 SoCs.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm64/Kconfig |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 238acff..9bb4e02 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -158,6 +158,9 @@ config ARCH_EXYNOS7
 	select COMMON_CLK_SAMSUNG
 	select PINCTRL
 	select PINCTRL_EXYNOS
+	select HAVE_S3C2410_WATCHDOG if WATCHDOG
+	select HAVE_S3C_RTC if RTC_CLASS
+
 	help
 	  This enables support for Samsung Exynos7 SoC family
 
-- 
1.7.9.5
