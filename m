From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 09/12] crypto: rockchip - use devm_platform_ioremap_resource() to simplify code
Date: Fri, 2 Aug 2019 21:28:06 +0800
Message-ID: <20190802132809.8116-10-yuehaibing@huawei.com>
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
 drivers/crypto/rockchip/rk3288_crypto.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto.c b/drivers/crypto/rockchip/rk3288_crypto.c
index 8d7e254..e5714ef 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.c
+++ b/drivers/crypto/rockchip/rk3288_crypto.c
@@ -311,7 +311,6 @@ MODULE_DEVICE_TABLE(of, crypto_of_id_table);
 
 static int rk_crypto_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct rk_crypto_info *crypto_info;
 	int err = 0;
@@ -339,8 +338,7 @@ static int rk_crypto_probe(struct platform_device *pdev)
 
 	spin_lock_init(&crypto_info->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	crypto_info->reg = devm_ioremap_resource(&pdev->dev, res);
+	crypto_info->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(crypto_info->reg)) {
 		err = PTR_ERR(crypto_info->reg);
 		goto err_crypto;
-- 
2.7.4
