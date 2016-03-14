From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 3/4] hwrng: exynos - Disable runtime PM on probe failure
Date: Mon, 14 Mar 2016 09:07:14 +0900
Message-ID: <1457914035-26856-3-git-send-email-k.kozlowski@samsung.com>
References: <1457914035-26856-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-crypto-owner@vger.kernel.org>
In-reply-to: <1457914035-26856-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Kukjin Kim <kgene@kernel.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add proper error path (for disabling runtime PM) when registering of
hwrng fails.

Fixes: b329669ea0b5 ("hwrng: exynos - Add support for Exynos random number generator")
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Changes since v1:
1. Call also pm_runtime_dont_use_autosuspend() to revert everything set
   during probe.
---
 drivers/char/hw_random/exynos-rng.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/exynos-rng.c b/drivers/char/hw_random/exynos-rng.c
index 38b80f82ddd2..71b45b153cf2 100644
--- a/drivers/char/hw_random/exynos-rng.c
+++ b/drivers/char/hw_random/exynos-rng.c
@@ -119,6 +119,7 @@ static int exynos_rng_probe(struct platform_device *pdev)
 {
 	struct exynos_rng *exynos_rng;
 	struct resource *res;
+	int ret;
 
 	exynos_rng = devm_kzalloc(&pdev->dev, sizeof(struct exynos_rng),
 					GFP_KERNEL);
@@ -146,7 +147,13 @@ static int exynos_rng_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
-	return devm_hwrng_register(&pdev->dev, &exynos_rng->rng);
+	ret = devm_hwrng_register(&pdev->dev, &exynos_rng->rng);
+	if (ret) {
+		pm_runtime_dont_use_autosuspend(&pdev->dev);
+		pm_runtime_disable(&pdev->dev);
+	}
+
+	return ret;
 }
 
 static int __maybe_unused exynos_rng_runtime_suspend(struct device *dev)
-- 
2.5.0
