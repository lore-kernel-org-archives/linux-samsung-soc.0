From: Naveen Krishna Chatradhi <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] iio: adc: exynos_adc: Handle timeout issues
Date: Wed,  3 Apr 2013 21:06:28 -0700
Message-ID: <1365048389-6364-1-git-send-email-naveenkrishna.ch@gmail.com>
References: <1363364801-23684-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363364801-23684-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

This patch does the following
1. Handle the return values of wait_for_completion_interruptible_timeout
2. Reset software if a timeout happes.

Note: submitted for review at https://patchwork.kernel.org/patch/2279591/

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
---
As per the comments from Doug at
http://marc.info/?l=linux-kernel&m=136500878406955&w=3

Changes since v1:
1. Remove the spin lock implememtation and the INIT_COMPLETION
2. Rearrange the code and reset the ADC in cases of timeout.

 drivers/iio/adc/exynos_adc.c | 73 ++++++++++++++++++++++++++------------------
 1 file changed, 43 insertions(+), 30 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 5ab0dfd..a6c4df5 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -111,6 +111,35 @@ static inline unsigned int exynos_adc_get_version(struct platform_device *pdev)
 	return (unsigned int)match->data;
 }
 
+static void exynos_adc_hw_init(struct exynos_adc *info)
+{
+	u32 con1, con2;
+	int delay;
+
+	if (info->version == ADC_V2) {
+		con1 = ADC_V2_CON1_SOFT_RESET;
+		writel(con1, ADC_V2_CON1(info->regs));
+
+		/* ADC H/W requires 25PCLKs before other register access */
+		delay = DIV_ROUND_UP(25 * 1000000, clk_get_rate(info->clk));
+		udelay(delay);
+
+		con2 = ADC_V2_CON2_OSEL | ADC_V2_CON2_ESEL |
+			ADC_V2_CON2_HIGHF | ADC_V2_CON2_C_TIME(0);
+		writel(con2, ADC_V2_CON2(info->regs));
+
+		/* Enable interrupts */
+		writel(1, ADC_V2_INT_EN(info->regs));
+	} else {
+		/* set default prescaler values and Enable prescaler */
+		con1 =  ADC_V1_CON_PRSCLV(49) | ADC_V1_CON_PRSCEN;
+
+		/* Enable 12-bit ADC resolution */
+		con1 |= ADC_V1_CON_RES;
+		writel(con1, ADC_V1_CON(info->regs));
+	}
+}
+
 static int exynos_read_raw(struct iio_dev *indio_dev,
 				struct iio_chan_spec const *chan,
 				int *val,
@@ -118,8 +147,9 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
 				long mask)
 {
 	struct exynos_adc *info = iio_priv(indio_dev);
-	unsigned long timeout;
+	long timeout;
 	u32 con1, con2;
+	int ret;
 
 	if (mask != IIO_CHAN_INFO_RAW)
 		return -EINVAL;
@@ -146,14 +176,21 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
 
 	timeout = wait_for_completion_interruptible_timeout
 			(&info->completion, EXYNOS_ADC_TIMEOUT);
-	*val = info->value;
 
-	mutex_unlock(&indio_dev->mlock);
+	if (timeout == 0) {
+		dev_warn(&indio_dev->dev, "Conversion timed out reseting\n");
+		exynos_adc_hw_init(info);
+		ret = -ETIMEDOUT;
+	} else if (timeout < 0) {
+		ret = timeout;
+	} else {
+		*val = info->value;
+		ret = IIO_VAL_INT;
+	}
 
-	if (timeout == 0)
-		return -ETIMEDOUT;
+	mutex_unlock(&indio_dev->mlock);
 
-	return IIO_VAL_INT;
+	return ret;
 }
 
 static irqreturn_t exynos_adc_isr(int irq, void *dev_id)
@@ -225,30 +262,6 @@ static int exynos_adc_remove_devices(struct device *dev, void *c)
 	return 0;
 }
 
-static void exynos_adc_hw_init(struct exynos_adc *info)
-{
-	u32 con1, con2;
-
-	if (info->version == ADC_V2) {
-		con1 = ADC_V2_CON1_SOFT_RESET;
-		writel(con1, ADC_V2_CON1(info->regs));
-
-		con2 = ADC_V2_CON2_OSEL | ADC_V2_CON2_ESEL |
-			ADC_V2_CON2_HIGHF | ADC_V2_CON2_C_TIME(0);
-		writel(con2, ADC_V2_CON2(info->regs));
-
-		/* Enable interrupts */
-		writel(1, ADC_V2_INT_EN(info->regs));
-	} else {
-		/* set default prescaler values and Enable prescaler */
-		con1 =  ADC_V1_CON_PRSCLV(49) | ADC_V1_CON_PRSCEN;
-
-		/* Enable 12-bit ADC resolution */
-		con1 |= ADC_V1_CON_RES;
-		writel(con1, ADC_V1_CON(info->regs));
-	}
-}
-
 static int exynos_adc_probe(struct platform_device *pdev)
 {
 	struct exynos_adc *info = NULL;
-- 
1.7.12.4
