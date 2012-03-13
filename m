From: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] i2c-s3c2410: Add HDMIPHY quirk for S3C2440
Date: Tue, 13 Mar 2012 19:13:25 +0100
Message-ID: <1331662405-7877-1-git-send-email-k.lewandowsk@samsung.com>
References: <4F5F838A.6030908@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <4F5F838A.6030908-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
Cc: thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds support for s3c2440 I2C bus controller dedicated HDMIPHY device on
Exynos4 platform. Some quirks are introduced due to differences between HDMIPHY
and other I2C controllers on Exynos4.  These differences are:
- no GPIOs, HDMIPHY is inside the SoC and the controller is connected
  internally
- due to unknown reason (probably HW bug in HDMIPHY and/or the controller) a
  transfer fails to finish. The controller hangs after sending the last byte,
  the workaround for this bug is resetting the controller after each transfer

Signed-off-by: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Tested-by: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/i2c/samsung-i2c.txt        |   11 +++++-
 drivers/i2c/busses/i2c-s3c2410.c                   |   35 ++++++++++++++++++++
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/samsung-i2c.txt b/Documentation/devicetree/bindings/i2c/samsung-i2c.txt
index 38832c7..c6670f9 100644
--- a/Documentation/devicetree/bindings/i2c/samsung-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/samsung-i2c.txt
@@ -10,14 +10,21 @@ Required properties:
     region.
   - interrupts: interrupt number to the cpu.
   - samsung,i2c-sda-delay: Delay (in ns) applied to data line (SDA) edges.
-  - gpios: The order of the gpios should be the following: <SDA, SCL>.
-    The gpio specifier depends on the gpio controller.
 
 Optional properties:
+  - gpios: The order of the gpios should be the following: <SDA, SCL>.
+    The gpio specifier depends on the gpio controller. Required in all cases
+    except when "samsung,i2c-no-gpio" is also specified.
+  - samsung,i2c-no-gpio: input/output lines of the controller are
+    permanently wired to the respective client, there are no gpio
+    lines that need to be configured to enable this controller
   - samsung,i2c-slave-addr: Slave address in multi-master enviroment. If not
     specified, default value is 0.
   - samsung,i2c-max-bus-freq: Desired frequency in Hz of the bus. If not
     specified, the default value in Hz is 100000.
+  - samsung,i2c-quirk-hdmiphy: Quirk for HDMI PHY block found on
+    Exynos4 platform - reduce timeout and reset controller after each
+    transfer
 
 Example:
 
diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index f84d26f..fa5f8c4 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -52,6 +52,8 @@ static const struct of_device_id s3c24xx_i2c_match[];
 #define TYPE_BITS		0x000000ff
 #define TYPE_S3C2410		0x00000001
 #define TYPE_S3C2440		0x00000002
+#define FLAG_HDMIPHY		0x00000100
+#define FLAG_NO_GPIO		0x00000200
 
 /* i2c controller state */
 enum s3c24xx_i2c_state {
@@ -481,6 +483,13 @@ static int s3c24xx_i2c_set_master(struct s3c24xx_i2c *i2c)
 	unsigned long iicstat;
 	int timeout = 400;
 
+	/* the timeout for HDMIPHY is reduced to 10 ms because
+	 * the hangup is expected to happen, so waiting 400 ms
+	 * causes only unnecessary system hangup
+	 */
+	if (i2c->type & FLAG_HDMIPHY)
+		timeout = 10;
+
 	while (timeout-- > 0) {
 		iicstat = readl(i2c->regs + S3C2410_IICSTAT);
 
@@ -490,6 +499,15 @@ static int s3c24xx_i2c_set_master(struct s3c24xx_i2c *i2c)
 		msleep(1);
 	}
 
+	/* hang-up of bus dedicated for HDMIPHY occurred, resetting */
+	if (i2c->type & FLAG_HDMIPHY) {
+		writel(0, i2c->regs + S3C2410_IICCON);
+		writel(0, i2c->regs + S3C2410_IICSTAT);
+		writel(0, i2c->regs + S3C2410_IICDS);
+
+		return 0;
+	}
+
 	return -ETIMEDOUT;
 }
 
@@ -771,6 +789,9 @@ static int s3c24xx_i2c_parse_dt_gpio(struct s3c24xx_i2c *i2c)
 {
 	int idx, gpio, ret;
 
+	if (i2c->type & FLAG_NO_GPIO)
+		return 0;
+
 	for (idx = 0; idx < 2; idx++) {
 		gpio = of_get_gpio(i2c->dev->of_node, idx);
 		if (!gpio_is_valid(gpio)) {
@@ -795,6 +816,10 @@ free_gpio:
 static void s3c24xx_i2c_dt_gpio_free(struct s3c24xx_i2c *i2c)
 {
 	unsigned int idx;
+
+	if (i2c->type & FLAG_NO_GPIO)
+		return;
+
 	for (idx = 0; idx < 2; idx++)
 		gpio_free(i2c->gpios[idx]);
 }
@@ -871,6 +896,13 @@ s3c24xx_i2c_parse_dt(struct device_node *np, struct s3c24xx_i2c *i2c)
 		return;
 
 	pdata->bus_num = -1; /* i2c bus number is dynamically assigned */
+
+	if (of_get_property(np, "samsung,i2c-quirk-hdmiphy", NULL))
+		i2c->type |= FLAG_HDMIPHY;
+
+	if (of_get_property(np, "samsung,i2c-no-gpio", NULL))
+		i2c->type |= FLAG_NO_GPIO;
+
 	of_property_read_u32(np, "samsung,i2c-sda-delay", &pdata->sda_delay);
 	of_property_read_u32(np, "samsung,i2c-slave-addr", &pdata->slave_addr);
 	of_property_read_u32(np, "samsung,i2c-max-bus-freq",
@@ -1128,6 +1160,9 @@ static struct platform_device_id s3c24xx_driver_ids[] = {
 	}, {
 		.name		= "s3c2440-i2c",
 		.driver_data	= TYPE_S3C2440,
+	}, {
+		.name		= "s3c2440-hdmiphy-i2c",
+		.driver_data	= TYPE_S3C2440 | FLAG_HDMIPHY | FLAG_NO_GPIO,
 	}, { },
 };
 MODULE_DEVICE_TABLE(platform, s3c24xx_driver_ids);
-- 
1.7.9
