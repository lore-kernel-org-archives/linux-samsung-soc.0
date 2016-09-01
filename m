From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2 7/7] ARM: dts: exynos: Add missing unit name to memory nodes in Exynos5 DTS
Date: Thu,  1 Sep 2016 11:06:56 +0200
Message-ID: <1472720817-20362-8-git-send-email-javier@osg.samsung.com>
References: <1472720817-20362-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472720817-20362-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes the following DTC warnings:

"Node /memory has a reg or ranges property, but no unit name"

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in v2: None

 arch/arm/boot/dts/exynos5250-arndale.dts           | 2 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          | 2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      | 2 +-
 arch/arm/boot/dts/exynos5250-spring.dts            | 2 +-
 arch/arm/boot/dts/exynos5260-xyref5260.dts         | 2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts          | 2 +-
 arch/arm/boot/dts/exynos5410-smdk5410.dts          | 2 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 2 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts         | 2 +-
 arch/arm/boot/dts/exynos5420-smdk5420.dts          | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 2 +-
 arch/arm/boot/dts/exynos5440-sd5v1.dts             | 2 +-
 arch/arm/boot/dts/exynos5440-ssdk5440.dts          | 2 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts          | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 54397c7e8d7c..6098dacd09f1 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -20,7 +20,7 @@
 	model = "Insignal Arndale evaluation board based on EXYNOS5250";
 	compatible = "insignal,arndale", "samsung,exynos5250", "samsung,exynos5";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index b85b78a57299..124e7bf1ed97 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -22,7 +22,7 @@
 	aliases {
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index 5324eb488e30..9ddf5d2701c2 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -19,7 +19,7 @@
 		i2c104 = &i2c_104;
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index bdc55fa7c576..103d8f94e1da 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -20,7 +20,7 @@
 	model = "Google Spring";
 	compatible = "google,spring", "samsung,exynos5250", "samsung,exynos5";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5260-xyref5260.dts b/arch/arm/boot/dts/exynos5260-xyref5260.dts
index d7f62918ed4b..d75685cad627 100644
--- a/arch/arm/boot/dts/exynos5260-xyref5260.dts
+++ b/arch/arm/boot/dts/exynos5260-xyref5260.dts
@@ -16,7 +16,7 @@
 	model = "SAMSUNG XYREF5260 board based on EXYNOS5260";
 	compatible = "samsung,xyref5260", "samsung,exynos5260", "samsung,exynos5";
 
-	memory {
+	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index f1d831fe4ac0..cdc577265002 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -21,7 +21,7 @@
 	model = "Hardkernel Odroid XU";
 	compatible = "hardkernel,odroid-xu", "samsung,exynos5410", "samsung,exynos5";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x7ea00000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5410-smdk5410.dts b/arch/arm/boot/dts/exynos5410-smdk5410.dts
index 6ea1ac4cf1e7..5e36bddb0509 100644
--- a/arch/arm/boot/dts/exynos5410-smdk5410.dts
+++ b/arch/arm/boot/dts/exynos5410-smdk5410.dts
@@ -16,7 +16,7 @@
 	model = "Samsung SMDK5410 board based on EXYNOS5410";
 	compatible = "samsung,smdk5410", "samsung,exynos5410", "samsung,exynos5";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 98138bd64fad..68b91e6e5526 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -22,7 +22,7 @@
 	model = "Insignal Arndale Octa evaluation board based on EXYNOS5420";
 	compatible = "insignal,arndale-octa", "samsung,exynos5420", "samsung,exynos5";
 
-	memory {
+	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index cd0c44b0bfa5..bc76dfdc57e6 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -79,7 +79,7 @@
 		};
 	};
 
-	memory {
+	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 3a744d5611ea..b9192ef11257 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -19,7 +19,7 @@
 	model = "Samsung SMDK5420 board based on EXYNOS5420";
 	compatible = "samsung,smdk5420", "samsung,exynos5420", "samsung,exynos5";
 
-	memory {
+	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 05ae7284bb1b..0747c6fdadf8 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -21,7 +21,7 @@
 #include "exynos-mfc-reserved-memory.dtsi"
 
 / {
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x7EA00000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts b/arch/arm/boot/dts/exynos5440-sd5v1.dts
index afd21a41e05b..ad6f533b3f40 100644
--- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
+++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
@@ -21,7 +21,7 @@
 	};
 
 	/* FIXME: set reg property with correct start address and size */
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0>;
 	};
diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index bdb3bf622e2f..92bd2c6f7631 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -22,7 +22,7 @@
 	};
 
 	/* FIXME: set reg property with correct start address and size */
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0>;
 	};
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 72f89c8803d4..9fafe10d9e4e 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -79,7 +79,7 @@
 
 	};
 
-	memory {
+	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x80000000>;
 	};
-- 
2.7.4
