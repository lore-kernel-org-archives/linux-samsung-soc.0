From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 1/2] ASoC: samsung: Add DT bindings documentation for TM2
 sound subsystem
Date: Fri, 02 Sep 2016 14:58:12 +0200
Message-ID: <1472821093-25815-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds DT binding documentation for Exynos5433 based TM2
and TM2E boards sound subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
