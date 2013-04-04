From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 4/4] ARM: dts: update bootargs to boot from sda2 for exynos5440-ssdk5440
Date: Thu,  4 Apr 2013 19:46:47 +0900
Message-ID: <1365072407-4320-5-git-send-email-kgene.kim@samsung.com>
References: <1365072407-4320-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f50.google.com ([209.85.210.50]:44075 "EHLO
	mail-da0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757734Ab3DDKrP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 06:47:15 -0400
Received: by mail-da0-f50.google.com with SMTP id t1so1062777dae.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2013 03:47:14 -0700 (PDT)
In-Reply-To: <1365072407-4320-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Subash Patel <subash.rp@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Subash Patel <subash.rp@samsung.com>

Updated the bootargs to boot the system with rootfs in hard-disk
instead of ramdisk.

Signed-off-by: Subash Patel <subash.rp@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440-ssdk5440.dts |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index a21eb4c..d55042b 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -16,12 +16,8 @@
 	model = "SAMSUNG SSDK5440 board based on EXYNOS5440";
 	compatible = "samsung,ssdk5440", "samsung,exynos5440";
 
-	memory {
-		reg = <0x80000000 0x80000000>;
-	};
-
 	chosen {
-		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x81000000,8M console=ttySAC0,115200 init=/linuxrc";
+		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel early_printk no_console_suspend mem=2048M@0x80000000 console=ttySAC0,115200";
 	};
 
 	spi {
-- 
1.7.4.4
