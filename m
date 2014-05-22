From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/2] doc: dt bindings: Document Odroid X2/U3 audio subsystem
 bindings
Date: Thu, 22 May 2014 13:55:07 +0200
Message-ID: <1400759708-25831-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59036 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752786AbaEVL4K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 07:56:10 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../bindings/sound/samsung,odroidx2-max98090.txt   |   32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt b/Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt
new file mode 100644
index 0000000..b37e79a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt
@@ -0,0 +1,32 @@
+Odroid X2/U3 audio complex
+
+Required properties:
+- compatible		 : "samsung,odroidx2-audio"
+- samsung,i2s-controller : phandle to the I2S controller
+- samsung,audio-codec	 : phandle to the audio codec
+
+Example:
+
+	i2s0: i2s@03830000 {
+		...
+		clocks = <&clock_audss EXYNOS_I2S_BUS>,
+			 <&clock_audss EXYNOS_DOUT_AUD_BUS>;
+		clock-names = "iis", "i2s_opclk0";
+		status = "okay";
+	};
+
+	i2c@13870000 {
+		...
+		max98090: max98090@10 {
+			compatible = "maxim,max98090";
+			reg = <0x10>;
+			interrupt-parent = <&gpx0>;
+			interrupts = <1 0>;
+		};
+	};
+
+	sound {
+		compatible = "samsung,odroidx2-audio";
+		samsung,i2s-controller = <&i2s0>;
+		samsung,audio-codec = <&max98090>;
+	};
-- 
1.7.9.5
