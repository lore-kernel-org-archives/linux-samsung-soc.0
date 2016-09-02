From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v7 1/2] ASoC: samsung: Add DT bindings documentation for TM2
 sound subsystem
Date: Fri, 02 Sep 2016 19:05:31 +0200
Message-ID: <1472835932-13535-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52398 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932236AbcIBRFz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 13:05:55 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.wolfsonmicro.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds DT binding documentation for Exnos5433 based TM2
and TM2E boards sound subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v6:
 - none.

Changes since v4:
 - indentation changes.

Changes since v2:
 - none.

Changes since initial version:
 - dropped clocks, clock-names properties, instead properties from
   the CODEC node will be used,
 - property renames: 'samsung,model' -> 'model', 'samsung,i2s-controller'
   -> 'i2s-controller', 'samsung,speaker-amplifier' -> 'audio-amplifier',
 - added 'audio-codec' property.
---
 .../bindings/sound/samsung,tm2-audio.txt           | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
new file mode 100644
index 0000000..94442e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
@@ -0,0 +1,38 @@
+Samsung Exynos5433 TM2(E) audio complex with WM5110 codec
+
+Required properties:
+
+ - compatible		 : "samsung,tm2-audio"
+ - model		 : the user-visible name of this sound complex
+ - audio-codec		 : the phandle of the wm5110 audio codec node,
+			   as described in ../mfd/arizona.txt
+ - i2s-controller	 : the phandle of the I2S controller
+ - audio-amplifier	 : the phandle of the MAX98504 amplifier
+ - samsung,audio-routing : a list of the connections between audio components;
+			   each entry is a pair of strings, the first being the
+			   connection's sink, the second being the connection's
+			   source; valid names for sources and sinks are the
+			   WM5110's and MAX98504's pins and the jacks on the
+			   board: HP, SPK, Main Mic, Sub Mic, Third Mic,
+			   Headset Mic
+ - mic-bias-gpios	 : GPIO pin that enables the Main Mic bias regulator
+
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
