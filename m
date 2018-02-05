From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 6/8] ASoC: samsung: i2s: Update clock-output-names property
 documentation
Date: Mon, 05 Feb 2018 16:44:01 +0100
Message-ID: <20180205154403.13520-7-s.nawrocki@samsung.com>
References: <20180205154403.13520-1-s.nawrocki@samsung.com>
        <CGME20180205154529epcas2p3478546ef61294ac06cd9d8ed3d7e12c9@epcas2p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35746 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753300AbeBEPpc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 10:45:32 -0500
In-reply-to: <20180205154403.13520-1-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, jcsing.lee@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

The clock-output-names property is marked as deprecated. While at it,
#clock-cells property's value is corrected in the example snippet
and few typos are fixed.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../devicetree/bindings/sound/samsung-i2s.txt          | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
index bf100cd0d0f7..5d7bb2735824 100644
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
@@ -7,7 +7,7 @@ Required SoC Specific Properties:
    - samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
      secondary fifo, s/w reset control and internal mux for root clk src.
    - samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
-     playback, sterio channel capture, secondary fifo using internal
+     playback, stereo channel capture, secondary fifo using internal
      or external dma, s/w reset control, internal mux for root clk src
      and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
      is to allow transfer of multiple channel audio data on single data line.
@@ -25,7 +25,7 @@ Required SoC Specific Properties:
   These strings correspond 1:1 with the ordered pairs in dmas.
 - clocks: Handle to iis clock and RCLK source clk.
 - clock-names:
-  i2s0 uses some base clks from CMU and some are from audio subsystem internal
+  i2s0 uses some base clocks from CMU and some are from audio subsystem internal
   clock controller. The clock names for i2s0 should be "iis", "i2s_opclk0" and
   "i2s_opclk1" as shown in the example below.
   i2s1 and i2s2 uses clocks from CMU. The clock names for i2s1 and i2s2 should
@@ -36,8 +36,8 @@ Required SoC Specific Properties:
 - #clock-cells: should be 1, this property must be present if the I2S device
   is a clock provider in terms of the common clock bindings, described in
   ../clock/clock-bindings.txt.
-- clock-output-names: from the common clock bindings, names of the CDCLK
-  I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
+- clock-output-names (deprecated): from the common clock bindings, names of
+  the CDCLK I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
   "i2s_cdclk3" for the I2S0, I2S1, I2S2 devices recpectively.
 
 There are following clocks available at the I2S device nodes:
@@ -49,9 +49,10 @@ There are following clocks available at the I2S device nodes:
 
 Refer to the SoC datasheet for availability of the above clocks.
 The CLK_I2S_RCLK_PSR and CLK_I2S_RCLK_SRC clocks are usually only available
-in the IIS Multi Audio Interface (I2S0).
-Note: Old DTs may not have the #clock-cells, clock-output-names properties
-and then not use the I2S node as a clock supplier.
+in the IIS Multi Audio Interface.
+
+Note: Old DTs may not have the #clock-cells property and then not use the I2S
+node as a clock supplier.
 
 Optional SoC Specific Properties:
 
@@ -74,8 +75,7 @@ i2s0: i2s@3830000 {
 		<&clock_audss EXYNOS_I2S_BUS>,
 		<&clock_audss EXYNOS_SCLK_I2S>;
 	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
-	#clock-cells;
-	clock-output-names = "i2s_cdclk0";
+	#clock-cells = <1>;
 	samsung,idma-addr = <0x03000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2s0_bus>;
-- 
2.14.2
