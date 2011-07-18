From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] i2c: s3c24xx: Add device tree support
Date: Mon, 18 Jul 2011 06:20:40 +0530
Message-ID: <1310950241-13602-2-git-send-email-thomas.abraham@linaro.org>
References: <1310950241-13602-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1310950241-13602-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Add device tree support for Samsung's s3c24xx i2c driver. It adds
support for parsing platform data from device tree and initialize
all the slave devices specified as child nodes.

Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/i2c/samsung-i2c.txt        |   43 ++++++++++
 drivers/i2c/busses/i2c-s3c2410.c                   |   87 ++++++++++++++++----
 2 files changed, 115 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/samsung-i2c.txt

diff --git a/Documentation/devicetree/bindings/i2c/samsung-i2c.txt b/Documentation/devicetree/bindings/i2c/samsung-i2c.txt
new file mode 100644
index 0000000..73191c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/samsung-i2c.txt
@@ -0,0 +1,43 @@
+* Samsung's I2C controller
+
+The Samsung's I2C controller is used to interface with I2C devices.
+
+Required properties:
+  - compatible: value should be either of the following.
+      (a) "samsung, s3c2410-i2c", for i2c compatible with s3c2410 i2c.
+      (b) "samsung, s3c2440-i2c", for i2c compatible with s3c2440 i2c.
+
+  - reg: physical base address of the controller and length of memory mapped
+    region.
+
+  - interrupts : interrupt number to the cpu.
+
+  - samsung,i2c-bus-number: Specifies the i2c bus number.
+
+  - samsung,i2c-sda-delay: Delay (in ns) applied to data line (SDA) edges.
+
+Optional properties:
+  - samsung,i2c-slave-addr: Slave address in multi-master enviroment. If not
+    specified, default value is 0x10.
+
+  - samsung,i2c-max-bus-freq: Desired frequency in Hz of the bus. If not
+    specified, the default value in Hz is 100000.
+
+Example:
+
+	i2c@13870000 {
+		compatible = "samsung,s3c2440-i2c";
+		reg = <0x13870000 0x100>;
+		interrupts = <345>;
+		samsung,i2c-bus-number = <1>;
+		samsung,i2c-slave-addr = <16>;
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <100000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		wm8994@1a {
+			compatible = "wlf,wm8994";
+			reg = <0x1a>;
+		};
+	};
diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 6c00c10..5a84a0b 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -35,6 +35,9 @@
 #include <linux/cpufreq.h>
 #include <linux/slab.h>
 #include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_i2c.h>
+#include <linux/of_device.h>
 
 #include <asm/irq.h>
 
@@ -83,6 +86,33 @@ struct s3c24xx_i2c {
 #endif
 };
 
+#ifdef CONFIG_OF
+static enum s3c24xx_i2c_type samsung_i2c_types[] = {
+	TYPE_S3C2410,
+	TYPE_S3C2440
+};
+
+static const struct of_device_id s3c24xx_i2c_match[] = {
+	{ .compatible = "samsung,s3c2410-i2c", .data = &samsung_i2c_types[0], },
+	{ .compatible = "samsung,s3c2440-i2c", .data = &samsung_i2c_types[1], },
+	{},
+};
+MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
+
+static const struct
+of_device_id *s3c24xx_i2c_get_of_device_id(struct platform_device *pdev)
+{
+	return of_match_device(s3c24xx_i2c_match, &pdev->dev);
+}
+#else
+#define s3c24xx_i2c_match NULL
+static const struct
+of_device_id *s3c24xx_i2c_get_of_device_id(struct platform_device *pdev)
+{
+	return NULL;
+}
+#endif
+
 /* default platform data removed, dev should always carry data. */
 
 /* s3c24xx_i2c_is2440()
@@ -93,9 +123,15 @@ struct s3c24xx_i2c {
 static inline int s3c24xx_i2c_is2440(struct s3c24xx_i2c *i2c)
 {
 	struct platform_device *pdev = to_platform_device(i2c->dev);
+	const struct of_device_id *i2c_of_id;
 	enum s3c24xx_i2c_type type;
 
-	type = platform_get_device_id(pdev)->driver_data;
+	i2c_of_id = s3c24xx_i2c_get_of_device_id(pdev);
+	if (platform_get_device_id(pdev))
+		type = platform_get_device_id(pdev)->driver_data;
+	else
+		type = *(enum s3c24xx_i2c_type *)i2c_of_id->data;
+
 	return type == TYPE_S3C2440;
 }
 
@@ -630,16 +666,21 @@ static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *i2c, unsigned int *got)
 	unsigned long clkin = clk_get_rate(i2c->clk);
 	unsigned int divs, div1;
 	unsigned long target_frequency;
+	unsigned int max_freq = 0;
 	u32 iiccon;
 	int freq;
 
 	i2c->clkrate = clkin;
 	clkin /= 1000;		/* clkin now in KHz */
 
