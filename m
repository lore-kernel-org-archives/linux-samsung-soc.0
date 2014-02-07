From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 4/9 v6] crypto:s5p-sss: Kconfig: Let Exynos SoCs select SSS
 driver
Date: Fri, 07 Feb 2014 10:53:23 +0530
Message-ID: <1391750603-27370-1-git-send-email-ch.naveen@samsung.com>
References: <1389095509-14357-5-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-crypto-owner@vger.kernel.org>
In-reply-to: <1389095509-14357-5-git-send-email-ch.naveen@samsung.com>
Sender: linux-crypto-owner@vger.kernel.org
To: linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vzapolskiy@gmail.com, herbert@gondor.apana.org.au, naveenkrishna.ch@gmail.com, cpgs@samsung.com, Naveen Krishna Ch <ch.naveen@samsung.com>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-samsung-soc@vger.kernel.org

From: Naveen Krishna Ch <ch.naveen@samsung.com>

This patch modifies Kconfig such that ARCH_EXYNOS SoCs
which includes (Exynos4210, Exynos5250 and Exynos5420)
can also select Samsung SSS(Security SubSystem) driver.

Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: David S. Miller <davem@davemloft.net>
CC: Vladimir Zapolskiy <vzapolskiy@gmail.com>
TO: <linux-crypto@vger.kernel.org>
CC: <linux-samsung-soc@vger.kernel.org>
---
Change since v5:
None

 drivers/crypto/Kconfig |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 13857f5..e866489 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -290,14 +290,14 @@ config CRYPTO_DEV_SAHARA
 	  found in some Freescale i.MX chips.
 
 config CRYPTO_DEV_S5P
-	tristate "Support for Samsung S5PV210 crypto accelerator"
-	depends on ARCH_S5PV210
+	tristate "Support for Samsung S5PV210/Exynos crypto accelerator"
+	depends on ARCH_S5PV210 || ARCH_EXYNOS
 	select CRYPTO_AES
 	select CRYPTO_ALGAPI
 	select CRYPTO_BLKCIPHER
 	help
 	  This option allows you to have support for S5P crypto acceleration.
-	  Select this to offload Samsung S5PV210 or S5PC110 from AES
+	  Select this to offload Samsung S5PV210 or S5PC110, Exynos from AES
 	  algorithms execution.
 
 config CRYPTO_DEV_TEGRA_AES
-- 
1.7.9.5
