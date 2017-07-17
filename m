From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [v4.13-rc1 fixes] ARM: dts: exynos: Add clocks to audss block to fix silent hang on Exynos4412
Date: Mon, 17 Jul 2017 21:45:27 +0200
Message-ID: <20170717194527.16559-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751316AbdGQTqB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 15:46:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>

Add necessary parent clocks for audss (Audio SubSystem, MAUDIO) clock
controller block.

This allows driver to keep EPLL enabled before accessing any MAUDIO
registers thus fixing silent hang.  This silent hang appeared with
commit 6edfa11cb396 ("clk: samsung: Add enable/disable operation for
PLL36XX clocks"), e.g. on Odroid U3 usually with last (but unrelated)
messages:

	[    2.382741] input: gpio_keys as /devices/platform/gpio_keys/input/input0
	[    2.405686] usb 1-3: new high-speed USB device number 3 using exynos-ehci
	[    2.419843] max77686-rtc max77686-rtc: setting system clock to 2017-06-21 17:04:13 UTC (1498064653)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---

Hi Arnd, Olof,

I have only one patch in fixes queue for v4.13, so how about applying this
directly without a pull request?


Best regards,
Krzysztof

---
 arch/arm/boot/dts/exynos4.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 497a9470c888..5739389f5bb8 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -59,6 +59,9 @@
 		compatible = "samsung,exynos4210-audss-clock";
 		reg = <0x03810000 0x0C>;
 		#clock-cells = <1>;
+		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_FOUT_EPLL>,
+			 <&clock CLK_SCLK_AUDIO0>, <&clock CLK_SCLK_AUDIO0>;
+		clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in";
 	};
 
 	i2s0: i2s@03830000 {
-- 
2.11.0
