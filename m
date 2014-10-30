From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 11/14] mfd/regulator: dt-bindings: max77686: Document gpio
 properties
Date: Thu, 30 Oct 2014 12:20:50 +0100
Message-ID: <1414668053-31370-12-git-send-email-k.kozlowski@samsung.com>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Document usage of gpio properties which turn on external/GPIO control
over regulator.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 Documentation/devicetree/bindings/mfd/max77686.txt | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Documentation/devicetree/bindings/mfd/max77686.txt
index f4010a9f66eb..b8013e69da65 100644
--- a/Documentation/devicetree/bindings/mfd/max77686.txt
+++ b/Documentation/devicetree/bindings/mfd/max77686.txt
@@ -22,7 +22,14 @@ Optional node:
   Required property:
   - compatible : Must be "maxim,max77686-pmic"
 
-  Optional properties: For each regulator use following format:
+  Optional properties:
+  - ldo20-gpio : GPIO to use for LDO20 enable control.
+  - ldo21-gpio : GPIO to use for LDO21 enable control.
+  - ldo22-gpio : GPIO to use for LDO22 enable control.
+  - buck8-gpio : GPIO to use for BUCK8 enable control.
+  - buck9-gpio : GPIO to use for BUCK9 enable control.
+
+  For each regulator use following format:
 	regulator_name {
 		regulator-compatible = LDOn/BUCKn
 		standard regulator constraints....
@@ -42,7 +49,6 @@ to get matched with their hardware counterparts as follow:
 	-BUCKn	:	1-4.
   Use standard regulator bindings for it ('regulator-off-in-suspend').
 
-
 Example:
 
 	max77686@09 {
@@ -53,6 +59,7 @@ Example:
 
 		voltage-regulators {
 			compatible = "maxim,max77686-pmic";
+			ldo21-gpio = <&gpy2 0 GPIO_ACTIVE_HIGH>;
 
 			ldo11_reg {
 				regulator-compatible = "LDO11";
-- 
1.9.1
