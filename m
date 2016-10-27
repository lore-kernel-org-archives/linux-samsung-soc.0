From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: exynos: Document eMMC/SD/SDIO devices in Exynos5800 Peach Pi board
Date: Thu, 27 Oct 2016 14:11:43 -0300
Message-ID: <1477588303-13681-3-git-send-email-javier@osg.samsung.com>
References: <1477588303-13681-1-git-send-email-javier@osg.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477588303-13681-1-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

There's a cognitive load to figure out which mmc device nodes corresponds
to the eMMC flash, uSD card and WiFI SDIO module on the Peach Pi board.

So it's better to have comments in the DTS to make this more clear.

Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
---

 arch/arm/boot/dts/exynos5800-peach-pi.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 01f466816fea..f9ff7f07ae0c 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -665,6 +665,7 @@
 	status = "okay";
 };
 
+/* eMMC flash */
 &mmc_0 {
 	status = "okay";
 	num-slots = <1>;
@@ -683,6 +684,7 @@
 	bus-width = <8>;
 };
 
+/* WiFi SDIO module */
 &mmc_1 {
 	status = "okay";
 	num-slots = <1>;
@@ -702,6 +704,7 @@
 	vqmmc-supply = <&buck10_reg>;
 };
 
+/* uSD card */
 &mmc_2 {
 	status = "okay";
 	num-slots = <1>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
