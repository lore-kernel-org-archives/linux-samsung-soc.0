From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH v2 4/4] DMA: PL330: unregister dma_device in module's remove function
Date: Fri,  5 Oct 2012 15:47:56 +0530
Message-ID: <1349432276-22919-5-git-send-email-inderpal.singh@linaro.org>
References: <1349432276-22919-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1349432276-22919-1-git-send-email-inderpal.singh@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jassisinghbrar@gmail.com, boojin.kim@samsung.com, vinod.koul@intel.com, patches@linaro.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

unregister dma_device in module's remove function.

Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
---
 drivers/dma/pl330.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 4b7a34d..e7dc040 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -3017,6 +3017,8 @@ static int __devexit pl330_remove(struct amba_device *adev)
 			return -EBUSY;
 	}
 
+	dma_async_device_unregister(&pdmac->ddma);
+
 	amba_set_drvdata(adev, NULL);
 
 	list_for_each_entry_safe(pch, _p, &pdmac->ddma.channels,
-- 
1.7.9.5
