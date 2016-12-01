From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: Add DT bindings documentation for TM2 sound subsystem" to the asoc tree
Date: Thu, 01 Dec 2016 21:54:49 +0000
Message-ID: <E1cCZJZ-0000uP-Ru@debutante>
References: <1470752514-11409-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48390 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753817AbcLAVzC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 16:55:02 -0500
In-Reply-To: <1470752514-11409-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>broonie@kernel.org, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, k.kozlowski@samsung.com

The patch

   ASoC: samsung: Add DT bindings documentation for TM2 sound subsystem

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 48a760279ba31c59b8cfb14c5be9ed1c8e191038 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 2 Nov 2016 17:02:37 +0100
Subject: [PATCH] ASoC: samsung: Add DT bindings documentation for TM2 sound
 subsystem

This patch adds DT binding documentation for Exnos5433 based TM2
and TM2E boards sound subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/samsung,tm2-audio.txt           | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
new file mode 100644
index 000000000000..94442e5673b3
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
2.10.2
