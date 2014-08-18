From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v9 2/2] regulator: Add DT bindings for max77802 PMIC regulators
Date: Mon, 18 Aug 2014 10:32:42 +0200
Message-ID: <1408350762-15520-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1408350762-15520-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1408350762-15520-1-git-send-email-javier.martinez@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Add Device Tree binding documentation for the regulators
present in the Maxim 77802 Power Management IC.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 .../devicetree/bindings/regulator/max77802.txt     | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/max77802.txt

diff --git a/Documentation/devicetree/bindings/regulator/max77802.txt b/Documentation/devicetree/bindings/regulator/max77802.txt
new file mode 100644
index 0000000..5aeaffc
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/max77802.txt
@@ -0,0 +1,53 @@
+Binding for Maxim MAX77802 regulators
+
+This is a part of device tree bindings of MAX77802 multi-function device.
+More information can be found in bindings/mfd/max77802.txt file.
+
+The MAX77802 PMIC has 10 high-efficiency Buck and 32 Low-dropout (LDO)
+regulators that can be controlled over I2C.
+
+Following properties should be present in main device node of the MFD chip.
+
+Optional node:
+- regulators : The regulators of max77802 have to be instantiated
+  under subnode named "regulators" using the following format.
+
+	regulator-name {
+		standard regulator constraints....
+	};
+	refer Documentation/devicetree/bindings/regulator/regulator.txt
+
+The regulator node name should be initialized with a string to get matched
+with their hardware counterparts as follow. The valid names are:
+
+	-LDOn 	:	for LDOs, where n can lie in ranges 1-15, 17-21, 23-30
+			and 32-35.
+			example: LDO1, LDO2, LDO35.
+	-BUCKn 	:	for BUCKs, where n can lie in range 1 to 10.
+			example: BUCK1, BUCK5, BUCK10.
+Example:
+
+	max77802@09 {
+		compatible = "maxim,max77802";
+		interrupt-parent = <&wakeup_eint>;
+		interrupts = <26 0>;
+		reg = <0x09>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		regulators {
+			ldo11_reg: LDO11 {
+				regulator-name = "vdd_ldo11";
+				regulator-min-microvolt = <1900000>;
+				regulator-max-microvolt = <1900000>;
+				regulator-always-on;
+			};
+
+			buck1_reg: BUCK1 {
+				regulator-name = "vdd_mif";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+	};
-- 
2.0.1
