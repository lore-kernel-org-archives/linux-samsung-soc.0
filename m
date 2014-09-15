From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 3/3] arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
Date: Mon, 15 Sep 2014 18:43:05 +0530
Message-ID: <1410786785-9838-4-git-send-email-gautam.vivek@samsung.com>
References: <1410786785-9838-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410786785-9838-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, kishon@ti.com, ajaykumar.rs@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>, Jingoo Han <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

DP PHY now require pmu-system-controller to handle PMU register
to control PHY's power isolation. Adding the same to dp-phy
node.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
Cc: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 +-
 arch/arm/boot/dts/exynos5420.dtsi |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index f21b9aa..9b85a2b 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -732,7 +732,7 @@
 
 	dp_phy: video-phy@10040720 {
 		compatible = "samsung,exynos5250-dp-video-phy";
-		reg = <0x10040720 4>;
+		samsung,pmu-syscon = <&pmu_system_controller>;
 		#phy-cells = <0>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index bfe056d..a677812 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -503,8 +503,8 @@
 	};
 
 	dp_phy: video-phy@10040728 {
-		compatible = "samsung,exynos5250-dp-video-phy";
-		reg = <0x10040728 4>;
+		compatible = "samsung,exynos5420-dp-video-phy";
+		samsung,pmu-syscon = <&pmu_system_controller>;
 		#phy-cells = <0>;
 	};
 
-- 
1.7.10.4
