From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 04/12] crypto: img-hash - use devm_platform_ioremap_resource() to simplify code
Date: Fri, 2 Aug 2019 21:28:01 +0800
Message-ID: <20190802132809.8116-5-yuehaibing@huawei.com>
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
 drivers/crypto/img-hash.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/crypto/img-hash.c b/drivers/crypto/img-hash.c
index d27c812..f5a71fa 100644
--- a/drivers/crypto/img-hash.c
+++ b/drivers/crypto/img-hash.c
@@ -958,9 +958,7 @@ static int img_hash_probe(struct platform_device *pdev)
 	crypto_init_queue(&hdev->queue, IMG_HASH_QUEUE_LENGTH);
 
 	/* Register bank */
-	hash_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	hdev->io_base = devm_ioremap_resource(dev, hash_res);
+	hdev->io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdev->io_base)) {
 		err = PTR_ERR(hdev->io_base);
 		dev_err(dev, "can't ioremap, returned %d\n", err);
-- 
2.7.4
