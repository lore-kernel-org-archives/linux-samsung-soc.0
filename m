From: Mateusz Krawczuk <m.krawczuk-GrGkmOP51GdLN7c7dRTbYkEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v2] MTD: Onenand: Add device tree support for samsung onenand
Date: Mon, 23 Sep 2013 15:06:48 +0200
Message-ID: <1379941608-5068-1-git-send-email-m.krawczuk@partner.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Mateusz Krawczuk <m.krawczuk-GrGkmOP51GdLN7c7dRTbYkEOCMrvLtNR@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch add clk and device tree nodes for samsung onenand driver.

since v1:
Updated Documentation according to Mark Rutland notes.

Signed-off-by: Mateusz Krawczuk <m.krawczuk-GrGkmOP51GdLN7c7dRTbYkEOCMrvLtNR@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/mtd/samsung-onenand.txt    | 44 ++++++++++++++++++++++
 drivers/mtd/onenand/samsung.c                      | 37 +++++++++++++++++-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung-onenand.txt

diff --git a/Documentation/devicetree/bindings/mtd/samsung-onenand.txt b/Documentation/devicetree/bindings/mtd/samsung-onenand.txt
new file mode 100644
index 0000000..5bf931c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/samsung-onenand.txt
@@ -0,0 +1,44 @@
+Device tree bindings for Samsung Onenand
+
+Required properties:
+  - compatible: value should be either of the following.
+      (a) "samsung,s3c6400-onenand",
+		for onenand controller compatible with s3c6400.
+      (b) "samsung,s3c6410-onenand",
+		for onenand controller compatible with s3c6410.
+      (c) "samsung,s5pc100-onenand",
+		for onenand controller compatible with s5pc100.
+      (d) "samsung,s5pc110-onenand",
+      for s5pc100-like onenand controller used on s5pc110 which supports DMA.
+
+Required properties for s5pc110:
+
+ - reg: the offset and length of the control registers. First region describes
+	OneNAND interface, second control registers.
+ - interrupt-parent, interrupts		Onenand memory interrupts
+
+Required properties for others:
+
+ - reg: the offset and length of the control registers. First region describes
+	control registers, second OneNAND interface.
+
+Clocks:
+ - gate - clock which output is supplied to external OneNAND flash memory.
+
+
+For partiton table parsing (optional) please refer to:
+ [1] Documentation/devicetree/bindings/mtd/partition.txt
+
+Example for an s5pv210 board:
+
+		onenand@b0000000 {
+			compatible = "samsung,s5pc110-onenand";
+			reg = <0xb0000000 0x20000>, <0xb0600000 0x2000>;
+			interrupt-parent = <&vic1>;
+			interrupts = <31>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&clocks NANDXL>;
+			clock-names = "gate";
+			status = "okay";
+		};
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index df7400d..5a2cc4b 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -14,6 +14,7 @@
  *	S5PC110: use DMA
  */
 
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
@@ -24,6 +25,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/of.h>
 
 #include <asm/mach/flash.h>
 
@@ -133,6 +135,7 @@ enum soc_type {
 struct s3c_onenand {
 	struct mtd_info	*mtd;
 	struct platform_device	*pdev;
+	struct clk *gate;
 	enum soc_type	type;
 	void __iomem	*base;
 	struct resource *base_res;
@@ -859,6 +862,19 @@ static void s3c_onenand_setup(struct mtd_info *mtd)
 	this->write_bufferram = onenand_write_bufferram;
 }
 
+static const struct of_device_id onenand_s3c_dt_match[] = {
+	{ .compatible = "samsung,s3c6400-onenand",
+		.data = (void *)TYPE_S3C6400 },
+	{ .compatible = "samsung,s3c6410-onenand",
+		.data = (void *)TYPE_S3C6410 },
+	{ .compatible = "samsung,s5pc100-onenand",
+		.data = (void *)TYPE_S5PC100 },
+	{ .compatible = "samsung,s5pc110-onenand",
+		.data = (void *)TYPE_S5PC110 },
+	{},
+};
+MODULE_DEVICE_TABLE(of, onenand_s3c_dt_match);
+
 static int s3c_onenand_probe(struct platform_device *pdev)
 {
 	struct onenand_platform_data *pdata;
@@ -883,12 +899,26 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		goto onenand_fail;
 	}
 
+	onenand->gate = clk_get(&pdev->dev, "gate");
+	if (IS_ERR(onenand->gate))
+		return PTR_ERR(onenand->gate);
+	clk_prepare_enable(onenand->gate);
+
 	this = (struct onenand_chip *) &mtd[1];
 	mtd->priv = this;
 	mtd->dev.parent = &pdev->dev;
 	mtd->owner = THIS_MODULE;
 	onenand->pdev = pdev;
-	onenand->type = platform_get_device_id(pdev)->driver_data;
+
+	if (pdev->dev.of_node) {
+		const struct of_device_id *match;
+
+		match = of_match_node(onenand_s3c_dt_match, pdev->dev.of_node);
+		onenand->type = (enum soc_type)match->data;
+	} else {
+		onenand->type = platform_get_device_id(pdev)->driver_data;
+	}
+
 
 	s3c_onenand_setup(mtd);
 
@@ -1077,6 +1107,10 @@ static int s3c_onenand_remove(struct platform_device *pdev)
 	kfree(onenand->page_buf);
 	kfree(onenand);
 	kfree(mtd);
+
+	clk_disable_unprepare(onenand->gate);
+	clk_put(onenand->gate);
+
 	return 0;
 }
 
@@ -1125,6 +1159,7 @@ MODULE_DEVICE_TABLE(platform, s3c_onenand_driver_ids);
 static struct platform_driver s3c_onenand_driver = {
 	.driver         = {
 		.name	= "samsung-onenand",
+		.of_match_table = of_match_ptr(onenand_s3c_dt_match),
 		.pm	= &s3c_pm_ops,
 	},
 	.id_table	= s3c_onenand_driver_ids,
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
