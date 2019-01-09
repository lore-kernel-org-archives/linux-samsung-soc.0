From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: s3c2416: Fix xti node's missing reg property warning
Date: Wed,  9 Jan 2019 14:52:48 +0100
Message-ID: <1547041968-7513-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix the DTC warning for xti node:

    arch/arm/boot/dts/s3c2416-smdk2416.dts:23.12-28.5:
        Warning (simple_bus_reg): /clocks/xti: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/s3c2416-smdk2416.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s3c2416-smdk2416.dts b/arch/arm/boot/dts/s3c2416-smdk2416.dts
index 5164386aff3a..cb371bf72f64 100644
--- a/arch/arm/boot/dts/s3c2416-smdk2416.dts
+++ b/arch/arm/boot/dts/s3c2416-smdk2416.dts
@@ -19,9 +19,12 @@
 
 	clocks {
 		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		xti: xti {
+		xti: xti@0 {
 			compatible = "fixed-clock";
+			reg = <0>;
 			clock-frequency = <12000000>;
 			clock-output-names = "xti";
 			#clock-cells = <0>;
-- 
2.7.4