-	dev_dbg(i2c->dev, "pdata desired frequency %lu\n", pdata->frequency);
-
-	target_frequency = pdata->frequency ? pdata->frequency : 100000;
+	if (i2c->dev->of_node)
+		of_property_read_u32(i2c->dev->of_node,
+				"samsung,i2c-max-bus-freq", &max_freq);
+	else
+		max_freq = pdata->frequency;
+	dev_dbg(i2c->dev, "desired frequency %u\n", max_freq);
 
+	target_frequency = max_freq ? max_freq : 100000;
 	target_frequency /= 1000; /* Target frequency now in KHz */
 
 	freq = s3c24xx_i2c_calcdivisor(clkin, target_frequency, &div1, &divs);
@@ -663,19 +704,24 @@ static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *i2c, unsigned int *got)
 	writel(iiccon, i2c->regs + S3C2410_IICCON);
 
 	if (s3c24xx_i2c_is2440(i2c)) {
-		unsigned long sda_delay;
+		unsigned int sda_delay = 0;
 
-		if (pdata->sda_delay) {
-			sda_delay = clkin * pdata->sda_delay;
+		if (i2c->dev->of_node)
+			of_property_read_u32(i2c->dev->of_node,
+				"samsung,i2c-sda-delay", &sda_delay);
+		else
+			sda_delay = pdata->sda_delay;
+
+		if (sda_delay) {
+			sda_delay *= clkin;
 			sda_delay = DIV_ROUND_UP(sda_delay, 1000000);
 			sda_delay = DIV_ROUND_UP(sda_delay, 5);
 			if (sda_delay > 3)
 				sda_delay = 3;
 			sda_delay |= S3C2410_IICLC_FILTER_ON;
-		} else
-			sda_delay = 0;
+		}
 
-		dev_dbg(i2c->dev, "IICLC=%08lx\n", sda_delay);
+		dev_dbg(i2c->dev, "IICLC=%08x\n", sda_delay);
 		writel(sda_delay, i2c->regs + S3C2440_IICLC);
 	}
 
@@ -751,7 +797,7 @@ static int s3c24xx_i2c_init(struct s3c24xx_i2c *i2c)
 {
 	unsigned long iicon = S3C2410_IICCON_IRQEN | S3C2410_IICCON_ACKEN;
 	struct s3c2410_platform_i2c *pdata;
-	unsigned int freq;
+	unsigned int freq, slave_addr = 0x10;
 
 	/* get the plafrom data */
 
@@ -763,10 +809,14 @@ static int s3c24xx_i2c_init(struct s3c24xx_i2c *i2c)
 		pdata->cfg_gpio(to_platform_device(i2c->dev));
 
 	/* write slave address */
+	if (i2c->dev->of_node)
+		of_property_read_u32(i2c->dev->of_node,
+				"samsung,i2c-slave-addr", &slave_addr);
+	else
+		slave_addr = pdata->slave_addr;
+	writeb(slave_addr, i2c->regs + S3C2410_IICADD);
 
-	writeb(pdata->slave_addr, i2c->regs + S3C2410_IICADD);
-
-	dev_info(i2c->dev, "slave address 0x%02x\n", pdata->slave_addr);
+	dev_info(i2c->dev, "slave address 0x%02x\n", slave_addr);
 
 	writel(iicon, i2c->regs + S3C2410_IICCON);
 
@@ -904,7 +954,12 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	 * being bus 0.
 	 */
 
-	i2c->adap.nr = pdata->bus_num;
+	if (i2c->dev->of_node)
+		of_property_read_u32(i2c->dev->of_node,
+				"samsung,i2c-bus-number", &i2c->adap.nr);
+	else
+		i2c->adap.nr = pdata->bus_num;
+	i2c->adap.dev.of_node = pdev->dev.of_node;
 
 	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret < 0) {
@@ -912,6 +967,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 		goto err_cpufreq;
 	}
 
+	of_i2c_register_devices(&i2c->adap);
 	platform_set_drvdata(pdev, i2c);
 
 	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
@@ -1021,6 +1077,7 @@ static struct platform_driver s3c24xx_i2c_driver = {
 		.owner	= THIS_MODULE,
 		.name	= "s3c-i2c",
 		.pm	= S3C24XX_DEV_PM_OPS,
+		.of_match_table	= s3c24xx_i2c_match,
 	},
 };
 
-- 
1.7.1
