From: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 9/9] dts: Add usb2phy to Exynos 5250
Date: Fri, 20 Dec 2013 14:24:15 +0100
Message-ID: <1387545857-9472-10-git-send-email-k.debski@samsung.com>
References: <1387545857-9472-1-git-send-email-k.debski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1387545857-9472-1-git-send-email-k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Add support to PHY of USB2 of the Exynos 5250 SoC.

Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |   33 ++++++++++++-------
 drivers/phy/phy-exynos5250-usb2.c |   64 +++++++++++++++++++++++++++++++++----
 2 files changed, 78 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 2f264ad..922e0ed 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -163,6 +163,11 @@
 		interrupts = <0 47 0>;
 	};
 
+	sys_syscon: syscon@10040000 {
+		compatible = "samsung,exynos5250-sys", "syscon";
+		reg = <0x10050000 0x5000>;
+	};
+
 	pmu_syscon: syscon@10040000 {
 		compatible = "samsung,exynos5250-pmu", "syscon";
 		reg = <0x10040000 0x5000>;
@@ -505,6 +510,14 @@
 
 		clocks = <&clock 285>;
 		clock-names = "usbhost";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			phys = <&usb2_phy 1>;
+			phy-names = "host";
+			status = "ok";
+		};
 	};
 
 	usb@12120000 {
@@ -516,19 +529,15 @@
 		clock-names = "usbhost";
 	};
 
