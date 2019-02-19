From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 2/2] ASoC: samsung: i2s: Fix multiple "IIS multi" devices
 initialization
Date: Tue, 19 Feb 2019 16:19:41 +0100
Message-ID: <20190219151941.9795-2-s.nawrocki@samsung.com>
References: <20190219151941.9795-1-s.nawrocki@samsung.com>
        <CGME20190219152015epcas2p455d8fc3fa012de0f1e857b0b2c88f773@epcas2p4.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190219151941.9795-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: sbkim73@samsung.com, krzk@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On some SoCs (e.g. Exynos5433) there are multiple "IIS multi audio
interfaces" and the driver will try to register there multiple times
same platform device for the secondary FIFO, which of course fails
miserably.  To fix this we derive the secondary platform device name
from the primary device name. The secondary device name will now
be <primary_dev_name>-sec instead of fixed "samsung-i2s-sec".

The fixed platform_device_id table entry is removed as the secondary
device name is now dynamic and device/driver matching is done through
driver_override.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - fixed pdev->driver_override assignment,
 - ensure there is no need to release any resources claimed
   in i2s_create_secondary_device() function when that function fails.
---
 sound/soc/samsung/i2s.c    | 50 +++++++++++++++++++++++++-------------
 sound/soc/samsung/odroid.c |  2 +-
 2 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index cd92bb6e1da1..4231001226f4 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1339,20 +1339,35 @@ static int i2s_register_clock_provider(struct samsung_i2s_priv *priv)
 /* Create platform device for the secondary PCM */
 static int i2s_create_secondary_device(struct samsung_i2s_priv *priv)
 {
-	struct platform_device *pdev;
+	struct platform_device *pdev_sec;
+	const char *devname;
 	int ret;

-	pdev = platform_device_register_simple("samsung-i2s-sec", -1, NULL, 0);
-	if (!pdev)
+	devname = devm_kasprintf(&priv->pdev->dev, GFP_KERNEL, "%s-sec",
+				 dev_name(&priv->pdev->dev));
+	if (!devname)
 		return -ENOMEM;

-	ret = device_attach(&pdev->dev);
+	pdev_sec = platform_device_alloc(devname, -1);
+	if (!pdev_sec)
+		return -ENOMEM;
+
+	pdev_sec->driver_override = kstrdup("samsung-i2s", GFP_KERNEL);
+
+	ret = platform_device_add(pdev_sec);
 	if (ret < 0) {
-		dev_info(&pdev->dev, "device_attach() failed\n");
+		platform_device_put(pdev_sec);
 		return ret;
 	}

-	priv->pdev_sec = pdev;
+	ret = device_attach(&pdev_sec->dev);
+	if (ret <= 0) {
+		platform_device_unregister(priv->pdev_sec);
+		dev_info(&pdev_sec->dev, "device_attach() failed\n");
+		return ret;
+	}
+
+	priv->pdev_sec = pdev_sec;

 	return 0;
 }
@@ -1367,22 +1382,25 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 {
 	struct i2s_dai *pri_dai, *sec_dai = NULL;
 	struct s3c_audio_pdata *i2s_pdata = pdev->dev.platform_data;
-	struct resource *res;
 	u32 regs_base, idma_addr = 0;
 	struct device_node *np = pdev->dev.of_node;
 	const struct samsung_i2s_dai_data *i2s_dai_data;
-	int num_dais, ret;
+	const struct platform_device_id *id;
 	struct samsung_i2s_priv *priv;
+	struct resource *res;
+	int num_dais, ret;

-	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node)
+	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
 		i2s_dai_data = of_device_get_match_data(&pdev->dev);
-	else
-		i2s_dai_data = (struct samsung_i2s_dai_data *)
-				platform_get_device_id(pdev)->driver_data;
+	} else {
+		id = platform_get_device_id(pdev);

-	/* Nothing to do if it is the secondary device probe */
-	if (!i2s_dai_data)
-		return 0;
+		/* Nothing to do if it is the secondary device probe */
+		if (!id)
+			return 0;
+
+		i2s_dai_data = (struct samsung_i2s_dai_data *)id->driver_data;
+	}

 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -1637,8 +1655,6 @@ static const struct platform_device_id samsung_i2s_driver_ids[] = {
 	{
 		.name           = "samsung-i2s",
 		.driver_data	= (kernel_ulong_t)&i2sv3_dai_type,
-	}, {
-		.name           = "samsung-i2s-sec",
 	},
 	{},
 };
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 5b2bcd1d3450..bd2c5163dc7f 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -185,7 +185,7 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.ops = &odroid_card_fe_ops,
 		.name = "Secondary",
 		.stream_name = "Secondary",
-		.platform_name = "samsung-i2s-sec",
+		.platform_name = "3830000.i2s-sec",
 		.dynamic = 1,
 		.dpcm_playback = 1,
 	}
--
2.17.1
