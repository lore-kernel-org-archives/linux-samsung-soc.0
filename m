From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ASoC: SAMSUNG: pcm: use clk_prepare_enable and
	clk_disable_unprepare
Date: Wed,  3 Oct 2012 08:47:16 +0900
Message-ID: <1349221636-2976-1-git-send-email-thomas.abraham@linaro.org>
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
Cc: kgene.kim@samsung.com, jassisinghbrar@gmail.com, broonie@opensource.wolfsonmicro.com, lrg@ti.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
calls as required by common clock framework.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 sound/soc/samsung/pcm.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index c860819..45f4a75 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -543,7 +543,7 @@ static __devinit int s3c_pcm_dev_probe(struct platform_device *pdev)
 		ret = PTR_ERR(pcm->cclk);
 		goto err1;
 	}
-	clk_enable(pcm->cclk);
+	clk_prepare_enable(pcm->cclk);
 
 	/* record our pcm structure for later use in the callbacks */
 	dev_set_drvdata(&pdev->dev, pcm);
@@ -568,7 +568,7 @@ static __devinit int s3c_pcm_dev_probe(struct platform_device *pdev)
 		ret = -ENOENT;
 		goto err4;
 	}
-	clk_enable(pcm->pclk);
+	clk_prepare_enable(pcm->pclk);
 
 	s3c_pcm_stereo_in[pdev->id].dma_addr = mem_res->start
 							+ S3C_PCM_RXFIFO;
@@ -592,14 +592,14 @@ static __devinit int s3c_pcm_dev_probe(struct platform_device *pdev)
 	return 0;
 
 err5:
-	clk_disable(pcm->pclk);
+	clk_disable_unprepare(pcm->pclk);
 	clk_put(pcm->pclk);
 err4:
 	iounmap(pcm->regs);
 err3:
 	release_mem_region(mem_res->start, resource_size(mem_res));
 err2:
-	clk_disable(pcm->cclk);
+	clk_disable_unprepare(pcm->cclk);
 	clk_put(pcm->cclk);
 err1:
 	return ret;
@@ -619,8 +619,8 @@ static __devexit int s3c_pcm_dev_remove(struct platform_device *pdev)
 	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	release_mem_region(mem_res->start, resource_size(mem_res));
 
-	clk_disable(pcm->cclk);
-	clk_disable(pcm->pclk);
+	clk_disable_unprepare(pcm->cclk);
+	clk_disable_unprepare(pcm->pclk);
 	clk_put(pcm->pclk);
 	clk_put(pcm->cclk);
 
-- 
1.7.4.1
