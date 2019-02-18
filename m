From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH] crypto: s5p: update iv after AES op end
Date: Mon, 18 Feb 2019 17:00:46 +0100
Message-ID: <20190218160046.6387-1-k.konieczny@partner.samsung.com>
References: <CGME20190218160113eucas1p2183a3620f8322ee33273d3bfe5f06486@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix bug "s5p-sss crypto driver doesn't set next AES-CBC IV". This should
also fix AES-CTR mode. Tested on Odroid U3 with Eric Biggers branch
"iv-out-testing".

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 drivers/crypto/s5p-sss.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 0064be0e3941..3ea058addad3 100644
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
+		memcpy_fromio(req->info, dev->aes_ioaddr + SSS_REG_AES_IV_DATA(0), 0x10);
+
+	if (reqctx->mode & FLAGS_AES_CTR)
+		memcpy_fromio(req->info, dev->aes_ioaddr + SSS_REG_AES_CNT_DATA(0), 0x10);
 }
 
 /* Calls the completion. Cannot be called with dev->lock hold. */
-- 
2.20.1
