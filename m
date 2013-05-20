From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH] iio: exynos_adc: fix wrong structure extration in suspend and
 resume
Date: Mon, 20 May 2013 12:04:49 +0530
Message-ID: <1369031689-23189-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dianders@chromium.org, gregkh@linuxfoundation.org, naveenkrishna.ch@gmail.com, lars@metafoo.de
List-Id: linux-samsung-soc@vger.kernel.org

The exynos_adc device structure was wrongly extracted from the dev*
correcting the same.

Using the regular conversion of
struct device* -> struct platform_device* -> struct exynos_adc* seems wrong.
Instead we should be doing
struct device* -> struct iio_dev* -> struct exynos_adc*

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
 drivers/iio/adc/exynos_adc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index a6c4df5..2347df5 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -403,8 +403,8 @@ static int exynos_adc_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int exynos_adc_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct exynos_adc *info = platform_get_drvdata(pdev);
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct exynos_adc *info = iio_priv(indio_dev);
 	u32 con;
 
 	if (info->version == ADC_V2) {
@@ -426,8 +426,8 @@ static int exynos_adc_suspend(struct device *dev)
 
 static int exynos_adc_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct exynos_adc *info = platform_get_drvdata(pdev);
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct exynos_adc *info = iio_priv(indio_dev);
 	int ret;
 
 	ret = regulator_enable(info->vdd);
-- 
1.7.12.4
