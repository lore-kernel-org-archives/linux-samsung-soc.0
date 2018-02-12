From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 3/7] ASoC: samsung: i2s: Prevent external
 abort on exynos5433 I2S1 access
Date: Mon, 12 Feb 2018 17:15:34 +0100
Message-ID: <20180212161538.22669-4-s.nawrocki@samsung.com>
References: <20180212161538.22669-1-s.nawrocki@samsung.com>
 <CGME20180212161646epcas1p2dabca4c8d98d3e66b7a78133d926bccb@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20180212161538.22669-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: broonie@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, jcsing.lee@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

It seems both PCLK_I2S1 and SCLK_I2S1 clocks need to be enabled before
I2S1 control registers can be accessed on exynos5433. If SCLK clock
is disabled an exception is triggered. To fix this parent clock of
the RCLK_SRC clock is assigned to pri_dai->op_clk so required gate
clock is handled by the runtime PM ops.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - removed stray whitespace change.
---
 sound/soc/samsung/i2s.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 5088d12faeda..7b57ad11ca15 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1404,9 +1404,14 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = i2s_register_clock_provider(pdev);
-	if (!ret)
-		return 0;
+	if (ret < 0)
+		goto err_disable_pm;
+
+	pri_dai->op_clk = clk_get_parent(pri_dai->clk_table[CLK_I2S_RCLK_SRC]);
+
+	return 0;
 
+err_disable_pm:
 	pm_runtime_disable(&pdev->dev);
 err_disable_clk:
 	clk_disable_unprepare(pri_dai->clk);
-- 
2.14.2
