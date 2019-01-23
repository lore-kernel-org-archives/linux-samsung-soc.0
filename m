From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v2 3/3] crypto: s5p: add AES support for Exynos5433
Date: Wed, 23 Jan 2019 17:55:33 +0100
Message-ID: <20190123165533.29645-4-k.konieczny@partner.samsung.com>
References: <20190123165533.29645-1-k.konieczny@partner.samsung.com>
        <CGME20190123165551eucas1p1cd99462e3767dbb4feb88b996225ed21@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123165533.29645-1-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add AES crypto HW acceleration for Exynos5433, with the help of SlimSSS IP.

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 drivers/crypto/s5p-sss.c | 50 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 0064be0e3941..e2d247f59254 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -232,6 +232,7 @@
  * struct samsung_aes_variant - platform specific SSS driver data
  * @aes_offset: AES register offset from SSS module's base.
  * @hash_offset: HASH register offset from SSS module's base.
+ * @clk_names: names of clocks needed to run SSS IP
  *
  * Specifies platform specific configuration of SSS module.
  * Note: A structure for driver specific platform data is used for future
@@ -240,6 +241,7 @@
 struct samsung_aes_variant {
 	unsigned int			aes_offset;
 	unsigned int			hash_offset;
+	char				*clk_names[];
 };
 
 struct s5p_aes_reqctx {
@@ -296,6 +298,7 @@ struct s5p_aes_ctx {
 struct s5p_aes_dev {
 	struct device			*dev;
 	struct clk			*clk;
+	struct clk			*pclk;
 	void __iomem			*ioaddr;
 	void __iomem			*aes_ioaddr;
 	int				irq_fc;
@@ -384,11 +387,19 @@ struct s5p_hash_ctx {
 static const struct samsung_aes_variant s5p_aes_data = {
 	.aes_offset	= 0x4000,
 	.hash_offset	= 0x6000,
+	.clk_names	= { "secss", },
 };
 
 static const struct samsung_aes_variant exynos_aes_data = {
 	.aes_offset	= 0x200,
 	.hash_offset	= 0x400,
+	.clk_names	= { "secss", },
+};
+
+static const struct samsung_aes_variant exynos5433_slim_aes_data = {
+	.aes_offset	= 0x400,
+	.hash_offset	= 0x800,
+	.clk_names	= { "pclk", "aclk", },
 };
 
 static const struct of_device_id s5p_sss_dt_match[] = {
@@ -400,6 +411,10 @@ static const struct of_device_id s5p_sss_dt_match[] = {
 		.compatible = "samsung,exynos4210-secss",
 		.data = &exynos_aes_data,
 	},
+	{
+		.compatible = "samsung,exynos5433-slim-sss",
+		.data = &exynos5433_slim_aes_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, s5p_sss_dt_match);
@@ -2208,18 +2223,39 @@ static int s5p_aes_probe(struct platform_device *pdev)
 			return PTR_ERR(pdata->ioaddr);
 	}
 
-	pdata->clk = devm_clk_get(dev, "secss");
+	pdata->clk = devm_clk_get(dev, variant->clk_names[0]);
 	if (IS_ERR(pdata->clk)) {
-		dev_err(dev, "failed to find secss clock source\n");
+		dev_err(dev, "failed to find secss clock %s\n",
+			variant->clk_names[0]);
 		return -ENOENT;
 	}
 
 	err = clk_prepare_enable(pdata->clk);
 	if (err < 0) {
-		dev_err(dev, "Enabling SSS clk failed, err %d\n", err);
+		dev_err(dev, "Enabling clock %s failed, err %d\n",
+			variant->clk_names[0], err);
 		return err;
 	}
 
+	if (variant->clk_names[1]) {
+		pdata->pclk = devm_clk_get(dev, variant->clk_names[1]);
+		if (IS_ERR(pdata->pclk)) {
+			dev_err(dev, "failed to find clock %s\n",
+				variant->clk_names[1]);
+			err = -ENOENT;
+			goto err_clk;
+		}
+
+		err = clk_prepare_enable(pdata->pclk);
+		if (err < 0) {
+			dev_err(dev, "Enabling clock %s failed, err %d\n",
+				variant->clk_names[0], err);
+			goto err_clk;
+		}
+	} else {
+		pdata->pclk = NULL;
+	}
+
 	spin_lock_init(&pdata->lock);
 	spin_lock_init(&pdata->hash_lock);
 
@@ -2295,8 +2331,11 @@ static int s5p_aes_probe(struct platform_device *pdev)
 	tasklet_kill(&pdata->tasklet);
 
 err_irq:
-	clk_disable_unprepare(pdata->clk);
+	if (pdata->pclk)
+		clk_disable_unprepare(pdata->pclk);
 
+err_clk:
+	clk_disable_unprepare(pdata->clk);
 	s5p_dev = NULL;
 
 	return err;
@@ -2323,6 +2362,9 @@ static int s5p_aes_remove(struct platform_device *pdev)
 		pdata->use_hash = false;
 	}
 
+	if (pdata->pclk)
+		clk_disable_unprepare(pdata->pclk);
+
 	clk_disable_unprepare(pdata->clk);
 	s5p_dev = NULL;
 
-- 
2.20.0
