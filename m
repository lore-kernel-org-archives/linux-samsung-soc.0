From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 03/14] regulator: dt-bindings: max77802: Document
 of_compatible for regulator
Date: Thu, 30 Oct 2014 12:20:42 +0100
Message-ID: <1414668053-31370-4-git-send-email-k.kozlowski@samsung.com>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Document new required property for regulator driver: of_compatible.
The property allows MFD core to bind the driver to node with regulators
and this simplifies parsing regulators init data from DTS

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 Documentation/devicetree/bindings/regulator/max77802.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/max77802.txt b/Documentation/devicetree/bindings/regulator/max77802.txt
index 5aeaffc0f1f0..fa545e7d3b0a 100644
--- a/Documentation/devicetree/bindings/regulator/max77802.txt
+++ b/Documentation/devicetree/bindings/regulator/max77802.txt
@@ -10,7 +10,11 @@ Following properties should be present in main device node of the MFD chip.
 
 Optional node:
 - regulators : The regulators of max77802 have to be instantiated
-  under subnode named "regulators" using the following format.
+  under subnode named "regulators".
+  Required property:
+  - compatible : Must be "maxim,max77802-pmic"
+
+  Optional properties: For each regulator use following format:
 
 	regulator-name {
 		standard regulator constraints....
@@ -36,6 +40,8 @@ Example:
 		#size-cells = <0>;
 
 		regulators {
+			compatible = "maxim,max77802-pmic";
+
 			ldo11_reg: LDO11 {
 				regulator-name = "vdd_ldo11";
 				regulator-min-microvolt = <1900000>;
-- 
1.9.1
