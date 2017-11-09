From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] crypto: s5p-sss - Remove a stray tab
Date: Fri, 10 Nov 2017 00:26:04 +0300
Message-ID: <20171109212604.i3zbzlmfotz5b7rr@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-crypto-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This code seems correct, but the goto was indented too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 142c6020cec7..62830a43d959 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -1461,7 +1461,7 @@ static void s5p_hash_tasklet_cb(unsigned long data)
 				       &dd->hash_flags)) {
 			/* hash or semi-hash ready */
 			clear_bit(HASH_FLAGS_DMA_READY, &dd->hash_flags);
-				goto finish;
+			goto finish;
 		}
 	}
 
