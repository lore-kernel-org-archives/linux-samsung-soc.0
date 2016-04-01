From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 08/11] ARM: dts: exynos: Fix DTC unit name warnings in Peach Pit
Date: Fri, 01 Apr 2016 15:57:51 +0900
Message-ID: <1459493874-2366-8-git-send-email-k.kozlowski@samsung.com>
References: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix following DTC warnings in Exynos5420 Peach Pit:

Warning (unit_address_vs_reg): Node /dp-controller@145B0000/ports/port@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /i2c@12CD0000/lvds-bridge@48/ports/port@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /i2c@12CD0000/lvds-bridge@48/ports/port@1 has a unit name, but no reg property

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 3981ddb25036..87623cf100b5 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -165,7 +165,7 @@
 	samsung,hpd-gpio = <&gpx2 6 GPIO_ACTIVE_HIGH>;
 
 	ports {
-		port@0 {
+		port_0 {
 			dp_out: endpoint {
 				remote-endpoint = <&bridge_in>;
 			};
@@ -633,13 +633,13 @@
 		use-external-pwm;
 
 		ports {
-			port@0 {
+			port_0 {
 				bridge_out: endpoint {
 					remote-endpoint = <&panel_in>;
 				};
 			};
 
-			port@1 {
+			port_1 {
 				bridge_in: endpoint {
 					remote-endpoint = <&dp_out>;
 				};
-- 
2.5.0
