From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 1/2] ASoC: samsung: i2s: Fix secondary platform device
 unregistration
Date: Tue, 19 Feb 2019 16:19:40 +0100
Message-ID: <20190219151941.9795-1-s.nawrocki@samsung.com>
References: <CGME20190219152012epcas1p4df1d6e4f6439ab05de95c089a4416e06@epcas1p4.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: sbkim73@samsung.com, krzk@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This fixes unregistration of the secondary platform device so all
resources are properly released.  Additionally the removal sequence
is corrected so it is in reverse order comparing to probe sequence.
The test against NULL priv->pdev_sec is removed as it is not necessary.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - corrected order of calls on error path in probe() and in remove().

 sound/soc/samsung/i2s.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 02472f576e17..cd92bb6e1da1 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1359,11 +1359,10 @@ static int i2s_create_secondary_device(struct samsung_i2s_priv *priv)

 static void i2s_delete_secondary_device(struct samsung_i2s_priv *priv)
 {
-	if (priv->pdev_sec) {
-		platform_device_del(priv->pdev_sec);
-		priv->pdev_sec = NULL;
-	}
+	platform_device_unregister(priv->pdev_sec);
+	priv->pdev_sec = NULL;
 }
+
 static int samsung_i2s_probe(struct platform_device *pdev)
 {
 	struct i2s_dai *pri_dai, *sec_dai = NULL;
@@ -1487,14 +1486,14 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 						sec_dai->filter, "tx-sec", NULL,
 						&pdev->dev);
 		if (ret < 0)
-			goto err_disable_clk;
+			goto err_del_sec;

 	}

 	if (i2s_pdata && i2s_pdata->cfg_gpio && i2s_pdata->cfg_gpio(pdev)) {
 		dev_err(&pdev->dev, "Unable to configure gpio\n");
 		ret = -EINVAL;
-		goto err_disable_clk;
+		goto err_del_sec;
 	}

 	dev_set_drvdata(&pdev->dev, priv);
@@ -1503,7 +1502,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 					&samsung_i2s_component,
 					priv->dai_drv, num_dais);
 	if (ret < 0)
-		goto err_disable_clk;
+		goto err_del_sec;

 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -1518,9 +1517,10 @@ static int samsung_i2s_probe(struct platform_device *pdev)

 err_disable_pm:
 	pm_runtime_disable(&pdev->dev);
+err_del_sec:
+	i2s_delete_secondary_device(priv);
 err_disable_clk:
 	clk_disable_unprepare(priv->clk);
-	i2s_delete_secondary_device(priv);
 	return ret;
 }

@@ -1536,9 +1536,10 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);

 	i2s_unregister_clock_provider(priv);
+	i2s_delete_secondary_device(priv);
 	clk_disable_unprepare(priv->clk);
+
 	pm_runtime_put_noidle(&pdev->dev);
-	i2s_delete_secondary_device(priv);

 	return 0;
 }
--
2.17.1
