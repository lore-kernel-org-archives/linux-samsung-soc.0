From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 02/12] crypto: ccp - use devm_platform_ioremap_resource() to simplify code
Date: Fri, 2 Aug 2019 21:27:59 +0800
Message-ID: <20190802132809.8116-3-yuehaibing@huawei.com>
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
 drivers/crypto/ccp/sp-platform.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/crypto/ccp/sp-platform.c b/drivers/crypto/ccp/sp-platform.c
index 1b45236..831aac1 100644
--- a/drivers/crypto/ccp/sp-platform.c
+++ b/drivers/crypto/ccp/sp-platform.c
@@ -125,7 +125,6 @@ static int sp_platform_probe(struct platform_device *pdev)
 	struct sp_platform *sp_platform;
 	struct device *dev = &pdev->dev;
 	enum dev_dma_attr attr;
-	struct resource *ior;
 	int ret;
 
 	ret = -ENOMEM;
@@ -146,8 +145,7 @@ static int sp_platform_probe(struct platform_device *pdev)
 		goto e_err;
 	}
 
-	ior = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	sp->io_map = devm_ioremap_resource(dev, ior);
+	sp->io_map = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sp->io_map)) {
 		ret = PTR_ERR(sp->io_map);
 		goto e_err;
-- 
2.7.4
