From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] ARM: dts: exynos: Use stdout-path property instead of console in bootargs
Date: Mon,  8 Apr 2019 07:19:25 +0200
Message-ID: <20190408051926.462-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: notify@kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Replacing bootargs with stdout-path property in chosen node allows using
early console by adding just 'earlycon' parameter to the kernel command
line.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4412-trats2.dts    | 3 ++-
 arch/arm/boot/dts/exynos5250-smdk5250.dts  | 3 ++-
 arch/arm/boot/dts/exynos5260-xyref5260.dts | 2 +-
 arch/arm/boot/dts/exynos5410-smdk5410.dts  | 2 +-
 arch/arm/boot/dts/exynos5420-smdk5420.dts  | 3 ++-
 5 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 327ee980d3a5..aac533933c61 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -22,6 +22,7 @@
 	};
 
 	chosen {
-		bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5 rootwait earlyprintk panic=5";
+		bootargs = "root=/dev/mmcblk0p5 rootwait earlyprintk panic=5";
+		stdout-path = "serial2:115200n8";
 	};
 };
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index d5e66189ed2a..6dc96948a9cc 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -24,7 +24,8 @@
 	};
 
 	chosen {
-		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
+		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M init=/linuxrc";
+		stdout-path = "serial2:115200n8";
 	};
 
 	vdd: fixed-regulator-vdd {
diff --git a/arch/arm/boot/dts/exynos5260-xyref5260.dts b/arch/arm/boot/dts/exynos5260-xyref5260.dts
index fa19c59b2fb6..36a2b77eeb9d 100644
--- a/arch/arm/boot/dts/exynos5260-xyref5260.dts
+++ b/arch/arm/boot/dts/exynos5260-xyref5260.dts
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "console=ttySAC2,115200";
+		stdout-path = "serial2:115200n8";
 	};
 
 	fin_pll: xxti {
diff --git a/arch/arm/boot/dts/exynos5410-smdk5410.dts b/arch/arm/boot/dts/exynos5410-smdk5410.dts
index 8fc8c841d34b..dffa5e3ed90c 100644
--- a/arch/arm/boot/dts/exynos5410-smdk5410.dts
+++ b/arch/arm/boot/dts/exynos5410-smdk5410.dts
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "console=ttySAC2,115200";
+		stdout-path = "serial2:115200n8";
 	};
 
 	fin_pll: xxti {
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 3cf905047893..8240e5186972 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -21,7 +21,8 @@
 	};
 
 	chosen {
-		bootargs = "console=ttySAC2,115200 init=/linuxrc";
+		bootargs = "init=/linuxrc";
+		stdout-path = "serial2:115200n8";
 	};
 
 	fixed-rate-clocks {
-- 
2.17.1
