From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v4 3/4] ASoC: samsung: Add DT bindings documentation for TM2
 sound subsystem
Date: Tue, 05 Jul 2016 19:14:12 +0200
Message-ID: <1467738852-31508-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47792 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030188AbcGEROm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 13:14:42 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, ideal.song@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds DT binding documentation for Exnos5433 based TM2
and TM2E boards sound subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v2:
 - none.
Changes since initial version:
 - dropped clocks, clock-names properties, instead properties from
   the CODEC node will be used,
 - property renames: 'samsung,model' -> 'model', 'samsung,i2s-controller'
   -> 'i2s-controller', 'samsung,speaker-amplifier' -> 'audio-amplifier',
 - added 'audio-codec' property.
---
 .../bindings/sound/samsung,tm2-audio.txt           | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
new file mode 100644
index 0000000..3ae56f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
@@ -0,0 +1,36 @@
+Samsung Exynos5433 TM2(E) audio complex with WM5110 codec
+
+Required properties:
+
+ - compatible : "samsung,tm2-audio"
+ - model : the user-visible name of this sound complex
+ - audio-codec: the phandle of the wm5110 audio codec node,
+   as described in Documentation/devicetree/bindings/mfd/arizona.txt
+ - i2s-controller : the phandle of the I2S controller
+ - audio-amplifier : the phandle of the MAX98504 amplifier
+ - samsung,audio-routing : a list of the connections between audio
+   components;  each entry is a pair of strings, the first being the
+   connection's sink, the second being the connection's source;
+   valid names for sources and sinks are the WM5110's and MAX98504's
+   pins and the jacks on the board:
+   HP, SPK, Main Mic, Sub Mic, Third Mic, Headset Mic.
+ - mic-bias-gpios : GPIO pin that enables the Main Mic bias regulator
+
+Example:
+
+sound {
+	compatible = "samsung,tm2-audio";
+	audio-codec = <&wm5110>;
+	i2s-controller = <&i2s0>;
+	audio-amplifier = <&max98504>;
+	mic-bias-gpios = <&gpr3 2 0>;
+	model = "wm5110";
+	samsung,audio-routing =
+		"HP", "HPOUT1L",
+		"HP", "HPOUT1R",
+		"SPK", "SPKOUT",
+		"SPKOUT", "HPOUT2L",
+		"SPKOUT", "HPOUT2R",
+		"Main Mic", "MICBIAS2",
+		"IN1R", "Main Mic";
+};
-- 
1.9.1
