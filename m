From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] crypto: s5p-sss - Enable COMPILE_TEST
Date: Mon, 14 Mar 2016 13:20:18 +0900
Message-ID: <1457929218-22358-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-crypto-owner@vger.kernel.org>
Sender: linux-crypto-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Get some build coverage of S5P/Exynos AES H/W acceleration driver.
Driver uses DMA and devm_ioremap_resource() so add DMA and IOMEM
dependencies for the compile testing.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Compile-tested on x86, x86_64, ppc64, arm, arm64 and mips.
---
 drivers/crypto/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 477fffdb4f49..7a51ac0ac290 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -342,7 +342,8 @@ config CRYPTO_DEV_SAHARA
 
 config CRYPTO_DEV_S5P
 	tristate "Support for Samsung S5PV210/Exynos crypto accelerator"
-	depends on ARCH_S5PV210 || ARCH_EXYNOS
+	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
+	depends on HAS_IOMEM && HAS_DMA
 	select CRYPTO_AES
 	select CRYPTO_BLKCIPHER
 	help
-- 
2.5.0
