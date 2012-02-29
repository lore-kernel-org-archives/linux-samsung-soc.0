From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: [PATCH 3/3] [media] s5p-tv: Add initial DT-support for TV mixer
Date: Wed, 29 Feb 2012 15:51:47 +0100
Message-ID: <1330527107-21222-4-git-send-email-k.lewandowsk@samsung.com>
References: <1330527107-21222-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1330527107-21222-1-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: t.stanislaws@samsung.com
Cc: m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, Karol Lewandowski <k.lewandowsk@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

---
 drivers/media/video/s5p-tv/mixer_drv.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/media/video/s5p-tv/mixer_drv.c b/drivers/media/video/s5p-tv/mixer_drv.c
index a2c0c25..6bf4a9e 100644
--- a/drivers/media/video/s5p-tv/mixer_drv.c
+++ b/drivers/media/video/s5p-tv/mixer_drv.c
@@ -448,6 +448,14 @@ static int __devexit mxr_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id mxr_dt_match[] = {
+	{ .compatible = "samsung,exynos4210-tvmixer" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mxr_dt_match);
+#endif
+
 static struct platform_driver mxr_driver __refdata = {
 	.probe = mxr_probe,
 	.remove = __devexit_p(mxr_remove),
@@ -455,6 +463,7 @@ static struct platform_driver mxr_driver __refdata = {
 		.name = MXR_DRIVER_NAME,
 		.owner = THIS_MODULE,
 		.pm = &mxr_pm_ops,
+		.of_match_table = of_match_ptr(mxr_dt_match),
 	}
 };
 
-- 
1.7.8.3
