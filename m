From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 5/7] ASoC: samsung,tm2-audio DT binding documentation
 update
Date: Mon, 12 Feb 2018 17:15:36 +0100
Message-ID: <20180212161538.22669-6-s.nawrocki@samsung.com>
References: <20180212161538.22669-1-s.nawrocki@samsung.com>
        <CGME20180212161700epcas2p3f810196ade27315587602b16707755c6@epcas2p3.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20180212161538.22669-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, jcsing.lee@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch documents additional entries of the audio-codec and
i2s-controller properties required for the HDMI audio support.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/sound/samsung,tm2-audio.txt        | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
index 94442e5673b3..f5ccc12ddc00 100644
--- a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
@@ -4,9 +4,13 @@ Required properties:
 
  - compatible		 : "samsung,tm2-audio"
  - model		 : the user-visible name of this sound complex
- - audio-codec		 : the phandle of the wm5110 audio codec node,
-			   as described in ../mfd/arizona.txt
- - i2s-controller	 : the phandle of the I2S controller
+ - audio-codec		 : the first entry should be phandle of the wm5110 audio
+			   codec node, as described in ../mfd/arizona.txt;
+			   the second entry should be phandle of the HDMI
+			   transmitter node
+ - i2s-controller	 : the list of phandle and argument tuples pointing to
+			   I2S controllers, the first entry should be I2S0 and
+			   the second one I2S1
  - audio-amplifier	 : the phandle of the MAX98504 amplifier
  - samsung,audio-routing : a list of the connections between audio components;
 			   each entry is a pair of strings, the first being the
@@ -22,8 +26,8 @@ Example:
 
 sound {
 	compatible = "samsung,tm2-audio";
-	audio-codec = <&wm5110>;
-	i2s-controller = <&i2s0>;
+	audio-codec = <&wm5110>, <&hdmi>;
+	i2s-controller = <&i2s0 0>, <&i2s1 0>;
 	audio-amplifier = <&max98504>;
 	mic-bias-gpios = <&gpr3 2 0>;
 	model = "wm5110";
-- 
2.14.2
