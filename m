From: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Subject: [PATCH v4 2/3] dt-bindings: mtd: add DT binding for s3c2410 flash controller
Date: Wed, 26 Oct 2016 21:59:54 -0200
Message-ID: <1477526395-13103-3-git-send-email-sergio.prado@e-labworks.com>
References: <1477526395-13103-1-git-send-email-sergio.prado@e-labworks.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477526395-13103-1-git-send-email-sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Adds the device tree bindings description for Samsung S3C2410 and
compatible NAND flash controller.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
---
 .../devicetree/bindings/mtd/samsung-s3c2410.txt    | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt

diff --git a/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt b/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
new file mode 100644
index 000000000000..0040eb8895e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
@@ -0,0 +1,56 @@
+* Samsung S3C2410 and compatible NAND flash controller
+
+Required properties:
+- compatible : The possible values are:
+	"samsung,s3c2410-nand"
+	"samsung,s3c2412-nand"
+	"samsung,s3c2440-nand"
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
