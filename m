From: Chanho Park <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCHv5 4/4] ARM: dts: exynos4412-trats2: enable usb nodes
Date: Tue, 20 May 2014 11:06:30 +0900
Message-ID: <1400551590-7772-5-git-send-email-chanho61.park@samsung.com>
References: <1400551590-7772-1-git-send-email-chanho61.park@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1400551590-7772-1-git-send-email-chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chanho Park <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch enables exynos_usbphy and hsotg device nodes.

Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Chanho Park <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index f621fd9..ec077cf 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -732,6 +732,16 @@
 		};
 	};
 
+	exynos-usbphy@125B0000 {
+		status = "okay";
+	};
+
+	hsotg@12480000 {
+		vusb_d-supply = <&ldo15_reg>;
+		vusb_a-supply = <&ldo12_reg>;
+		status = "okay";
+	};
+
 	thermistor-ap@0 {
 		compatible = "ntc,ncp15wb473";
 		pullup-uv = <1800000>;	 /* VCC_1.8V_AP */
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
