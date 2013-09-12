From: Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH] ARM: dts: Fix a typo on Exynos5440 DTS files
Date: Thu, 12 Sep 2013 17:07:36 +0900
Message-ID: <005501ceaf8f$2483bac0$6d8b3040$%nam@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:22457 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753197Ab3ILIHq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 04:07:46 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MT000GUH6KA9PN0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Sep 2013 17:07:37 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org

This patch removes '_' from "early_prink" on Exynos5440 DTS files
in according to kernel-parameters document.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
---
 arch/arm/boot/dts/exynos5440-sd5v1.dts    |    2 +-
 arch/arm/boot/dts/exynos5440-ssdk5440.dts |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts b/arch/arm/boot/dts/exynos5440-sd5v1.dts
index 5b22508..777fb1c 100644
--- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
+++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
@@ -17,7 +17,7 @@
 	compatible = "samsung,sd5v1", "samsung,exynos5440";
 
 	chosen {
-		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel early_printk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
+		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel earlyprintk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
 	};
 
 	fixed-rate-clocks {
diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index ede7727..a7cb848 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -17,7 +17,7 @@
 	compatible = "samsung,ssdk5440", "samsung,exynos5440";
 
 	chosen {
-		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel early_printk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
+		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel earlyprintk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
 	};
 
 	spi_0: spi@D0000 {
-- 
1.7.10.4
