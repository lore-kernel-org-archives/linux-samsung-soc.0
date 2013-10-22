From: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 7/7] ARM: dts: update hdmiphy dt node for exynos5420
Date: Tue, 22 Oct 2013 15:41:08 +0530
Message-ID: <1382436668-15813-8-git-send-email-rahul.sharma@samsung.com>
References: <1382436668-15813-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1382436668-15813-1-git-send-email-rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

hdmiphy dt node needs a child node called 'phy-power-control'
which represents the PMU register for power controlling the
hdmiphy.

hdmi driver dt node provides phy property which points to
the hdmiphy dt node.

Signed-off-by: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index ed687ac..f7fb337 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -207,7 +207,7 @@
 	};
 
 	hdmi@14530000 {
-		compatible = "samsung,exynos4212-hdmi";
+		compatible = "samsung,exynos5420-hdmi";
 		reg = <0x14530000 0x70000>;
 		interrupts = <0 95 0>;
 		clocks = <&clock 413>, <&clock 143>, <&clock 768>,
@@ -215,6 +215,18 @@
 		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
 			"sclk_hdmiphy", "mout_hdmi";
 		status = "disabled";
+		phy = <&hdmiphy>;
+	};
+
+	hdmiphy: hdmiphy@145D0000 {
+		compatible = "samsung,exynos5420-hdmiphy";
+		reg = <0x145D0000 0x20>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		phy-power-control {
+			reg = <0x10040700 0x04>;
+		};
 	};
 
 	mixer@14450000 {
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
