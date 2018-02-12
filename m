From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 1/7] ASoC: samsung: i2s: Update
 clock-output-names property documentation
Date: Mon, 12 Feb 2018 17:15:32 +0100
Message-ID: <20180212161538.22669-2-s.nawrocki@samsung.com>
References: <20180212161538.22669-1-s.nawrocki@samsung.com>
 <CGME20180212161636epcas2p25f894b22e938ea8f3371196e7e90c169@epcas2p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20180212161538.22669-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: broonie@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, jcsing.lee@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The clock-output-names property is marked as deprecated. While at it,
and few typos are fixed.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/samsung-i2s.txt        | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
index bf100cd0d0f7..c1f508f18ac8 100644
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
@@ -36,9 +36,9 @@ Required SoC Specific Properties:
 - #clock-cells: should be 1, this property must be present if the I2S device
   is a clock provider in terms of the common clock bindings, described in
   ../clock/clock-bindings.txt.
-- clock-output-names: from the common clock bindings, names of the CDCLK
-  I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
-  "i2s_cdclk3" for the I2S0, I2S1, I2S2 devices recpectively.
+- clock-output-names (deprecated): from the common clock bindings, names of
+  the CDCLK I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
+  "i2s_cdclk3" for the I2S0, I2S1, I2S2 devices respectively.
 
 There are following clocks available at the I2S device nodes:
  CLK_I2S_CDCLK    - the CDCLK (CODECLKO) gate clock,
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
