From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 3/3] crypto: s5p-sss - Sort the headers to improve
 readability
Date: Thu, 10 Mar 2016 10:31:47 +0900
Message-ID: <1457573507-1687-3-git-send-email-k.kozlowski@samsung.com>
References: <1457573507-1687-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-crypto-owner@vger.kernel.org>
In-reply-to: <1457573507-1687-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Vladimir Zapolskiy <vz@mleia.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Sort the headers alphabetically to improve readability and to spot
duplications easier.

Suggested-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Changes since v1:
1. New patch.

My email differs from one used in previous patches because this time I
am sending this from work.
---
 drivers/crypto/s5p-sss.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index bac1f4593f98..46fbeb933939 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -11,23 +11,23 @@
  *
  */
 
+#include <linux/clk.h>
+#include <linux/crypto.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
-#include <linux/module.h>
-#include <linux/init.h>
 #include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/scatterlist.h>
-#include <linux/dma-mapping.h>
-#include <linux/io.h>
-#include <linux/of.h>
-#include <linux/crypto.h>
-#include <linux/interrupt.h>
 
-#include <crypto/algapi.h>
-#include <crypto/aes.h>
 #include <crypto/ctr.h>
+#include <crypto/aes.h>
+#include <crypto/algapi.h>
 #include <crypto/scatterwalk.h>
 
 #define _SBF(s, v)                      ((v) << (s))
-- 
2.5.0
