From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 4/6] ASoC: Add DT bindings documentation for max98504
 amplifier
Date: Mon, 13 Jun 2016 12:52:38 +0200
Message-ID: <1465815160-28504-5-git-send-email-s.nawrocki@samsung.com>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49337 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964910AbcFMKyb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 06:54:31 -0400
In-reply-to: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds DT bindings documentation for Maxim MAX98504
speaker amplifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../devicetree/bindings/sound/max98504.txt         | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/max98504.txt

diff --git a/Documentation/devicetree/bindings/sound/max98504.txt b/Documentation/devicetree/bindings/sound/max98504.txt
new file mode 100644
index 0000000..0cb75af
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/max98504.txt
@@ -0,0 +1,44 @@
+
+Maxim MAX98504 class D mono speaker amplifier
+
+Required properties:
+
+ - compatible : "maxim,max98504"
+ - reg : should contain the I2C slave device address
+
+Optional properties:
+
+ - maxim,rx-path : indicates speaker source interface:
+    0 - PCM monomix output,
+    1 - Analog input,
+    2 - left PDM channel (CH0),
+    3 - right PDM channel (CH1)
+
+ - maxim,rx-channel-mask : a bitmask indicating active PCM Rx channels,
+   bits b7...b0 correspond to channels CH7...CH0
+
+ - maxim,tx-path : indicates the V/I sense (feedback) Tx data interface used:
+    0 - PCM, 1 - TDM
+
+ - maxim,tx-channel-mask : a bitmask indicating active PCM or PDM Tx channels,
+   bits b7...b0 correspond to channels CH7...CH0, for PCM are meaningful
+   channels CH7...CH0, for PDM only channels CH1, CH0
+
+ - maxim,tx-channel-source : a bitmask indicating V/I sense source type for
+   each PCM or PDM Tx channel; bits b7...b0 correspond to channels CH7...CH0,
+   for PCM are meaningful channels CH7...CH0, for PDM only channels CH1, CH0:
+    0 - selects voltage measurement data (V),
+    1 - selects current measurement data (I)
+
+If any of the above optional properties is missing its value defaults to 0.
+
+Example:
+
+ max98504: max98504@31 {
+	compatible = "maxim,max98504";
+	reg = <0x31>;
+	maxim,rx-path = <1>;		// Analog input
+	maxim,tx-path = <1>;		// V/I sense PDM Tx
+	maxim,tx-channel-mask = <3>;	// channels CH1, CH0
+	maxim,tx-channel-source = <2>;	// CH1 current, CH0 voltage
+};
-- 
1.9.1
