From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 12/12] crypto: qcom-rng - use devm_platform_ioremap_resource() to simplify code
Date: Fri, 2 Aug 2019 21:28:09 +0800
Message-ID: <20190802132809.8116-13-yuehaibing@huawei.com>
References: <20190802132809.8116-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190802132809.8116-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: herbert@gondor.apana.org.au, lars.persson@axis.com, jesper.nilsson@axis.com, davem@davemloft.net, thomas.lendacky@amd.com, gary.hook@amd.com, krzk@kernel.org, kgene@kernel.org, antoine.tenart@bootlin.com, matthias.bgg@gmail.com, jamie@jamieiles.com, agross@kernel.org, heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, clabbe.montjoie@gmail.com, mripard@kernel.org, wens@csie.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-kernel@axis.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-samsung-soc@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/qcom-rng.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index e54249c..4730f84 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -153,7 +153,6 @@ static struct rng_alg qcom_rng_alg = {
 
 static int qcom_rng_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct qcom_rng *rng;
 	int ret;
 
@@ -164,8 +163,7 @@ static int qcom_rng_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rng);
 	mutex_init(&rng->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	rng->base = devm_ioremap_resource(&pdev->dev, res);
+	rng->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rng->base))
 		return PTR_ERR(rng->base);
 
-- 
2.7.4
