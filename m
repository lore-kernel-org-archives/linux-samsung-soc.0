From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH] hwrng: exynos - Fix unbalanced PM runtime get/puts
Date: Fri, 16 Oct 2015 17:01:51 +0100
Message-ID: <1445011311-32142-1-git-send-email-daniel.thompson@linaro.org>
Return-path: <linux-crypto-owner@vger.kernel.org>
Sender: linux-crypto-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Currently this driver calls pm_runtime_get_sync() rampantly
but never puts anything back. This makes it impossible for the
device to autosuspend properly; it will remain fully active
after the first use.

Fix in the obvious way.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---

Notes:
    Compile tested only (CONFIG_PM=y, CONFIG_HW_RANDOM_EXYNOS=m); I spotted
    this whilst reviewing the code and don't have an exynos platform to
    test on.

 drivers/char/hw_random/exynos-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/exynos-rng.c b/drivers/char/hw_random/exynos-rng.c
index dc4701fd814f..73318e2a34dd 100644
--- a/drivers/char/hw_random/exynos-rng.c
+++ b/drivers/char/hw_random/exynos-rng.c
@@ -95,7 +95,7 @@ static int exynos_read(struct hwrng *rng, void *buf,
 	*data = exynos_rng_readl(exynos_rng, EXYNOS_PRNG_OUT1_OFFSET);

 	pm_runtime_mark_last_busy(exynos_rng->dev);
-	pm_runtime_autosuspend(exynos_rng->dev);
+	pm_runtime_put_sync_autosuspend(exynos_rng->dev);

 	return 4;
 }
--
2.4.3
