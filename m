From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] media: platform: s3c-camif: fix arguments position in
 function call
Date: Thu, 1 Jun 2017 22:43:41 -0500
Message-ID: <20170602034341.GA5349@embeddedgus>
References: <da5c5727-628d-1887-368c-970d5308ee72@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gateway33.websitewelcome.com ([192.185.145.216]:31555 "EHLO
        gateway33.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751135AbdFBDnq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Jun 2017 23:43:46 -0400
Received: from cm6.websitewelcome.com (cm6.websitewelcome.com [108.167.139.19])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id E0D8E83777
        for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Jun 2017 22:43:43 -0500 (CDT)
Content-Disposition: inline
In-Reply-To: <da5c5727-628d-1887-368c-970d5308ee72@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>

Hi Sylwester,

Here is another patch in case you decide that it is
better to apply this one.

Thanks
--
Gustavo A. R. Silva


==========

Fix the position of the arguments in function call.

Addresses-Coverity-ID: 1248800
Addresses-Coverity-ID: 1269141
Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/media/platform/s3c-camif/camif-capture.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
index 1b30be72..25c7a7d 100644
--- a/drivers/media/platform/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/s3c-camif/camif-capture.c
@@ -80,7 +80,7 @@ static int s3c_camif_hw_init(struct camif_dev *camif, struct camif_vp *vp)
 	camif_hw_set_test_pattern(camif, camif->test_pattern);
 	if (variant->has_img_effect)
 		camif_hw_set_effect(camif, camif->colorfx,
-				camif->colorfx_cb, camif->colorfx_cr);
+				camif->colorfx_cr, camif->colorfx_cb);
 	if (variant->ip_revision == S3C6410_CAMIF_IP_REV)
 		camif_hw_set_input_path(vp);
 	camif_cfg_video_path(vp);
@@ -364,7 +364,7 @@ irqreturn_t s3c_camif_irq_handler(int irq, void *priv)
 		camif_hw_set_test_pattern(camif, camif->test_pattern);
 		if (camif->variant->has_img_effect)
 			camif_hw_set_effect(camif, camif->colorfx,
-				    camif->colorfx_cb, camif->colorfx_cr);
+				    camif->colorfx_cr, camif->colorfx_cb);
 		vp->state &= ~ST_VP_CONFIG;
 	}
 unlock:
-- 
2.5.0
