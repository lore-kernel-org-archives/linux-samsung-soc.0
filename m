From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 11/12] crypto: qce - use devm_platform_ioremap_resource() to simplify code
Date: Fri, 2 Aug 2019 21:28:08 +0800
Message-ID: <20190802132809.8116-12-yuehaibing@huawei.com>
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
 drivers/crypto/qce/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ef1d74e..08d4ce3 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -167,7 +167,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
-	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -177,8 +176,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	qce->base = devm_ioremap_resource(&pdev->dev, res);
+	qce->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
-- 
2.7.4
