From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v2] crypto: s5p: update iv after AES-CBC op end
Date: Tue, 19 Feb 2019 17:02:32 +0100
Message-ID: <20190219160232.22084-1-k.konieczny@partner.samsung.com>
References: <CGME20190219160249eucas1p17f521e74a9acab6a330e72a3c682adce@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix bug "s5p-sss crypto driver doesn't set next AES-CBC IV". While at this,
fix also AES-CTR mode. Tested on Odroid U3 with Eric Biggers branch
"iv-out-testing".

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
Reported-by: Eric Biggers <ebiggers@kernel.org>
---
Changes since v1:
 - reworded Subject and commit message
 - changed code according to comments by Krzysztof Kozlowski
 - added Reported-by line
---
 drivers/crypto/s5p-sss.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 0064be0e3941..30b4f1015d8f 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -463,6 +463,9 @@ static void s5p_sg_copy_buf(void *buf, struct scatterlist *sg,
 
 static void s5p_sg_done(struct s5p_aes_dev *dev)
 {
+	struct ablkcipher_request *req = dev->req;
+	struct s5p_aes_reqctx *reqctx = ablkcipher_request_ctx(req);
+
 	if (dev->sg_dst_cpy) {
 		dev_dbg(dev->dev,
 			"Copying %d bytes of output data back to original place\n",
@@ -472,6 +475,11 @@ static void s5p_sg_done(struct s5p_aes_dev *dev)
 	}
 	s5p_free_sg_cpy(dev, &dev->sg_src_cpy);
 	s5p_free_sg_cpy(dev, &dev->sg_dst_cpy);
+	if (reqctx->mode & FLAGS_AES_CBC)
+		memcpy_fromio(req->info, dev->aes_ioaddr + SSS_REG_AES_IV_DATA(0), AES_BLOCK_SIZE);
+
+	else if (reqctx->mode & FLAGS_AES_CTR)
+		memcpy_fromio(req->info, dev->aes_ioaddr + SSS_REG_AES_CNT_DATA(0), AES_BLOCK_SIZE);
 }
 
 /* Calls the completion. Cannot be called with dev->lock hold. */
-- 
2.20.1
