From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH 1/3] DMA: PL330: Free memory allocated for peripheral channels
Date: Tue, 25 Sep 2012 14:27:34 +0530
Message-ID: <1348563456-30569-2-git-send-email-inderpal.singh@linaro.org>
References: <1348563456-30569-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1348563456-30569-1-git-send-email-inderpal.singh@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jassisinghbrar@gmail.com, boojin.kim@samsung.com, vinod.koul@intel.com, patches@linaro.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The allocated memory for peripheral channels is not being freed upon
failure in probe and in module's remove funtion. It will lead to memory
leakage. Hence free the allocated memory.

Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
---
 drivers/dma/pl330.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 2ebd4cd..10c6b6a 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2962,7 +2962,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 	ret = dma_async_device_register(pd);
 	if (ret) {
 		dev_err(&adev->dev, "unable to register DMAC\n");
-		goto probe_err4;
+		goto probe_err5;
 	}
 
 	dev_info(&adev->dev,
@@ -2975,6 +2975,8 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 
 	return 0;
 
+probe_err5:
+	kfree(pdmac->peripherals);
 probe_err4:
 	pl330_del(pi);
 probe_err3:
@@ -3025,6 +3027,7 @@ static int __devexit pl330_remove(struct amba_device *adev)
 	res = &adev->res;
 	release_mem_region(res->start, resource_size(res));
 
+	kfree(pdmac->peripherals);
 	kfree(pdmac);
 
 	return 0;
-- 
1.7.9.5
