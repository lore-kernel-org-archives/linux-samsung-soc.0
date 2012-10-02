From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ASoC: SAMSUNG: spdif: use clk_prepare_enable
	and clk_disable_unprepare
Date: Wed,  3 Oct 2012 08:48:25 +0900
Message-ID: <1349221705-3030-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: alsa-devel@alsa-project.org
Cc: kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, lrg@ti.com, linux-samsung-soc@vger.kernel.org, sw.youn@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
calls as required by common clock framework.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 sound/soc/samsung/spdif.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index bc24c7a..5f3b06d 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -397,7 +397,7 @@ static __devinit int spdif_probe(struct platform_device *pdev)
 		ret = -ENOENT;
 		goto err0;
 	}
-	clk_enable(spdif->pclk);
+	clk_prepare_enable(spdif->pclk);
 
 	spdif->sclk = clk_get(&pdev->dev, "sclk_spdif");
 	if (IS_ERR(spdif->sclk)) {
@@ -405,7 +405,7 @@ static __devinit int spdif_probe(struct platform_device *pdev)
 		ret = -ENOENT;
 		goto err1;
 	}
-	clk_enable(spdif->sclk);
+	clk_prepare_enable(spdif->sclk);
 
 	/* Request S/PDIF Register's memory region */
 	if (!request_mem_region(mem_res->start,
@@ -444,10 +444,10 @@ err4:
 err3:
 	release_mem_region(mem_res->start, resource_size(mem_res));
 err2:
-	clk_disable(spdif->sclk);
+	clk_disable_unprepare(spdif->sclk);
 	clk_put(spdif->sclk);
 err1:
-	clk_disable(spdif->pclk);
+	clk_disable_unprepare(spdif->pclk);
 	clk_put(spdif->pclk);
 err0:
 	return ret;
@@ -466,9 +466,9 @@ static __devexit int spdif_remove(struct platform_device *pdev)
 	if (mem_res)
 		release_mem_region(mem_res->start, resource_size(mem_res));
 
-	clk_disable(spdif->sclk);
+	clk_disable_unprepare(spdif->sclk);
 	clk_put(spdif->sclk);
-	clk_disable(spdif->pclk);
+	clk_disable_unprepare(spdif->pclk);
 	clk_put(spdif->pclk);
 
 	return 0;
-- 
1.7.4.1
