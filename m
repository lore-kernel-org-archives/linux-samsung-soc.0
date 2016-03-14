From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] hwrng: exynos - Enable COMPILE_TEST
Date: Mon, 14 Mar 2016 13:19:55 +0900
Message-ID: <1457929195-22298-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-crypto-owner@vger.kernel.org>
Sender: linux-crypto-owner@vger.kernel.org
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Get some build coverage of Exynos H/W random number generator
driver. Driver uses devm_ioremap_resource() so add IOMEM dependency for
the compile testing.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Compile-tested on x86, x86_64, ppc64, arm, arm64 and mips.
---
 drivers/char/hw_random/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index 67ee8b08ab53..3c5be60befce 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -309,7 +309,8 @@ config HW_RANDOM_POWERNV
 
 config HW_RANDOM_EXYNOS
 	tristate "EXYNOS HW random number generator support"
-	depends on ARCH_EXYNOS
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	depends on HAS_IOMEM
 	default HW_RANDOM
 	---help---
 	  This driver provides kernel-side support for the Random Number
-- 
2.5.0
