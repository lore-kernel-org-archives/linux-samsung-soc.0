From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] ARM: dts: exynos: Remove console argument from bootargs
Date: Mon,  8 Apr 2019 07:19:26 +0200
Message-ID: <20190408051926.462-2-krzk@kernel.org>
References: <20190408051926.462-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408051926.462-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: notify@kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Remove the "console=ttySAC..." argument from DTSes having a proper
stdout-path property.  To make the code functionally equivalent, add the
serial port baud rate and parity.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts         | 4 ++--
 arch/arm/boot/dts/exynos4210-smdkv310.dts       | 4 ++--
 arch/arm/boot/dts/exynos4210-trats.dts          | 4 ++--
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 4 ++--
 arch/arm/boot/dts/exynos4412-origen.dts         | 3 +--
 arch/arm/boot/dts/exynos4412-smdk4412.dts       | 4 ++--
 6 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index dd9ec05eb0f7..36b1edea254a 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -30,8 +30,8 @@
 	};
 
 	chosen {
-		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
-		stdout-path = &serial_2;
+		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M init=/linuxrc";
+		stdout-path = "serial2:115200n8";
 	};
 
 	mmc_reg: voltage-regulator {
diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index 7a3e621edede..77fc11e593ad 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -26,8 +26,8 @@
 	};
 
 	chosen {
-		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
-		stdout-path = &serial_1;
+		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M init=/linuxrc";
+		stdout-path = "serial1:115200n8";
 	};
 
 	fixed-rate-clocks {
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 8dbc47d627a5..6882480dbaf7 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -26,8 +26,8 @@
 	};
 
 	chosen {
-		bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5 rootwait earlyprintk panic=5";
-		stdout-path = &serial_2;
+		bootargs = "root=/dev/mmcblk0p5 rootwait earlyprintk panic=5";
+		stdout-path = "serial2:115200n8";
 	};
 
 	regulators {
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 5c3d98654f13..07d64a8f82e3 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -24,8 +24,8 @@
 	};
 
 	chosen {
-		bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5 rw rootwait earlyprintk panic=5 maxcpus=1";
-		stdout-path = &serial_2;
+		bootargs = "root=/dev/mmcblk0p5 rw rootwait earlyprintk panic=5 maxcpus=1";
+		stdout-path = "serial2:115200n8";
 	};
 
 
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 346f71932457..698de4345d16 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -25,8 +25,7 @@
 	};
 
 	chosen {
-		bootargs ="console=ttySAC2,115200";
-		stdout-path = &serial_2;
+		stdout-path = "serial2:115200n8";
 	};
 
 	firmware@203f000 {
diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index 5c5c2887c14f..e70fb6e601f0 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -23,8 +23,8 @@
 	};
 
 	chosen {
-		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
-		stdout-path = &serial_1;
+		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M init=/linuxrc";
+		stdout-path = "serial1:115200n8";
 	};
 
 	fixed-rate-clocks {
-- 
2.17.1
