From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v8 06/17] dt-bindings: add document for analogix display port driver
Date: Wed, 28 Oct 2015 16:26:33 +0800
Message-ID: <1446020793-10532-1-git-send-email-ykk@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446020143-32645-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Analogix dp driver is split from exynos dp driver, so we just
make an copy of exynos_dp.txt, and then simplify exynos_dp.txt

Beside update some exynos dtsi file with the latest change
according to the devicetree binding documents.

Tested-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Changes in v8:
- Correct the right document path of display-timing.txt (Heiko)
- Correct the misspell of 'from' to 'frm'. (Heiko)

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4:
- Split all DTS changes, and provide backward compatibility. Mark old
  properties as deprecated but still support them. (Krzysztof)
- Update "analogix,hpd-gpio" to "hpd-gpios" prop name. (Rob)
- Deprecated some properties which could parsed from Edid/Mode/DPCD. (Thierry)
    "analogix,color-space" & "analogix,color-depth"   &
    "analogix,link-rate"   & "analogix,lane-count"    &
    "analogix,ycbcr-coeff" & "analogix,dynamic-range" &
    "vsync-active-high"    & "hsync-active-high"      & "interlaces"

Changes in v3:
- Add devicetree binding documents. (Heiko)
- Remove sync pol & colorimetry properies from the new analogix dp driver
  devicetree binding. (Thierry)
- Update the exist exynos dtsi file with the latest DP DT properies.

Changes in v2: None

 .../bindings/display/bridge/analogix_dp.txt        | 50 +++++++++++++++++
 .../bindings/display/exynos/exynos_dp.txt          | 65 ++++++++--------------
 2 files changed, 72 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix_dp.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
new file mode 100644
index 0000000..7659a7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
@@ -0,0 +1,50 @@
+Analogix Display Port bridge bindings
+
+Required properties for dp-controller:
+	-compatible:
+		platform specific such as:
+		 * "samsung,exynos5-dp"
+		 * "rockchip,rk3288-dp"
+	-reg:
+		physical base address of the controller and length
+		of memory mapped region.
+	-interrupts:
+		interrupt combiner values.
+	-clocks:
+		from common clock binding: handle to dp clock.
+	-clock-names:
+		from common clock binding: Shall be "dp".
+	-interrupt-parent:
+		phandle to Interrupt combiner node.
+	-phys:
+		from general PHY binding: the phandle for the PHY device.
+	-phy-names:
+		from general PHY binding: Should be "dp".
+
+Optional properties for dp-controller:
+	-hpd-gpios:
+		Hotplug detect GPIO.
+		Indicates which GPIO should be used for hotplug detection
+	-port@[X]: SoC specific port nodes with endpoint definitions as defined
+		in Documentation/devicetree/bindings/media/video-interfaces.txt,
+		please refer to the SoC specific binding document:
+		* Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
+		* Documentation/devicetree/bindings/video/analogix_dp-rockchip.txt
+
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+-------------------------------------------------------------------------------
+
+Example:
+
+	dp-controller {
+		compatible = "samsung,exynos5-dp";
+		reg = <0x145b0000 0x10000>;
+		interrupts = <10 3>;
+		interrupt-parent = <&combiner>;
+		clocks = <&clock 342>;
+		clock-names = "dp";
+
+		phys = <&dp_phy>;
+		phy-names = "dp";
+	};
diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
index 7a3a9cd..9905081 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
@@ -31,45 +31,31 @@ Required properties for dp-controller:
 		from general PHY binding: the phandle for the PHY device.
 	-phy-names:
 		from general PHY binding: Should be "dp".
-	-samsung,color-space:
-		input video data format.
-			COLOR_RGB = 0, COLOR_YCBCR422 = 1, COLOR_YCBCR444 = 2
-	-samsung,dynamic-range:
-		dynamic range for input video data.
-			VESA = 0, CEA = 1
-	-samsung,ycbcr-coeff:
-		YCbCr co-efficients for input video.
-			COLOR_YCBCR601 = 0, COLOR_YCBCR709 = 1
-	-samsung,color-depth:
-		number of bits per colour component.
-			COLOR_6 = 0, COLOR_8 = 1, COLOR_10 = 2, COLOR_12 = 3
-	-samsung,link-rate:
-		link rate supported by the panel.
-			LINK_RATE_1_62GBPS = 0x6, LINK_RATE_2_70GBPS = 0x0A
-	-samsung,lane-count:
-		number of lanes supported by the panel.
-			LANE_COUNT1 = 1, LANE_COUNT2 = 2, LANE_COUNT4 = 4
-	- display-timings: timings for the connected panel as described by
-		Documentation/devicetree/bindings/video/display-timing.txt
 
 Optional properties for dp-controller:
-	-interlaced:
-		interlace scan mode.
-			Progressive if defined, Interlaced if not defined
-	-vsync-active-high:
-		VSYNC polarity configuration.
-			High if defined, Low if not defined
-	-hsync-active-high:
-		HSYNC polarity configuration.
-			High if defined, Low if not defined
-	-samsung,hpd-gpio:
-		Hotplug detect GPIO.
-			Indicates which GPIO should be used for hotplug
-			detection
-	-video interfaces: Device node can contain video interface port
-			    nodes according to [1].
+	- display-timings: timings for the connected panel as described by
+		Documentation/devicetree/bindings/display/panel/display-timing.txt
+
+For the below properties, please refer to Analogix DP binding document:
+ * Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
+	-phys (required)
+	-phy-names (required)
+	-hpd-gpios (optional)
+	-video interfaces (optional)
 
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+Deprecated properties for DisplayPort:
+-interlaced:            deprecated prop that can parsed from drm_display_mode.
+-vsync-active-high:     deprecated prop that can parsed from drm_display_mode.
+-hsync-active-high:     deprecated prop that can parsed from drm_display_mode.
+-samsung,ycbcr-coeff:   deprecated prop that can parsed from drm_display_mode.
+-samsung,dynamic-range: deprecated prop that can parsed from drm_display_mode.
+-samsung,color-space:   deprecated prop that can parsed from drm_display_info.
+-samsung,color-depth:   deprecated prop that can parsed from drm_display_info.
+-samsung,link-rate:     deprecated prop that can reading from monitor by dpcd method.
+-samsung,lane-count:    deprecated prop that can reading from monitor by dpcd method.
+-samsung,hpd-gpio:      deprecated name for hpd-gpios.
+
+-------------------------------------------------------------------------------
 
 Example:
 
@@ -88,13 +74,6 @@ SOC specific portion:
 
 Board Specific portion:
 	dp-controller {
-		samsung,color-space = <0>;
-		samsung,dynamic-range = <0>;
-		samsung,ycbcr-coeff = <0>;
-		samsung,color-depth = <1>;
-		samsung,link-rate = <0x0a>;
-		samsung,lane-count = <4>;
-
 		display-timings {
 			native-mode = <&lcd_timing>;
 			lcd_timing: 1366x768 {
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
