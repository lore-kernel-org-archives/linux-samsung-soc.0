From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] crypto: s5p-sss - Use AES_BLOCK_SIZE define instead of number
Date: Tue, 19 Feb 2019 13:01:03 +0100
Message-ID: <1550577663-10251-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Kamil Konieczny <k.konieczny@partner.samsung.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Replace hard coded AES block size with define.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/crypto/s5p-sss.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 0064be0e3941..39fc6942364b 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -1819,10 +1819,12 @@ static void s5p_set_aes(struct s5p_aes_dev *dev,
 	void __iomem *keystart;
 
 	if (iv)
-		memcpy_toio(dev->aes_ioaddr + SSS_REG_AES_IV_DATA(0), iv, 0x10);
+		memcpy_toio(dev->aes_ioaddr + SSS_REG_AES_IV_DATA(0), iv,
+			    AES_BLOCK_SIZE);
 
 	if (ctr)
-		memcpy_toio(dev->aes_ioaddr + SSS_REG_AES_CNT_DATA(0), ctr, 0x10);
+		memcpy_toio(dev->aes_ioaddr + SSS_REG_AES_CNT_DATA(0), ctr,
+			    AES_BLOCK_SIZE);
 
 	if (keylen == AES_KEYSIZE_256)
 		keystart = dev->aes_ioaddr + SSS_REG_AES_KEY_DATA(0);
-- 
2.7.4
