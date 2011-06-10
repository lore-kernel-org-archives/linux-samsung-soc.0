From: Anand Kumar N <anand.kn@samsung.com>
Subject: [RE-SEND] [PATCH 3/4] s3c-fb: Add support EXYNOS4 FIMD
Date: Fri, 10 Jun 2011 13:45:22 +0530
Message-ID: <1307693723-14971-4-git-send-email-anand.kn@samsung.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9501 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754559Ab1FJIQX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 04:16:23 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMK0083MEYSKPP0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 17:16:21 +0900 (KST)
Received: from anand-ubuntu.sisodomain.com (unknown [107.108.215.66])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LMK009OSEYVA360@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 17:16:21 +0900 (KST)
In-reply-to: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, anand.kn@samsung.com

From: Jonghun Han <jonghun.han@samsung.com>

This patch adds struct s3c_fb_driverdata s3c_fb_data_exynos4 for EXYNOS4.
The clk_type is added to distinguish clock type in it and lcd_clk is added
in structure s3c_fb to calculate divider for lcd panel.

Please refer to below diagrams about clocks of FIMD IP. FIMD driver needs
two clocks for FIMD IP and LCD pixel clock. Actually, the LCD pixel clock
can be selected from 1.clk 'lcd' and 2.SCLK_FIMD before EXYNOS4. But from
EXYNOS4, the 2.SCLK_FIMD can be used only for source of LCD pixel clock.

FIMD_CLK_TYPE0:
           ------------------------------------
                      dsys bus
           ----------------+-------------------
                           |
                           |1.clk 'lcd'
                           |
                           | FIMD block
                       +---+-----------+
4.mout_mpll |\         |   |           |
    --------|m|        | +-+-+ +----+  |
            |u|-+      | |   +-+core|  |
            |x| |      | |     +----+  |
            |/  |      | | |\          |
                |      | +-|m|  +---+  |
                |      |   |u|--+div|  |
                +------+---|x|  +---+  |
           2.SCLK_FIMD |   |/     |    |
                       |          |    |
                       +----------+----+
                                  |
           inside of SoC          |
           -----------------------+--------------------------
           outside of SoC         |
                                  | 3.LCD pixel clock
                                  |
                          +--------------+
                          | LCD module   |
                          +--------------+

FIMD_CLK_TYPE1:
           ------------------------------------
                      dsys bus
           ----------------+-------------------
                           |
                           |1.clk 'fimd'
                           |
                           | FIMD block
                       +---+-----------+
4.mout_mpll |\         |   |           |
    --------|m|        | +-+-+ +----+  |
            |u|-+      | |   +-+core|  |
            |x| |      | |     +----+  |
            |/  |      | | |\          |
                |      | +-|m|  +---+  |
                |      |   |u|--+div|  |
                +------+---|x|  +---+  |
           2.SCLK_FIMD |   |/     |    |
                       |          |    |
                       +----------+----+
                                  |
           inside of SoC          |
           -----------------------+--------------------------
           outside of SoC         |
                                  | 3.LCD pixel clock
                                  |
                          +--------------+
                          | LCD module   |
                          +--------------+

FIMD_CLK_TYPE1:
           ------------------------------------
                      dsys bus
           ----------------+-------------------
                           |
                           |1.clk 'fimd'
                           |
                           | FIMD block
                       +---+-----------+
4.mout_mpll |\         |   |           |
    --------|m|        |   |   +----+  |
            |u|-+      |   +---+core|  |
            |x| |      |       +----+  |
            |/  |      |               |
                |      |        +---+  |
                |      |     +--+div|  |
                +------+-----+  +---+  |
           2.SCLK_FIMD |          |    |
                       |          |    |
                       +----------+----+
                                  |
           inside of SoC          |
           -----------------------+--------------------------
           -----------------------+--------------------------
           outside of SoC         |
                                  | 3.LCD pixel clock
                                  |
                          +--------------+
                          | LCD module   |
                          +--------------+

FIMD_CLK_TYPE1:
           ------------------------------------
                      dsys bus
           ----------------+-------------------
                           |
                           |1.clk 'fimd'
                           |
                           | FIMD block
                       +---+-----------+
4.mout_mpll |\         |   |           |
    --------|m|        |   |   +----+  |
            |u|-+      |   +---+core|  |
            |x| |      |       +----+  |
            |/  |      |               |
                |      |        +---+  |
                |      |     +--+div|  |
                +------+-----+  +---+  |
           2.SCLK_FIMD |          |    |
                       |          |    |
                       +----------+----+
                                  |
           inside of SoC          |
           -----------------------+--------------------------
           outside of SoC         |
                                  | 3.LCD pixel clock
                                  |
                          +--------------+
                          | LCD module   |
                          +--------------+

Change-Id: I52b69285151dc4d67bc0be5d0020ca49ba58f911
Signed-off-by: Jonghun Han <jonghun.han@samsung.com>
Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/video/Kconfig  |    2 +-
 drivers/video/s3c-fb.c |  131 ++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 117 insertions(+), 16 deletions(-)

diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 549b960..963b8b7 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -2027,7 +2027,7 @@ config FB_TMIO_ACCELL
 
 config FB_S3C
 	tristate "Samsung S3C framebuffer support"
-	depends on FB && S3C_DEV_FB
+	depends on FB && (S3C_DEV_FB || S5P_DEV_FIMD0)
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
index 0352afa..7445740 100644
--- a/drivers/video/s3c-fb.c
+++ b/drivers/video/s3c-fb.c
@@ -66,6 +66,9 @@ struct s3c_fb;
 #define VIDOSD_C(win, variant) (OSD_BASE(win, variant) + 0x08)
 #define VIDOSD_D(win, variant) (OSD_BASE(win, variant) + 0x0C)
 
+#define FIMD_CLK_TYPE0 0
+#define FIMD_CLK_TYPE1 1
+
 /**
  * struct s3c_fb_variant - fb variant information
  * @is_2443: Set if S3C2443/S3C2416 style hardware.
@@ -98,6 +101,7 @@ struct s3c_fb_variant {
 
 	unsigned int	has_prtcon:1;
 	unsigned int	has_shadowcon:1;
+	unsigned int	clk_type:1;
 };
 
 /**
@@ -185,7 +189,8 @@ struct s3c_fb_vsync {
  * @slock: The spinlock protection for this data sturcture.
  * @dev: The device that we bound to, for printing, etc.
  * @regs_res: The resource we claimed for the IO registers.
- * @bus_clk: The clk (hclk) feeding our interface and possibly pixclk.
+ * @bus_clk: The clk (hclk) feeding FIMD IP core.
+ * @lcd_clk: The clk (sclk) feeding our interface and possibly pixclk.
  * @regs: The mapped hardware registers.
  * @variant: Variant information for this hardware.
  * @enabled: A bitmask of enabled hardware windows.
@@ -200,6 +205,7 @@ struct s3c_fb {
 	struct device		*dev;
 	struct resource		*regs_res;
 	struct clk		*bus_clk;
+	struct clk		*lcd_clk;
 	void __iomem		*regs;
 	struct s3c_fb_variant	 variant;
 
@@ -337,7 +343,7 @@ static int s3c_fb_check_var(struct fb_var_screeninfo *var,
  */
 static int s3c_fb_calc_pixclk(struct s3c_fb *sfb, unsigned int pixclk)
 {
-	unsigned long clk = clk_get_rate(sfb->bus_clk);
+	unsigned long clk = clk_get_rate(sfb->lcd_clk);
 	unsigned long long tmp;
 	unsigned int result;
 
@@ -1315,8 +1321,10 @@ static int __devinit s3c_fb_probe(struct platform_device *pdev)
 	struct s3c_fb_platdata *pd;
 	struct s3c_fb *sfb;
 	struct resource *res;
+	struct clk *mout_mpll = NULL;
 	int win;
 	int ret = 0;
+	u32 rate = 134000000;
 
 	platid = platform_get_device_id(pdev);
 	fbdrv = (struct s3c_fb_driverdata *)platid->driver_data;
@@ -1346,22 +1354,62 @@ static int __devinit s3c_fb_probe(struct platform_device *pdev)
 
 	spin_lock_init(&sfb->slock);
 
-	sfb->bus_clk = clk_get(dev, "lcd");
-	if (IS_ERR(sfb->bus_clk)) {
-		dev_err(dev, "failed to get bus clock\n");
-		ret = PTR_ERR(sfb->bus_clk);
+	switch (sfb->variant.clk_type) {
+	case FIMD_CLK_TYPE0:
+		sfb->bus_clk = clk_get(dev, "lcd");
+		if (IS_ERR(sfb->bus_clk)) {
+			dev_err(dev, "failed to get bus clock\n");
+			ret = PTR_ERR(sfb->bus_clk);
+			goto err_sfb;
+		}
+
+		clk_enable(sfb->bus_clk);
+
+		sfb->lcd_clk = sfb->bus_clk;
+		break;
+
+	case FIMD_CLK_TYPE1:
+		sfb->bus_clk = clk_get(&pdev->dev, "fimd");
+		if (IS_ERR(sfb->bus_clk)) {
+			dev_err(&pdev->dev, "failed to get clock for fimd\n");
+			ret = PTR_ERR(sfb->bus_clk);
+			goto err_sfb;
+		}
+		clk_enable(sfb->bus_clk);
+
+		sfb->lcd_clk = clk_get(&pdev->dev, "sclk_fimd");
+		if (IS_ERR(sfb->lcd_clk)) {
+			dev_err(&pdev->dev, "failed to get sclk for fimd\n");
+			ret = PTR_ERR(sfb->lcd_clk);
+			goto err_bus_clk;
+		}
+
+		mout_mpll = clk_get(&pdev->dev, "mout_mpll");
+		if (IS_ERR(mout_mpll)) {
+			dev_err(&pdev->dev, "failed to get mout_mpll\n");
+			ret = PTR_ERR(mout_mpll);
+			goto err_lcd_clk;
+		}
+		clk_set_parent(sfb->lcd_clk, mout_mpll);
+		clk_put(mout_mpll);
+
+		clk_set_rate(sfb->lcd_clk, rate);
+		clk_enable(sfb->lcd_clk);
+		dev_dbg(&pdev->dev, "set fimd sclk rate to %d\n", rate);
+		break;
+
+	default:
+		dev_err(dev, "failed to enable clock for FIMD\n");
 		goto err_sfb;
 	}
 
-	clk_enable(sfb->bus_clk);
-
 	pm_runtime_enable(sfb->dev);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		dev_err(dev, "failed to find registers\n");
 		ret = -ENOENT;
-		goto err_clk;
+		goto err_lcd_clk;
 	}
 
 	sfb->regs_res = request_mem_region(res->start, resource_size(res),
@@ -1369,7 +1417,7 @@ static int __devinit s3c_fb_probe(struct platform_device *pdev)
 	if (!sfb->regs_res) {
 		dev_err(dev, "failed to claim register region\n");
 		ret = -ENOENT;
-		goto err_clk;
+		goto err_lcd_clk;
 	}
 
 	sfb->regs = ioremap(res->start, resource_size(res));
@@ -1451,9 +1499,15 @@ err_ioremap:
 err_req_region:
 	release_mem_region(sfb->regs_res->start, resource_size(sfb->regs_res));
 
-err_clk:
-	clk_disable(sfb->bus_clk);
-	clk_put(sfb->bus_clk);
+err_lcd_clk:
+	clk_disable(sfb->lcd_clk);
+	clk_put(sfb->lcd_clk);
+
+err_bus_clk:
+	if (sfb->variant.clk_type != FIMD_CLK_TYPE0) {
+		clk_disable(sfb->bus_clk);
+		clk_put(sfb->bus_clk);
+	}
 
 err_sfb:
 	kfree(sfb);
@@ -1482,8 +1536,20 @@ static int __devexit s3c_fb_remove(struct platform_device *pdev)
 
 	iounmap(sfb->regs);
 
-	clk_disable(sfb->bus_clk);
-	clk_put(sfb->bus_clk);
+	switch (sfb->variant.clk_type) {
+	case FIMD_CLK_TYPE1:
+		clk_disable(sfb->lcd_clk);
+		clk_put(sfb->lcd_clk);
+		/* fall through to default case */
+	case FIMD_CLK_TYPE0:
+		clk_disable(sfb->bus_clk);
+		clk_put(sfb->bus_clk);
+		break;
+	default:
+		dev_err(sfb->dev, "invalid clock type(%d)\n",
+				sfb->variant.clk_type);
+		break;
+	}
 
 	release_mem_region(sfb->regs_res->start, resource_size(sfb->regs_res));
 
@@ -1513,6 +1579,7 @@ static int s3c_fb_suspend(struct device *dev)
 	}
 
 	clk_disable(sfb->bus_clk);
+
 	return 0;
 }
 
