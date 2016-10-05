From: Sergio Prado <sergio.prado@e-labworks.com>
Subject: [PATCH 2/3] dt-bindings: mtd: add DT binding for s3c2410 flash controller
Date: Wed,  5 Oct 2016 20:46:56 -0300
Message-ID: <1475711217-974-3-git-send-email-sergio.prado@e-labworks.com>
References: <1475711217-974-1-git-send-email-sergio.prado@e-labworks.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475711217-974-1-git-send-email-sergio.prado@e-labworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, linux@simtec.co.uk, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>
List-Id: linux-samsung-soc@vger.kernel.org

Adds the device tree bindings description for Samsung S3C2410 and
compatible NAND flash controller.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 .../devicetree/bindings/mtd/samsung-s3c2410.txt    | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt

diff --git a/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt b/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
new file mode 100644
index 000000000000..1cc8e84479ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
@@ -0,0 +1,57 @@
+* Samsung S3C2410 and compatible NAND flash controller
+
+Required properties:
+- compatible : The possible values are:
+	"samsung,s3c2410-nand"
+	"samsung,s3c2412-nand"
+	"samsung,s3c2440-nand"
+	"samsung,s3c6400-nand"
+- reg : register's location and length.
+- #address-cells, #size-cells : see nand.txt
+- clocks : phandle to the nand controller clock
+- clock-names : must contain "nand"
+
+Optional child nodes:
+Child nodes representing the available nand chips.
+
+Optional child properties:
+- nand-ecc-mode : see nand.txt
+- nand-on-flash-bbt : see nand.txt
+
+Each child device node may optionally contain a 'partitions' sub-node,
+which further contains sub-nodes describing the flash partition mapping.
+See partition.txt for more detail.
+
+Example:
+
+nand-controller@4e000000 {
+	compatible = "samsung,s3c2440-nand";
+	reg = <0x4e000000 0x40>;
+
+	#address-cells = <1>;
+        #size-cells = <0>;
+
+	clocks = <&clocks HCLK_NAND>;
+	clock-names = "nand";
+
+	nand {
+		nand-ecc-mode = "soft";
+		nand-on-flash-bbt;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0 0x040000>;
+			};
+
+			partition@40000 {
+				label = "kernel";
+				reg = <0x040000 0x500000>;
+			};
+		};
+	};
+};
-- 
1.9.1