-	usb2_phy: usbphy@12130000 {
-		compatible = "samsung,exynos5250-usb2phy";
+	usb2_phy: phy@12130000 {
+		compatible = "samsung,exynos5250-usb2-phy";
 		reg = <0x12130000 0x100>;
-		clocks = <&clock 1>, <&clock 285>;
-		clock-names = "ext_xtal", "usbhost";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		usbphy-sys {
-			reg = <0x10040704 0x8>,
-			      <0x10050230 0x4>;
-		};
+		clocks = <&clock 285>, <&clock 1>, <&clock 1>, <&clock 1>,
+								<&clock 1>;
+		clock-names = "phy", "device", "host", "hsic0", "hsic1";
+		#phy-cells = <1>;
+		samsung,sysreg-phandle = <&sys_syscon>;
+		samsung,pmureg-phandle = <&pmu_syscon>;
 	};
 
 	amba {
diff --git a/drivers/phy/phy-exynos5250-usb2.c b/drivers/phy/phy-exynos5250-usb2.c
index b9b3b98..337bf82 100644
--- a/drivers/phy/phy-exynos5250-usb2.c
+++ b/drivers/phy/phy-exynos5250-usb2.c
@@ -58,7 +58,13 @@
 #define EXYNOS_5250_HOSTPHYCTRL2			0x20
 
 #define EXYNOS_5250_HOSTPHYCTRLX_REFCLKSEL_MASK		(0x3 << 23)
+#define EXYNOS_5250_HOSTPHYCTRLX_REFCLKSEL_DEFAULT	(0x2 << 23)
 #define EXYNOS_5250_HOSTPHYCTRLX_REFCLKDIV_MASK		(0x7f << 16)
+#define EXYNOS_5250_HOSTPHYCTRLX_REFCLKDIV_12		(0x24 << 16)
+#define EXYNOS_5250_HOSTPHYCTRLX_REFCLKDIV_15		(0x1c << 16)
+#define EXYNOS_5250_HOSTPHYCTRLX_REFCLKDIV_16		(0x1a << 16)
+#define EXYNOS_5250_HOSTPHYCTRLX_REFCLKDIV_19_2		(0x15 << 16)
+#define EXYNOS_5250_HOSTPHYCTRLX_REFCLKDIV_20		(0x14 << 16)
 #define EXYNOS_5250_HOSTPHYCTRLX_SIDDQ			BIT(6)
 #define EXYNOS_5250_HOSTPHYCTRLX_FORCESLEEP		BIT(5)
 #define EXYNOS_5250_HOSTPHYCTRLX_FORCESUSPEND		BIT(4)
@@ -191,13 +197,14 @@ static void exynos5250_isol(struct samsung_usb2_phy_instance *inst, bool on)
 	regmap_update_bits(drv->reg_pmu, offset, mask, on ? 0 : mask);
 }
 
-static void exynos5250_phy_pwr(struct samsung_usb2_phy_instance *inst, bool on)
+static int exynos5250_power_on(struct samsung_usb2_phy_instance *inst)
 {
 	struct samsung_usb2_phy_driver *drv = inst->drv;
 	u32 ctrl0;
 	u32 otg;
 	u32 ehci;
 	u32 ohci;
+	u32 hsic;
 
 	switch (inst->cfg->id) {
 	case EXYNOS5250_DEVICE:
@@ -234,6 +241,8 @@ static void exynos5250_phy_pwr(struct samsung_usb2_phy_instance *inst, bool on)
 
 		break;
 	case EXYNOS5250_HOST:
+	case EXYNOS5250_HSIC0:
+	case EXYNOS5250_HSIC1:
 		/* Host registers configuration */
 		ctrl0 = readl(drv->reg_phy + EXYNOS_5250_HOSTPHYCTRL0);
 		/* The clock */
@@ -279,6 +288,18 @@ static void exynos5250_phy_pwr(struct samsung_usb2_phy_instance *inst, bool on)
 			EXYNOS_5250_USBOTGSYS_LINK_SW_RST_UOTG |
 			EXYNOS_5250_USBOTGSYS_PHYLINK_SW_RESET);
 
+		/* HSIC phy configuration */
+		hsic = (EXYNOS_5250_HOSTPHYCTRLX_REFCLKDIV_12 |
+				EXYNOS_5250_HOSTPHYCTRLX_REFCLKSEL_DEFAULT |
+				EXYNOS_5250_HOSTPHYCTRLX_PHYSWRST);
+		writel(hsic, drv->reg_phy + EXYNOS_5250_HOSTPHYCTRL1);
+		writel(hsic, drv->reg_phy + EXYNOS_5250_HOSTPHYCTRL2);
+		udelay(10);
+		hsic &= ~EXYNOS_5250_HOSTPHYCTRLX_PHYSWRST;
+		writel(hsic, drv->reg_phy + EXYNOS_5250_HOSTPHYCTRL1);
+		writel(hsic, drv->reg_phy + EXYNOS_5250_HOSTPHYCTRL2);
+		udelay(80);
+
 		/* Enable EHCI DMA burst */
 		ehci = readl(drv->reg_phy + EXYNOS_5250_HOSTEHCICTRL);
 		ehci |=	EXYNOS_5250_HOSTEHCICTRL_ENAINCRXALIGN |
@@ -295,12 +316,7 @@ static void exynos5250_phy_pwr(struct samsung_usb2_phy_instance *inst, bool on)
 
 		break;
 	}
-}
-
-static int exynos5250_power_on(struct samsung_usb2_phy_instance *inst)
-{
 	inst->enabled = 1;
-	exynos5250_phy_pwr(inst, 1);
 	exynos5250_isol(inst, 0);
 
 	return 0;
@@ -308,9 +324,43 @@ static int exynos5250_power_on(struct samsung_usb2_phy_instance *inst)
 
 static int exynos5250_power_off(struct samsung_usb2_phy_instance *inst)
 {
+	struct samsung_usb2_phy_driver *drv = inst->drv;
+	u32 ctrl0;
+	u32 otg;
+	u32 hsic;
+
 	inst->enabled = 0;
 	exynos5250_isol(inst, 1);
-	exynos5250_phy_pwr(inst, 0);
+
+	switch (inst->cfg->id) {
+	case EXYNOS5250_DEVICE:
+		otg = readl(drv->reg_phy + EXYNOS_5250_USBOTGSYS);
+		otg |= (EXYNOS_5250_USBOTGSYS_FORCE_SUSPEND |
+			EXYNOS_5250_USBOTGSYS_SIDDQ_UOTG |
+			EXYNOS_5250_USBOTGSYS_FORCE_SLEEP);
+		writel(otg, drv->reg_phy + EXYNOS_5250_USBOTGSYS);
+		break;
+	case EXYNOS5250_HOST:
+		ctrl0 = readl(drv->reg_phy + EXYNOS_5250_HOSTPHYCTRL0);
+		ctrl0 |= (EXYNOS_5250_HOSTPHYCTRL0_SIDDQ |
+				EXYNOS_5250_HOSTPHYCTRL0_FORCESUSPEND |
+				EXYNOS_5250_HOSTPHYCTRL0_FORCESLEEP |
+				EXYNOS_5250_HOSTPHYCTRL0_PHYSWRST |
+				EXYNOS_5250_HOSTPHYCTRL0_PHYSWRSTALL);
+		writel(ctrl0, drv->reg_phy + EXYNOS_5250_HOSTPHYCTRL0);
+		break;
+	case EXYNOS5250_HSIC0:
+	case EXYNOS5250_HSIC1:
+		hsic = (EXYNOS_5250_HOSTPHYCTRLX_REFCLKDIV_12 |
+				EXYNOS_5250_HOSTPHYCTRLX_REFCLKSEL_DEFAULT |
+				EXYNOS_5250_HOSTPHYCTRLX_SIDDQ |
+				EXYNOS_5250_HOSTPHYCTRLX_FORCESLEEP |
+				EXYNOS_5250_HOSTPHYCTRLX_FORCESUSPEND
+				);
+		writel(hsic, drv->reg_phy + EXYNOS_5250_HOSTPHYCTRL1);
+		writel(hsic, drv->reg_phy + EXYNOS_5250_HOSTPHYCTRL2);
+		break;
+	}
 
 	return 0;
 }
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
