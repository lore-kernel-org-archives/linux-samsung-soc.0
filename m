From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] soc: samsung: exynos-chipid: fix memory leak
Date: Fri, 16 Aug 2019 23:21:51 +0100
Message-ID: <20190816222151.11098-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to product_id_to_soc_id fails there
is a memory leak of soc_dev_attr->revision and soc_dev_attr
on the error return path.  Fix this by adding a common error
return path that frees there obects and use this for two
error return paths.

Addresses-Coverity: ("Resource leak")
Fixes: 3253b7b7cd44 ("soc: samsung: Add exynos chipid driver support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/samsung/exynos-chipid.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 006a95feb618..4e194a97c0fa 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -81,15 +81,15 @@ int __init exynos_chipid_early_init(void)
 	soc_dev_attr->soc_id = product_id_to_soc_id(product_id);
 	if (!soc_dev_attr->soc_id) {
 		pr_err("Unknown SoC\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err;
 	}
 
 	/* please note that the actual registration will be deferred */
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
-		kfree(soc_dev_attr->revision);
-		kfree(soc_dev_attr);
-		return PTR_ERR(soc_dev);
+		ret = PTR_ERR(soc_dev);
+		goto err;
 	}
 
 	/* it is too early to use dev_info() here (soc_dev is NULL) */
@@ -97,5 +97,11 @@ int __init exynos_chipid_early_init(void)
 		soc_dev_attr->soc_id, product_id, revision);
 
 	return 0;
+
+err:
+	kfree(soc_dev_attr->revision);
+	kfree(soc_dev_attr);
+	return ret;
 }
+
 early_initcall(exynos_chipid_early_init);
-- 
2.20.1
