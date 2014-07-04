From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH V3 1/2] doc: dt bindings: Document Odroid X2/U3 audio subsystem
 bindings
Date: Fri, 04 Jul 2014 15:13:44 +0200
Message-ID: <1404479625-25385-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59850 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299AbaGDNOR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 09:14:17 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v2:
 - none.
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
