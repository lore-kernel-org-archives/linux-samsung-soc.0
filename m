From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 5/7] ARM: dts: exynos: Add missing unit name to memory nodes in Exynos3 DTS
Date: Wed, 31 Aug 2016 14:14:37 +0200
Message-ID: <1472645679-5696-6-git-send-email-javier@osg.samsung.com>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes the following DTC warnings:

"Node /memory has a reg or ranges property, but no unit name"

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 arch/arm/boot/dts/exynos3250-artik5.dtsi | 2 +-
 arch/arm/boot/dts/exynos3250-monk.dts    | 2 +-
 arch/arm/boot/dts/exynos3250-rinato.dts  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
index bedc13bef5d9..a70819b1b739 100644
--- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
@@ -24,7 +24,7 @@
 		stdout-path = &serial_2;
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x1ff00000>;
 	};
diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 249fcfd5b297..66f04f6ba6bb 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -27,7 +27,7 @@
 		i2c7 = &i2c_max77836;
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg =  <0x40000000 0x1ff00000>;
 	};
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index ae125ece061d..3967ee5f7752 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -27,7 +27,7 @@
 		i2c7 = &i2c_max77836;
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg =  <0x40000000 0x1ff00000>;
 	};
-- 
2.7.4
