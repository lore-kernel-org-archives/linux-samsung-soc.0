From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/4] hwrng: exynos - Add timeout for waiting on init done
Date: Mon, 19 Oct 2015 13:37:40 +0900
Message-ID: <1445229462-32395-3-git-send-email-k.kozlowski@samsung.com>
References: <1445229462-32395-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38557 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752232AbbJSEiC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 00:38:02 -0400
In-reply-to: <1445229462-32395-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>

Driver may hang waiting indefinitely for PRNG to finish its
initialization stage. Instead of stalling return -ETIMEDOUT error.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/char/hw_random/exynos-rng.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/exynos-rng.c b/drivers/char/hw_random/exynos-rng.c
index dc4701fd814f..dfaaaafb8ddd 100644
--- a/drivers/char/hw_random/exynos-rng.c
+++ b/drivers/char/hw_random/exynos-rng.c
@@ -81,14 +81,17 @@ static int exynos_read(struct hwrng *rng, void *buf,
 	struct exynos_rng *exynos_rng = container_of(rng,
 						struct exynos_rng, rng);
 	u32 *data = buf;
+	int retry = 100;
 
 	pm_runtime_get_sync(exynos_rng->dev);
 
 	exynos_rng_writel(exynos_rng, PRNG_START, 0);
 
 	while (!(exynos_rng_readl(exynos_rng,
-			EXYNOS_PRNG_STATUS_OFFSET) & PRNG_DONE))
+			EXYNOS_PRNG_STATUS_OFFSET) & PRNG_DONE) && --retry)
 		cpu_relax();
+	if (!retry)
+		return -ETIMEDOUT;
 
 	exynos_rng_writel(exynos_rng, PRNG_DONE, EXYNOS_PRNG_STATUS_OFFSET);
 
-- 
1.9.1
