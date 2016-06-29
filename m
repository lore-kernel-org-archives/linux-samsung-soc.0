From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: Add DT bindings documentation for max98504 amplifier" to the asoc tree
Date: Wed, 29 Jun 2016 20:23:18 +0100
Message-ID: <E1bIL4w-00085G-0O@finisterre>
References: <1467199599-6892-4-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58540 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751858AbcF3MPr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 08:15:47 -0400
In-Reply-To: <1467199599-6892-4-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, robh@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, inki.dae@samsung.com, devicetree@vger.kernel.org, ideal.song@samsung.com

The patch

   ASoC: Add DT bindings documentation for max98504 amplifier

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

>From 51ded0fbc18c5c05782c1c7eba30264b524added Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 29 Jun 2016 13:26:36 +0200
Subject: [PATCH] ASoC: Add DT bindings documentation for max98504 amplifier

This patch adds DT bindings documentation for Maxim MAX98504
speaker amplifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/max98504.txt         | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/max98504.txt

diff --git a/Documentation/devicetree/bindings/sound/max98504.txt b/Documentation/devicetree/bindings/sound/max98504.txt
new file mode 100644
index 000000000000..583ed5fdfb28
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/max98504.txt
@@ -0,0 +1,44 @@
+Maxim MAX98504 class D mono speaker amplifier
+
+This device supports I2C control interface and an IRQ output signal. It features
+a PCM and PDM digital audio interface (DAI) and a differential analog input.
+
+Required properties:
+
+ - compatible : "maxim,max98504"
+ - reg : should contain the I2C slave device address
+ - DVDD-supply, DIOVDD-supply, PVDD-supply: power supplies for the device,
+   as covered in ../regulator/regulator.txt
+ - interrupts : should specify the interrupt line the device is connected to,
+   as described in ../interrupt-controller/interrupts.txt
+
+Optional properties:
+
+ - maxim,brownout-threshold - the PVDD brownout threshold, the value must be
+   from 0, 1...21 range, corresponding to 2.6V, 2.65V...3.65V voltage range
+ - maxim,brownout-attenuation - the brownout attenuation to the speaker gain
+   applied during the "attack hold" and "timed hold" phase, the value must be
+   from 0...6 (dB) range
+ - maxim,brownout-attack-hold-ms - the brownout attack hold phase time in ms,
+   0...255 (VBATBROWN_ATTK_HOLD, register 0x0018)
+ - maxim,brownout-timed-hold-ms - the brownout timed hold phase time in ms,
+   0...255 (VBATBROWN_TIME_HOLD, register 0x0019)
+ - maxim,brownout-release-rate-ms - the brownout release phase step time in ms,
+   0...255 (VBATBROWN_RELEASE, register 0x001A)
+
+The default value when the above properties are not specified is 0,
+the maxim,brownout-threshold property must be specified to actually enable
+the PVDD brownout protection.
+
+Example:
+
+ max98504@31 {
+	compatible = "maxim,max98504";
+	reg = <0x31>;
+	interrupt-parent = <&gpio_bank_0>;
+	interrupts = <2 0>;
+
+	DVDD-supply = <&regulator>;
+	DIOVDD-supply = <&regulator>;
+	PVDD-supply = <&regulator>;
+};
-- 
2.8.1
