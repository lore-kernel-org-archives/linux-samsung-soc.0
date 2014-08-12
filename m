From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 3/6] ARM: dts: Create cros-tps65090 fragment
Date: Tue, 12 Aug 2014 18:44:25 +0200
Message-ID: <1407861868-20097-4-git-send-email-javier.martinez@collabora.co.uk>
References: <1407861868-20097-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1407861868-20097-1-git-send-email-javier.martinez@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The tps65090 PMU is a component used in many ChromeOS devices
so instead of having the same device tree definitions in many
files, create a .dtsi fragment that can be included in DTS.

This fragment is based on the DT definitions for Peach boards.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/cros-tps65090.dtsi | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 arch/arm/boot/dts/cros-tps65090.dtsi

diff --git a/arch/arm/boot/dts/cros-tps65090.dtsi b/arch/arm/boot/dts/cros-tps65090.dtsi
new file mode 100644
index 0000000..99df15e
--- /dev/null
+++ b/arch/arm/boot/dts/cros-tps65090.dtsi
@@ -0,0 +1,81 @@
+/*
+ * Copyright (C) 2014 Google, Inc
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/*
+ * Common file for tps65090 PMU on Chromebooks
+ */
+/ {
+	vbat: fixed-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vbat-supply";
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&tps {
+	/*
+	 * Config irq to disable internal pulls
+	 * even though we run in polling mode.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&tps65090_irq>;
+
+	vsys1-supply = <&vbat>;
+	vsys2-supply = <&vbat>;
+	vsys3-supply = <&vbat>;
+	infet1-supply = <&vbat>;
+	infet2-supply = <&vbat>;
+	infet3-supply = <&vbat>;
+	infet4-supply = <&vbat>;
+	infet5-supply = <&vbat>;
+	infet6-supply = <&vbat>;
+	infet7-supply = <&vbat>;
+	vsys-l1-supply = <&vbat>;
+	vsys-l2-supply = <&vbat>;
+};
+
+&tps65090_dcdc1 {
+	ti,enable-ext-control;
+};
+
+&tps65090_dcdc2 {
+	ti,enable-ext-control;
+};
+
+&tps65090_dcdc3 {
+	ti,enable-ext-control;
+};
+
+&tps65090_fet1 {
+	regulator-name = "vcd_led";
+};
+
+&tps65090_fet2 {
+	regulator-name = "video_mid";
+};
+
+&tps65090_fet3 {
+	regulator-name = "wwan_r";
+};
+
+&tps65090_fet4 {
+	regulator-name = "sdcard";
+};
+
+&tps65090_fet5 {
+	regulator-name = "camout";
+};
+
+&tps65090_fet6 {
+	regulator-name = "lcd_vdd";
+};
+
+&tps65090_fet7 {
+	regulator-name = "video_mid_1a";
+};
-- 
2.0.0.rc2
