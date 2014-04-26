From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/5 v2] iio: exynos_adc: use indio_dev->dev structure to handle
 child nodes
Date: Sat, 26 Apr 2014 17:07:52 +0530
Message-ID: <1398512276-4105-2-git-send-email-ch.naveen@samsung.com>
References: <1398512276-4105-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1398512276-4105-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Using pdev->dev with device_for_each_child() would iterate over all
of the children of the platform device and delete them.
Thus, causing crashes during module unload.

We should be using the indio_dev->dev structure for
registering/unregistering child nodes.

Signed-off-by: Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reported-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
This change was tested on top of 
   https://lkml.org/lkml/2014/4/21/481 from Doug.

 drivers/iio/adc/exynos_adc.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index d25b262..affa93f 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -344,7 +344,7 @@ static int exynos_adc_probe(struct platform_device *pdev)
 
 	exynos_adc_hw_init(info);
 
-	ret = of_platform_populate(np, exynos_adc_match, NULL, &pdev->dev);
+	ret = of_platform_populate(np, exynos_adc_match, NULL, &indio_dev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed adding child nodes\n");
 		goto err_of_populate;
@@ -353,7 +353,7 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	return 0;
 
 err_of_populate:
-	device_for_each_child(&pdev->dev, NULL,
+	device_for_each_child(&indio_dev->dev, NULL,
 				exynos_adc_remove_devices);
 	regulator_disable(info->vdd);
 	clk_disable_unprepare(info->clk);
@@ -369,7 +369,7 @@ static int exynos_adc_remove(struct platform_device *pdev)
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 	struct exynos_adc *info = iio_priv(indio_dev);
 
-	device_for_each_child(&pdev->dev, NULL,
+	device_for_each_child(&indio_dev->dev, NULL,
 				exynos_adc_remove_devices);
 	regulator_disable(info->vdd);
 	clk_disable_unprepare(info->clk);
-- 
1.7.9.5
