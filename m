From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V4 3/3] ARM: dts: Add pcie controller node for Samsung
 EXYNOS5440 SoC
Date: Wed, 12 Jun 2013 19:20:00 +0900
Message-ID: <003801ce6756$6578ff80$306afe80$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-language: ko
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
To: 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: 'Jason Gunthorpe' <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Siva Reddy Kallam' <siva.kallam-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, 'Thierry Reding' <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Surendranath Gurivireddy Balla' <suren.reddy-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Andrew Murray' <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Exynos5440 has two PCIe controllers which can be used as root complex
for PCIe interface.

Signed-off-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Tested on Exynos5440.

Changes since v3:
- Removed 'bus-range' property from DT
- Added 'interrupt-map-mask', 'interrupt-map' properties to DT
- Fixed the start address of MEM space in DT
- Increased the size of I/O space to 64kB in DT
- Added 'clocks', 'clock-names' properties to DT

 arch/arm/boot/dts/exynos5440-ssdk5440.dts |    8 ++++++
 arch/arm/boot/dts/exynos5440.dtsi         |   38 +++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index d55042b..efe7d39 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -30,4 +30,12 @@
 			clock-frequency = <50000000>;
 		};
 	};
+
+	pcie0@40000000 {
+		reset-gpio = <5>;
+	};
+
+	pcie1@60000000 {
+		reset-gpio = <22>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index f6b1c89..2c15f9d 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -216,4 +216,42 @@
 		clock-names = "rtc";
 		status = "disabled";
 	};
+
+	pcie0@0x290000 {
+		compatible = "samsung,exynos5440-pcie";
+		reg = <0x290000 0x1000
+			0x270000 0x1000
+			0x271000 0x40>;
+		interrupts = <0 20 0>, <0 21 0>, <0 22 0>;
+		clocks = <&clock 28>, <&clock 27>;
+		clock-names = "pcie", "pcie_bus";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		ranges = <0x00000800 0 0x40000000 0x40000000 0 0x00200000   /* configuration space */
+			  0x81000000 0 0	  0x40200000 0 0x00010000   /* downstream I/O */
+			  0x82000000 0 0x40210000 0x40210000 0 0x10000000>; /* non-prefetchable memory */
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 0>;
+		interrupt-map = <0x0 0 &gic 53>;
+	};
+
+	pcie1@2a0000 {
+		compatible = "samsung,exynos5440-pcie";
+		reg = <0x2a0000 0x1000
+			0x272000 0x1000
+			0x271040 0x40>;
+		interrupts = <0 23 0>, <0 24 0>, <0 25 0>;
+		clocks = <&clock 29>, <&clock 27>;
+		clock-names = "pcie", "pcie_bus";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		ranges = <0x00000800 0 0x60000000 0x60000000 0 0x00200000   /* configuration space */
+			  0x81000000 0 0	  0x60200000 0 0x00010000   /* downstream I/O */
+			  0x82000000 0 0x60210000 0x60210000 0 0x10000000>; /* non-prefetchable memory */
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 0>;
+		interrupt-map = <0x0 0 &gic 56>;
+	};
 };
-- 
1.7.10.4
