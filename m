From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH V2 2/2] doc: dt bindings: Document Odroid X2/U3 audio subsystem
 bindings
Date: Wed, 18 Jun 2014 18:22:31 +0200
Message-ID: <1403108551-25058-3-git-send-email-s.nawrocki@samsung.com>
References: <1403108551-25058-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62758 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753270AbaFRQYE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 12:24:04 -0400
In-reply-to: <1403108551-25058-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree@vger.kernel.org, broonie@kernel.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, zhen1.chen@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, alsa-devel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../bindings/sound/samsung,odroidx2-max98090.txt   |   35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt b/Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt
new file mode 100644
index 0000000..9148f72
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,odroidx2-max98090.txt
@@ -0,0 +1,35 @@
+Samsung Exynos Odroid X2/U3 audio complex with MAX98090 codec
+
+Required properties:
+ - compatible : "samsung,odroidx2-audio" - for Odroid X2 board,
+		"samsung,odroidu3-audio" - for Odroid U3 board
+ - samsung,model : the user-visible name of this sound complex
+ - samsung,i2s-controller : the phandle of the I2S controller
+ - samsung,audio-codec : the phandle of the MAX98090 audio codec
+ - samsung,audio-routing : a list of the connections between audio
+   components;  each entry is a pair of strings, the first being the
+   connection's sink, the second being the connection's source;
+   valid names for sources and sinks are the MAX98090's pins (as
+   documented in its binding), and the jacks on the board
+   For Odroid X2:
+     * Headphone Jack
+     * Mic Jack
+     * DMIC
+
+   For Odroid U3:
+     * Headphone Jack
+     * Speakers
+
+Example:
+
+sound {
+	compatible = "samsung,odroidu3-audio";
+	samsung,i2s-controller = <&i2s0>;
+	samsung,audio-codec = <&max98090>;
+	samsung,model = "Odroid-X2";
+	samsung,audio-routing =
+		"Headphone Jack", "HPL",
+		"Headphone Jack", "HPR",
+		"IN1", "Mic Jack",
+		"Mic Jack", "MICBIAS";
+};
-- 
1.7.9.5
