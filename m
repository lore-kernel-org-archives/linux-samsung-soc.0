From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/3] i2c: s3c2410: Keep a copy of platform data and use it.
Date: Fri, 22 Jul 2011 15:48:36 +0530
Message-ID: <1311329918-8105-2-git-send-email-thomas.abraham@linaro.org>
References: <1311329918-8105-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1311329918-8105-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

The platform data is copied into driver's private data and the copy is
used for all access to the platform data. This simpifies the addition
of device tree support for the i2c-s3c2410 driver.

Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 6c00c10..e132168 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -78,6 +78,7 @@ struct s3c24xx_i2c {
 	struct resource		*ioarea;
 	struct i2c_adapter	adap;
 
+	struct s3c2410_platform_i2c	pdata;
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
 #endif
@@ -626,7 +627,7 @@ static int s3c24xx_i2c_calcdivisor(unsigned long clkin, unsigned int wanted,
 
 static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *i2c, unsigned int *got)
 {
-	struct s3c2410_platform_i2c *pdata = i2c->dev->platform_data;
+	struct s3c2410_platform_i2c *pdata = &i2c->pdata;
 	unsigned long clkin = clk_get_rate(i2c->clk);
 	unsigned int divs, div1;
 	unsigned long target_frequency;
@@ -755,7 +756,7 @@ static int s3c24xx_i2c_init(struct s3c24xx_i2c *i2c)
 
 	/* get the plafrom data */
 
-	pdata = i2c->dev->platform_data;
+	pdata = &i2c->pdata;
 
 	/* inititalise the gpio */
 
@@ -810,6 +811,8 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	memcpy(&i2c->pdata, pdata, sizeof(*pdata));
+
 	strlcpy(i2c->adap.name, "s3c2410-i2c", sizeof(i2c->adap.name));
 	i2c->adap.owner   = THIS_MODULE;
 	i2c->adap.algo    = &s3c24xx_i2c_algorithm;
-- 
1.6.6.rc2
