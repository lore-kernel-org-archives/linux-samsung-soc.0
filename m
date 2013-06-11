From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: update bootargs to support 8GiB for SSDK5440 and
 SD5v1
Date: Tue, 11 Jun 2013 17:14:57 +0900
Message-ID: <109a01ce667b$c2d45930$487d0b90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48385 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753949Ab3FKIO6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 04:14:58 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO700FR0YUH8490@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 17:14:57 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Subash Patel' <subash.rp@samsung.com>, 'Jungseok Lee' <jays.lee@samsung.com>

From: Subash Patel <subash.rp@samsung.com>

Since ssdk5440 and sd5v1 have 8GiB memory, this patch
updates bootargs for them.

Signed-off-by: Subash Patel <subash.rp@samsung.com>
Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440-sd5v1.dts    |    2 +-
 arch/arm/boot/dts/exynos5440-ssdk5440.dts |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts b/arch/arm/boot/dts/exynos5440-sd5v1.dts
index ef747b5..f722a02 100644
--- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
+++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
@@ -17,7 +17,7 @@
 	compatible = "samsung,sd5v1", "samsung,exynos5440";
 
 	chosen {
-		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel early_printk no_console_suspend mem=2048M@0x80000000
console=ttySAC0,115200";
+		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel early_printk no_console_suspend mem=2048M@0x80000000
mem=6144M@0x100000000 console=ttySAC0,115200";
 	};
 
 	fixed-rate-clocks {
diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index d55042b..0e3adc8 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -17,7 +17,7 @@
 	compatible = "samsung,ssdk5440", "samsung,exynos5440";
 
 	chosen {
-		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel early_printk no_console_suspend mem=2048M@0x80000000
console=ttySAC0,115200";
+		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel early_printk no_console_suspend mem=2048M@0x80000000
mem=6144M@0x100000000 console=ttySAC0,115200";
 	};
 
 	spi {
-- 
1.7.10.4
