From: Inha Song <ideal.song@samsung.com>
Subject: [alsa-devel] [PATCH v3 2/4] ASoC: samsung: Document Trats2 audio
 subsystem bindings
Date: Thu, 22 Jan 2015 20:18:00 +0900
Message-ID: <1421925482-15861-3-git-send-email-ideal.song@samsung.com>
References: <1421925482-15861-1-git-send-email-ideal.song@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10062 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727AbbAVLSX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Jan 2015 06:18:23 -0500
In-reply-to: <1421925482-15861-1-git-send-email-ideal.song@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, s.nawrocki@samsung.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, kgene@kernel.org, sbkim73@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This patch add Trats2 audio subsystem bindings document.

Signed-off-by: Inha Song <ideal.song@samsung.com>
---
 .../bindings/sound/samsung,trats2-wm1811.txt       | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,trats2-wm1811.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,trats2-wm1811.txt b/Documentation/devicetree/bindings/sound/samsung,trats2-wm1811.txt
new file mode 100644
index 0000000..319ff07
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,trats2-wm1811.txt
@@ -0,0 +1,25 @@
+Samsung Exynos Trats2 audio with WM1811 codec
+
+Required properties:
+
+ - compatible : Must be "samsung,trats2-audio"
+ - samsung,i2s-controller : The phandle of the I2S controller
+ - samsung,model : The user visible name of this sound
+ - samsung,audio-codec : The phandle of the WM1811 audio codec
+ - samsung,audio-routing : A list of the connections between audio
+   components. each entry is a pair of strings, the first being the
+   connection's sink, the second being the connection's source
+
+Example:
+
+sound {
+	compatible = "samsung,trats2-audio";
+	samsung,i2s-controller = <&i2s0>;
+	samsung,model = "Trats2";
+	samsung,audio-codec = <&wm1811>;
+	samsung,audio-routing =
+			"SPK", "SPKOUTLN",
+			"SPK", "SPKOUTLP",
+			"SPK", "SPKOUTRN",
+			"SPK", "SPKOUTRP";
+};
-- 
2.0.0.390.gcb682f8
