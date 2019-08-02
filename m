From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 06/12] crypto: mediatek - use
 devm_platform_ioremap_resource() to simplify code
Date: Fri, 2 Aug 2019 21:28:03 +0800
Message-ID: <20190802132809.8116-7-yuehaibing@huawei.com>
References: <20190802132809.8116-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190802132809.8116-1-yuehaibing@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: herbert@gondor.apana.org.au, lars.persson@axis.com, jesper.nilsson@axis.com, davem@davemloft.net, thomas.lendacky@amd.com, gary.hook@amd.com, krzk@kernel.org, kgene@kernel.org, antoine.tenart@bootlin.com, matthias.bgg@gmail.com, jamie@jamieiles.com, agross@kernel.org, heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, clabbe.montjoie@gmail.com, mripard@kernel.org, wens@csie.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/mediatek/mtk-platform.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/mediatek/mtk-platform.c b/drivers/crypto/mediatek/mtk-platform.c
index 125318a..12462136 100644
--- a/drivers/crypto/mediatek/mtk-platform.c
+++ b/drivers/crypto/mediatek/mtk-platform.c
@@ -481,7 +481,6 @@ static int mtk_desc_ring_alloc(struct mtk_cryp *cryp)
 
 static int mtk_crypto_probe(struct platform_device *pdev)
 {
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	struct mtk_cryp *cryp;
 	int i, err;
 
@@ -489,7 +488,7 @@ static int mtk_crypto_probe(struct platform_device *pdev)
 	if (!cryp)
 		return -ENOMEM;
 
-	cryp->base = devm_ioremap_resource(&pdev->dev, res);
+	cryp->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(cryp->base))
 		return PTR_ERR(cryp->base);
 
-- 
2.7.4
