From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: exynos: Add clocks to audss block to fix silent hang on Exynos4412
Date: Wed, 21 Jun 2017 21:08:07 +0200
Message-ID: <20170621190807.14850-3-krzk@kernel.org>
References: <20170621190807.14850-1-krzk@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170621190807.14850-1-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add necessary parent clocks for audss (Audio SubSystem, MAUDIO) clock
controller block.

This allows driver to keep EPLL enabled before accessing any MAUDIO
registers thus fixing silent hang.  This silent hang appeard with commit
6edfa11cb396 ("clk: samsung: Add enable/disable operation for PLL36XX
clocks"), e.g. on Odroid U3 usually with last (but unrelated) messages:

	[    2.382741] input: gpio_keys as /devices/platform/gpio_keys/input/input0
	[    2.405686] usb 1-3: new high-speed USB device number 3 using exynos-ehci
	[    2.419843] max77686-rtc max77686-rtc: setting system clock to 2017-06-21 17:04:13 UTC (1498064653)

Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
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
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
