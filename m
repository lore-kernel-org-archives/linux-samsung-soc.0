From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/3] dt-bindings: switch Exynos EHCI/OHCI bindings to use
 array of generic PHYs
Date: Fri, 26 Jul 2019 10:14:51 +0200
Message-ID: <20190726081453.9456-2-m.szyprowski@samsung.com>
References: <20190726081453.9456-1-m.szyprowski@samsung.com>
        <CGME20190726081505eucas1p22472e5d1e81180b7bca4f0c0af302af5@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726081453.9456-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, =?UTF-8?q?M=C3=A5ns=20Rullg=C3=A5rd?= <mans@mansr.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Commit 69bec7259853 ("USB: core: let USB device know device node") added
support for attaching devicetree node for USB devices. Those nodes are
children of their USB host controller. However Exynos EHCI and OHCI
driver bindings already define child-nodes for each physical root hub
port and assigns respective PHY controller and parameters to them. This
leads to the conflict. A workaround for it has been merged as commit
01d4071486fe ("usb: exynos: add workaround for the USB device bindings
conflict"), but it disabled support for USB device binding for Exynos
EHCI/OHCI controllers.

To resolve it properly, lets move PHYs from the sub-nodes to a standard
array under the 'phys' property.

Suggested-by: Måns Rullgård <mans@mansr.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../devicetree/bindings/usb/exynos-usb.txt    | 41 +++++++------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
index b7111f43fa59..66c394f9e11f 100644
--- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -12,13 +12,11 @@ Required properties:
  - interrupts: interrupt number to the cpu.
  - clocks: from common clock binding: handle to usb clock.
  - clock-names: from common clock binding: Shall be "usbhost".
- - port: if in the SoC there are EHCI phys, they should be listed here.
-   One phy per port. Each port should have following entries:
-	- reg: port number on EHCI controller, e.g
-	       On Exynos5250, port 0 is USB2.0 otg phy
-			      port 1 is HSIC phy0
-			      port 2 is HSIC phy1
-	- phys: from the *Generic PHY* bindings; specifying phy used by port.
+ - phys: from the *Generic PHY* bindings; array specifying phy(s) used
+   by the root port.
+ - phy-names: from the *Generic PHY* bindings; array of the names for
+   each phy for the root ports, must be a subset of the following:
+   "host", "hsic0", "hsic1".
 
 Optional properties:
  - samsung,vbus-gpio:  if present, specifies the GPIO that
@@ -35,12 +33,8 @@ Example:
 		clocks = <&clock 285>;
 		clock-names = "usbhost";
 
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@0 {
-		    reg = <0>;
-		    phys = <&usb2phy 1>;
-		};
+		phys = <&usb2phy 1>;
+		phy-names = "host";
 	};
 
 OHCI
@@ -52,13 +46,11 @@ Required properties:
  - interrupts: interrupt number to the cpu.
  - clocks: from common clock binding: handle to usb clock.
  - clock-names: from common clock binding: Shall be "usbhost".
- - port: if in the SoC there are OHCI phys, they should be listed here.
-   One phy per port. Each port should have following entries:
-	- reg: port number on OHCI controller, e.g
-	       On Exynos5250, port 0 is USB2.0 otg phy
-			      port 1 is HSIC phy0
-			      port 2 is HSIC phy1
-	- phys: from the *Generic PHY* bindings, specifying phy used by port.
+ - phys: from the *Generic PHY* bindings; array specifying phy(s) used
+   by the root port.
+ - phy-names: from the *Generic PHY* bindings; array of the names for
+   each phy for the root ports, must be a subset of the following:
+   "host", "hsic0", "hsic1".
 
 Example:
 	usb@12120000 {
@@ -69,13 +61,8 @@ Example:
 		clocks = <&clock 285>;
 		clock-names = "usbhost";
 
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@0 {
-		    reg = <0>;
-		    phys = <&usb2phy 1>;
-		};
-
+		phys = <&usb2phy 1>;
+		phy-names = "host";
 	};
 
 DWC3
-- 
2.17.1
