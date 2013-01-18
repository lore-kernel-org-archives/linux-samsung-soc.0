From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V6 07/10] ASoC: SMDK: WM8994: Add device tree support for
 machine file
Date: Fri, 18 Jan 2013 17:17:06 +0530
Message-ID: <1358509629-20471-8-git-send-email-padma.v@samsung.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60691 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001Ab3ARL5X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 06:57:23 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGT00F4FL75PXE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:57:21 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGT00LG7KPYX890@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:57:21 +0900 (KST)
In-reply-to: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org

Add the basic device tree based lookup.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 .../bindings/sound/samsung,smdk-wm8994.txt         |   14 ++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |   18 +++++++++++--
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++--
 sound/soc/samsung/smdk_wm8994.c                    |   26 ++++++++++++++++++++
 4 files changed, 58 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
new file mode 100644
index 0000000..4686646f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
@@ -0,0 +1,14 @@
+Samsung SMDK audio complex
+
+Required properties:
+- compatible : "samsung,smdk-wm8994"
+- samsung,i2s-controller: The phandle of the Samsung I2S0 controller
+- samsung,audio-codec: The phandle of the WM8994 audio codec
+Example:
+
+sound {
+		compatible = "samsung,smdk-wm8994";
+
+		samsung,i2s-controller = <&i2s0>;
+		samsung,audio-codec = <&wm8994>;
+};
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 9516da8..4db9db0 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -49,6 +49,11 @@
 			compatible = "samsung,s524ad0xd1";
 			reg = <0x51>;
 		};
+
+		wm8994: wm8994@1a {
+			 compatible = "wlf,wm8994";
+			 reg = <0x1a>;
+		};
 	};
 
 	i2c@121D0000 {
@@ -205,17 +210,24 @@
 		samsung,mfc-l = <0x51000000 0x800000>;
 	};
 
-	i2s@03830000 {
+	i2s0: i2s@03830000 {
 		gpios = <&gpz 0 2 0 0>, <&gpz 1 2 0 0>, <&gpz 2 2 0 0>,
 			<&gpz 3 2 0 0>, <&gpz 4 2 0 0>, <&gpz 5 2 0 0>,
 			<&gpz 6 2 0 0>;
 	};
 
-	i2s@12D60000 {
+	i2s1: i2s@12D60000 {
 		status = "disabled";
 	};
 
-	i2s@12D70000 {
+	i2s2: i2s@12D70000 {
 		status = "disabled";
 	};
+
+	sound {
+		compatible = "samsung,smdk-wm8994";
+
+		samsung,i2s-controller = <&i2s0>;
+		samsung,audio-codec = <&wm8994>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 7e51e69..3aaa8ce 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -275,7 +275,7 @@
 		#size-cells = <0>;
 	};
 
-	i2s@03830000 {
+	i2s0: i2s@03830000 {
 		compatible = "samsung,i2s-v5";
 		reg = <0x03830000 0x100>;
 		dmas = <&pdma0 10
@@ -288,7 +288,7 @@
 		samsung,idma-addr = <0x03000000>;
 	};
 
-	i2s@12D60000 {
+	i2s1: i2s@12D60000 {
 		compatible = "samsung,i2s-v5";
 		reg = <0x12D60000 0x100>;
 		dmas = <&pdma1 12
@@ -296,7 +296,7 @@
 		dma-names = "tx", "rx";
 	};
 
-	i2s@12D70000 {
+	i2s2: i2s@12D70000 {
 		compatible = "samsung,i2s-v5";
 		reg = <0x12D70000 0x100>;
 		dmas = <&pdma0 12
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index cc2f407..581ea4a 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -10,6 +10,7 @@
 #include "../codecs/wm8994.h"
 #include <sound/pcm_params.h>
 #include <linux/module.h>
+#include <linux/of.h>
 
  /*
   * Default CFG switch settings to use this driver:
@@ -153,9 +154,25 @@ static struct snd_soc_card smdk = {
 static int smdk_audio_probe(struct platform_device *pdev)
 {
 	int ret;
+	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &smdk;
 
 	card->dev = &pdev->dev;
+
+	if (np) {
+		smdk_dai[0].cpu_dai_name = NULL;
+		smdk_dai[0].cpu_of_node = of_parse_phandle(np,
+				"samsung,i2s-controller", 0);
+		if (!smdk_dai[0].cpu_of_node) {
+			dev_err(&pdev->dev,
+			   "Property 'samsung,i2s-controller' missing or invalid\n");
+			ret = -EINVAL;
+		}
+
+		smdk_dai[0].platform_name = NULL;
+		smdk_dai[0].platform_of_node = smdk_dai[0].cpu_of_node;
+	}
+
 	ret = snd_soc_register_card(card);
 
 	if (ret)
@@ -173,10 +190,19 @@ static int smdk_audio_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id samsung_wm8994_of_match[] = {
+	{ .compatible = "samsung,smdk-wm8994", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, samsung_wm8994_of_match);
+#endif /* CONFIG_OF */
+
 static struct platform_driver smdk_audio_driver = {
 	.driver		= {
 		.name	= "smdk-audio",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(samsung_wm8994_of_match),
 	},
 	.probe		= smdk_audio_probe,
 	.remove		= smdk_audio_remove,
-- 
1.7.4.4
