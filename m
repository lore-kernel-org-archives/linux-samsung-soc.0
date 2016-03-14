From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 08/10] ARM: dts: Add rtc and adc dt node for exynos3250-artik5
 module
Date: Mon, 14 Mar 2016 11:04:14 +0900
Message-ID: <1457921056-21257-10-git-send-email-cw00.choi@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1457921056-21257-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds the RTC (Real Time Clock) and ADC (Analog Digital Converter)
Device Tree node for exynos3250-artik5 module. The RTC is used for wakeup
source and the ADC is used to read the analog data such as battery temperature.

ADC need to connect the some H/W device such as battery. So, this patch just
adds the default setting (clock, regulator).

Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos3250-artik5.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
index 877e4827df83..673883fda480 100644
--- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
@@ -48,6 +48,12 @@
 	};
 };
 
+&adc {
+	vdd-supply = <&ldo7_reg>;
+	assigned-clocks = <&cmu CLK_SCLK_TSADC>;
+	assigned-clock-rates = <6000000>;
+};
+
 &cpu0 {
 	cpu0-supply = <&buck2_reg>;
 };
@@ -319,6 +325,12 @@
 	status = "okay";
 };
 
+&rtc {
+	clocks = <&cmu CLK_RTC>, <&s2mps14_osc S2MPS11_CLK_AP>;
+	clock-names = "rtc", "rtc_src";
+	status = "okay";
+};
+
 &xusbxti {
 	clock-frequency = <24000000>;
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
