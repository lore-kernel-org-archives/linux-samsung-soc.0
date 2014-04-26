From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 5/5 v2] iio: exynos_adc: do a reinit_completion before the
 conversion
Date: Sat, 26 Apr 2014 17:07:56 +0530
Message-ID: <1398512276-4105-6-git-send-email-ch.naveen@samsung.com>
References: <1398512276-4105-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1398512276-4105-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dianders@chromium.org, gregkh@linuxfoundation.org, naveenkrishna.ch@gmail.com, lars@metafoo.de, cpgs@samsung.com, grundler@chromium.org, jic23@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Add reinit_completion() before the wait_for_completion_timeout in
raw_read() call.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---
 drivers/iio/adc/exynos_adc.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 805c9f6..32290e6 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -151,6 +151,7 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
 		return -EINVAL;
 
 	mutex_lock(&indio_dev->mlock);
+	reinit_completion(&info->completion);
 
 	/* Select the channel to be used and Trigger conversion */
 	if (info->version == ADC_V2) {
-- 
1.7.9.5
