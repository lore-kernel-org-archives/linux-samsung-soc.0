From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: dts: Specify Odroid X2/U3 audio clock parents and rates
Date: Wed, 10 Sep 2014 16:43:43 +0200
Message-ID: <1410360223-18363-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37244 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752040AbaIJOny (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Sep 2014 10:43:54 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NBO00B2CWX5XR00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Sep 2014 23:43:53 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This ensures the core and the audio subsystem clocks are configured
properly, as expected by the sound machine driver. These bits are
missing to obtain proper audio sample rates in kernel v3.17, where
audio support for Odroid X2/U3 was first added.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
It would be good to have it applied as a fix for v3.17.

 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index adadaf9..b40f766 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -45,6 +45,16 @@
 		compatible = "samsung,odroidx2-audio";
 		samsung,i2s-controller = <&i2s0>;
 		samsung,audio-codec = <&max98090>;
+		assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
+				<&clock_audss EXYNOS_MOUT_I2S>,
+				<&clock_audss EXYNOS_DOUT_SRP>,
+				<&clock_audss EXYNOS_DOUT_AUD_BUS>;
+		assigned-clock-parents = <&clock CLK_FOUT_EPLL>,
+				<&clock_audss EXYNOS_MOUT_AUDSS>;
+		assigned-clock-rates = <0>,
+				<0>,
+				<192000000>,
+				<19200000>;
 	};

 	mmc@12550000 {
--
1.7.9.5
