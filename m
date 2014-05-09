From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 3/4] ARM: dts: Add usb2phy support on exynos5420
Date: Fri,  9 May 2014 18:53:03 +0530
Message-ID: <1399641784-10833-4-git-send-email-gautam.vivek@samsung.com>
References: <1399641784-10833-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399641784-10833-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add required device node for usb2phy to let enable USB 2.0
support.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---

Changes from v1:
 - Added node references for the phy node.

 arch/arm/boot/dts/exynos5420.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 5d5d6e3..ddd09a3 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -744,4 +744,14 @@
 		clock-names = "secss";
 		samsung,power-domain = <&g2d_pd>;
 	};
+
+	usb2_phy: phy@12130000 {
+		compatible = "samsung,exynos5250-usb2-phy";
+		reg = <0x12130000 0x100>;
+		clocks = <&clock CLK_USBH20>, <&clock CLK_SCLK_USBPHY300>;
+		clock-names = "phy", "ref";
+		#phy-cells = <1>;
+		samsung,sysreg-phandle = <&sysreg_system_controller>;
+		samsung,pmureg-phandle = <&pmu_system_controller>;
+	};
 };
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
