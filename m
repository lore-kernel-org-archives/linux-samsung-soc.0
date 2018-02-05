From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 7/8] ASoC: samsung: Add missing #sound-dai-cells property
 documentation
Date: Mon, 05 Feb 2018 16:44:02 +0100
Message-ID: <20180205154403.13520-8-s.nawrocki@samsung.com>
References: <20180205154403.13520-1-s.nawrocki@samsung.com>
        <CGME20180205154533epcas2p2d0ed58188cf7f29751c08cd804f6fb0d@epcas2p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35755 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753317AbeBEPph (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 10:45:37 -0500
In-reply-to: <20180205154403.13520-1-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, jcsing.lee@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

The #sound-dai-cells property might be helpful in selecting primary
or secondary CPU DAI and it's already present in i2s nodes for some
exynos SoCs so let's add it to the DT binding documentation.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 Documentation/devicetree/bindings/sound/samsung-i2s.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
index 5d7bb2735824..dd1b6e329941 100644
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
@@ -54,6 +54,9 @@ in the IIS Multi Audio Interface.
 Note: Old DTs may not have the #clock-cells property and then not use the I2S
 node as a clock supplier.
 
+ - #sound-dai-cells: should be 1.
+
+
 Optional SoC Specific Properties:
 
 - samsung,idma-addr: Internal DMA register base address of the audio
@@ -79,4 +82,5 @@ i2s0: i2s@3830000 {
 	samsung,idma-addr = <0x03000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2s0_bus>;
+	#sound-dai-cells = <1>;
 };
-- 
2.14.2
