From: Inha Song <ideal.song@samsung.com>
Subject: [alsa-devel] [PATCH 2/3] ASoC: samsung: Document Trats2 audio
 subsystem bindings
Date: Mon, 05 Jan 2015 20:25:16 +0900
Message-ID: <1420457117-11030-3-git-send-email-ideal.song@samsung.com>
References: <1420457117-11030-1-git-send-email-ideal.song@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1420457117-11030-1-git-send-email-ideal.song@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alsa-devel@alsa-project.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, s.nawrocki@samsung.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, kgene@kernel.org, sbkim73@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch add Trats2 audio subsystem bindings document.

Signed-off-by: Inha Song <ideal.song@samsung.com>
---
 .../bindings/sound/samsung,trats2-wm1811.txt       | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,trats2-wm1811.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,trats2-wm1811.txt b/Documentation/devicetree/bindings/sound/samsung,trats2-wm1811.txt
new file mode 100644
index 0000000..9d4d3f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,trats2-wm1811.txt
@@ -0,0 +1,31 @@
+Samsung Exynos Trats2 audio with WM1811 codec
+
+Required properties:
+
+ - compatible : Must be "samsung,trats2-audio"
+
+ - clocks : Reference to the codec master clock
+ - clock-names : The clock should be named "mclk"
+
+ - samsung,i2s-controller : The phandle of the I2S controller
+
+ - samsung,model : The user visible name of this sound
+
+ - samsung,audio-routing : A list of the connections between audio
+   components. each entry is a pair of strings, the first being the
+   connection's sink, the second being the connection's source
+
+Example:
+
+sound {
+	compatible = "samsung,trats2-audio";
+	clocks = <&pmu_system_controller 0>;
+	clock-names = "mclk";
+	samsung,i2s-controller = <&i2s0>;
+	samsung,model = "wm1811";
+	samsung,audio-routing =
+			"SPK", "SPKOUTLN",
+			"SPK", "SPKOUTLP",
+			"SPK", "SPKOUTRN",
+			"SPK", "SPKOUTRP";
+};
-- 
2.0.0.390.gcb682f8
