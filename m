From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] ARM: dts: Fix booting on Rinato market device
Date: Fri, 07 Nov 2014 12:44:22 +0100
Message-ID: <1415360662-30390-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The bootloader on market Rinato (Gear 2) device checks for revision in
compatible field of DTB. If it is not present or lower than required
then booting fails with: "Could not do normal boot. (no DTB found)".

Log of bootloader in case of failure:
h/w: revision  = 0x06
h/w: schematic = SM-R380_Rev0.5_Final_0205
date = 2000/01/01 12:00:21 (UTC)
cmu_div:4, div:5, src_clk:800000000, pixel_clk:31860720
load_kernel: loading boot image from 57344.. (BOOT)
load_kernel: found zImage, size: 0x3267e8
0xbc Error!
Verify_Binary_Signature: failed.
pit_check_signature (BOOT) invalid.
load_kernel: found custom kernel (ret:-2147483647)
 No need to update kernel type.
Detected board: samsung,rinato-rev06
Could not do normal boot. (no DTB found)
: Entering usb mode for SM-R380_EUR_XX (65535)..

Add a "rev06" suffix to compatible to satisfy the bootloader.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos3250-rinato.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 84380fa13e37..f72ba0a1d915 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -18,7 +18,8 @@
 
 / {
 	model = "Samsung Rinato board";
-	compatible = "samsung,rinato", "samsung,exynos3250", "samsung,exynos3";
+	compatible = "samsung,rinato", "samsung,rinato-rev06",
+			"samsung,exynos3250", "samsung,exynos3";
 
 	aliases {
 		i2c7 = &i2c_max77836;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
