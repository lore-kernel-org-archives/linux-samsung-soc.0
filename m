From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 2/3] ARM: exynos5250: dts: Enabling dwc3-exynos driver
Date: Fri, 15 Mar 2013 13:32:13 +0530
Message-ID: <1363334534-21901-3-git-send-email-gautam.vivek@samsung.com>
References: <1363334534-21901-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1363334534-21901-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Adding DWC3 device tree node for Exynos5250 needed to
parse device tree data.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |   20 ++++++++++++++++++--
 1 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 5b6f8c8..e0feedb 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -398,7 +398,23 @@
 		dma-names = "tx", "rx";
 	};
 
-	usbphy@12100000 {
+	usb@12000000 {
+		compatible = "samsung,exynos5250-dwusb3";
+		clocks = <&clock 286>;
+		clock-names = "usbdrd30";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		dwc3 {
+			compatible = "synopsys,dwc3";
+			reg = <0x12000000 0x10000>;
+			interrupts = <0 72 0>;
+			usb-phy = <&usb2_phy &usb3_phy>;
+		};
+	};
+
+	usb3_phy: usbphy@12100000 {
 		compatible = "samsung,exynos5250-usb3phy";
 		reg = <0x12100000 0x100>;
 		clocks = <&clock 1>, <&clock 286>;
@@ -430,7 +446,7 @@
 		clock-names = "usbhost";
 	};
 
-	usbphy@12130000 {
+	usb2_phy: usbphy@12130000 {
 		compatible = "samsung,exynos5250-usb2phy";
 		reg = <0x12130000 0x100>;
 		clocks = <&clock 1>, <&clock 285>;
-- 
1.7.6.5
