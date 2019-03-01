From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH] crypto: s5p-sss - fix AES support for Exynos5433
Date: Fri,  1 Mar 2019 15:02:54 +0100
Message-ID: <20190301140254.19341-1-k.konieczny@partner.samsung.com>
References: <CGME20190301140321eucas1p2bf17a6e35d29e8d5f582a2d99fbf4c83@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Commit 0918f18c7179 ("crypto: s5p - add AES support for Exynos5433")
introduced bug in dereferencing clk_names[1] on platforms different from
Exynos5433. On Exynos board XU3 call trace is:

"Unable to handle kernel paging request at virtual address 00004000"
(strcmp) from [<c0774014>] (of_property_match_string+0x58/0xd0)
...
(devm_clk_get) from [<c075c248>] (s5p_aes_probe+0xd4/0x4a0)
(s5p_aes_probe) from [<c059dbc4>] (platform_drv_probe+0x6c/0xa4)

Fix this by setting array clk_names size to 2.

Fixes: 0918f18c7179 ("crypto: s5p - add AES support for Exynos5433")
Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 drivers/crypto/s5p-sss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 3f45cc5cb94a..2fb4ae459c45 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -241,7 +241,7 @@
 struct samsung_aes_variant {
 	unsigned int			aes_offset;
 	unsigned int			hash_offset;
-	const char			*clk_names[];
+	const char			*clk_names[2];
 };
 
 struct s5p_aes_reqctx {
-- 
2.21.0
