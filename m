From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] usb: dwc3: exynos: Remove MODULE_ALIAS()
Date: Thu, 12 Jan 2017 10:59:01 -0300
Message-ID: <1484229541-21469-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:44910
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750905AbdALN7Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 08:59:16 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org

Exynos is DT-only, so there's no need for a platform MODALIAS.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/usb/dwc3/dwc3-exynos.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index e27899bb5706..2e555a69c8ab 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -288,7 +288,6 @@ static struct platform_driver dwc3_exynos_driver = {
 
 module_platform_driver(dwc3_exynos_driver);
 
-MODULE_ALIAS("platform:exynos-dwc3");
 MODULE_AUTHOR("Anton Tikhomirov <av.tikhomirov@samsung.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("DesignWare USB3 EXYNOS Glue Layer");
-- 
2.7.4
