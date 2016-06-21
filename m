From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [[PATCH v2] 11/11] hwrng: exynos - fixup IO accesors
Date: Tue, 21 Jun 2016 11:20:32 +0100
Message-ID: <1466504432-24187-12-git-send-email-ben.dooks@codethink.co.uk>
References: <1466504432-24187-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1466504432-24187-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-crypto-owner@vger.kernel.org
To: matthew.leach@codethink.co.uk, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>, Matt Mackall <mpm@selenic.com>, linux-crypto@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The __raw IO functions are not endian safe, so use the readl_relaxed
and writel_relaxed versions of these.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
CC: Matt Mackall <mpm@selenic.com>
CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
CC: linux-crypto@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
---
 drivers/char/hw_random/exynos-rng.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/exynos-rng.c b/drivers/char/hw_random/exynos-rng.c
index ed44561..23d3585 100644
--- a/drivers/char/hw_random/exynos-rng.c
+++ b/drivers/char/hw_random/exynos-rng.c
@@ -45,12 +45,12 @@ struct exynos_rng {
 
 static u32 exynos_rng_readl(struct exynos_rng *rng, u32 offset)
 {
-	return	__raw_readl(rng->mem + offset);
+	return	readl_relaxed(rng->mem + offset);
 }
 
 static void exynos_rng_writel(struct exynos_rng *rng, u32 val, u32 offset)
 {
-	__raw_writel(val, rng->mem + offset);
+	writel_relaxed(val, rng->mem + offset);
 }
 
 static int exynos_rng_configure(struct exynos_rng *exynos_rng)
-- 
2.8.1
