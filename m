From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v7 RESEND 1/2] ASoC: samsung: Add DT bindings documentation for
 TM2 sound subsystem
Date: Wed, 02 Nov 2016 17:02:37 +0100
Message-ID: <1478102558-12524-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43492 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752844AbcKBQDH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 12:03:07 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG0010JTV7EFRD0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Nov 2016 01:03:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, linux-samsung-soc@vger.kernel.org
Cc: krzk@kernel.org, alsa-devel@alsa-project.org, sbkim73@samsung.com, b.zolnierkie@samsung.com, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds DT binding documentation for Exnos5433 based TM2
and TM2E boards sound subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v5:
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