@@ -1825,6 +1892,37 @@ static struct s3c_fb_driverdata s3c_fb_data_s5pv210 = {
 	.win[4]	= &s3c_fb_data_s5p_wins[4],
 };
 
+static struct s3c_fb_driverdata s3c_fb_data_exynos4 = {
+	.variant = {
+		.nr_windows     = 5,
+		.vidtcon        = VIDTCON0,
+		.wincon         = WINCON(0),
+		.winmap         = WINxMAP(0),
+		.keycon         = WKEYCON,
+		.osd            = VIDOSD_BASE,
+		.osd_stride     = 16,
+		.buf_start      = VIDW_BUF_START(0),
+		.buf_size       = VIDW_BUF_SIZE(0),
+		.buf_end        = VIDW_BUF_END(0),
+
+		.palette = {
+			[0] = 0x2400,
+			[1] = 0x2800,
+			[2] = 0x2c00,
+			[3] = 0x3000,
+			[4] = 0x3400,
+		},
+
+		.has_shadowcon  = 1,
+		.clk_type       = FIMD_CLK_TYPE1,
+	},
+	.win[0] = &s3c_fb_data_64xx_wins[0],
+	.win[1] = &s3c_fb_data_64xx_wins[1],
+	.win[2] = &s3c_fb_data_64xx_wins[2],
+	.win[3] = &s3c_fb_data_64xx_wins[3],
+	.win[4] = &s3c_fb_data_64xx_wins[4],
+};
+
 /* S3C2443/S3C2416 style hardware */
 static struct s3c_fb_driverdata s3c_fb_data_s3c2443 = {
 	.variant = {
@@ -1872,6 +1970,9 @@ static struct platform_device_id s3c_fb_driver_ids[] = {
 		.name		= "s5pv210-fb",
 		.driver_data	= (unsigned long)&s3c_fb_data_s5pv210,
 	}, {
+		.name           = "exynos4-fb",
+		.driver_data    = (unsigned long)&s3c_fb_data_exynos4,
+	}, {
 		.name		= "s3c2443-fb",
 		.driver_data	= (unsigned long)&s3c_fb_data_s3c2443,
 	},
-- 
1.7.4.1
