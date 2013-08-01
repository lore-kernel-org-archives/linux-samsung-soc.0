From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: samsung: Make secondary I2S DAI device a
	child of primary
Date: Thu,  1 Aug 2013 11:04:24 +0100
Message-ID: <1375351464-32618-1-git-send-email-broonie@kernel.org>
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
To: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Mark Brown <broonie@linaro.org>

More for neatness than for any great utility. Really we shouldn't be
creating the child device at all, refactoring will follow.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 sound/soc/samsung/i2s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index a3e4b49..47e08dd 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1019,6 +1019,8 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 		if (IS_ERR(i2s->pdev))
 			return NULL;
 
+		i2s->pdev->dev.parent = &pdev->dev;
+
 		platform_set_drvdata(i2s->pdev, i2s);
 		ret = platform_device_add(i2s->pdev);
 		if (ret < 0)
-- 
1.8.3.2
