From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 3/6] ASoC: Add DT bindings documentation for max98504
 amplifier
Date: Wed, 29 Jun 2016 13:26:36 +0200
Message-ID: <1467199599-6892-4-git-send-email-s.nawrocki@samsung.com>
References: <1467199599-6892-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50222 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752031AbcF2L2p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 07:28:45 -0400
In-reply-to: <1467199599-6892-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, ideal.song@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds DT bindings documentation for Maxim MAX98504
speaker amplifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v2:
 - added properties for VBAT brownout.

Changes since v1:
 - added 'interrupts' property.
---
 .../devicetree/bindings/sound/max98504.txt         | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/max98504.txt

diff --git a/Documentation/devicetree/bindings/sound/max98504.txt b/Documentation/devicetree/bindings/sound/max98504.txt
new file mode 100644
index 0000000..583ed5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/max98504.txt
@@ -0,0 +1,44 @@
+Maxim MAX98504 class D mono speaker amplifier
+
+This device supports I2C control interface and an IRQ output signal. It features
+a PCM and PDM digital audio interface (DAI) and a differential analog input.
+
+Required properties:
+
+ - compatible : "maxim,max98504"
+ - reg : should contain the I2C slave device address
+ - DVDD-supply, DIOVDD-supply, PVDD-supply: power supplies for the device,
+   as covered in ../regulator/regulator.txt
+ - interrupts : should specify the interrupt line the device is connected to,
+   as described in ../interrupt-controller/interrupts.txt
+
+Optional properties:
+
+ - maxim,brownout-threshold - the PVDD brownout threshold, the value must be
+   from 0, 1...21 range, corresponding to 2.6V, 2.65V...3.65V voltage range
+ - maxim,brownout-attenuation - the brownout attenuation to the speaker gain
+   applied during the "attack hold" and "timed hold" phase, the value must be
+   from 0...6 (dB) range
+ - maxim,brownout-attack-hold-ms - the brownout attack hold phase time in ms,
+   0...255 (VBATBROWN_ATTK_HOLD, register 0x0018)
+ - maxim,brownout-timed-hold-ms - the brownout timed hold phase time in ms,
+   0...255 (VBATBROWN_TIME_HOLD, register 0x0019)
+ - maxim,brownout-release-rate-ms - the brownout release phase step time in ms,
+   0...255 (VBATBROWN_RELEASE, register 0x001A)
+
+The default value when the above properties are not specified is 0,
+the maxim,brownout-threshold property must be specified to actually enable
+the PVDD brownout protection.
+
+Example:
+
+ max98504@31 {
+	compatible = "maxim,max98504";
+	reg = <0x31>;
+	interrupt-parent = <&gpio_bank_0>;
+	interrupts = <2 0>;
+
+	DVDD-supply = <&regulator>;
+	DIOVDD-supply = <&regulator>;
+	PVDD-supply = <&regulator>;
+};
-- 
1.9.1
