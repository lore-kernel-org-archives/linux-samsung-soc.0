From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
Subject: [RFC PATCH 05/11] icc: Export of_icc_get_from_provider()
Date: Tue, 23 Jul 2019 14:20:10 +0200
Message-ID: <20190723122016.30279-6-a.swigon@partner.samsung.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <CGME20190723122025eucas1p251df372451e0b27ad7f2e3c89df60b64@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723122016.30279-1-a.swigon@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: krzk@kernel.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch makes the above function public (for use in exynos-bus devfreq
driver).

Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
---
 drivers/interconnect/core.c           | 3 ++-
 include/linux/interconnect-provider.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 871eb4bc4efc..d566ae0b66c0 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -274,7 +274,7 @@ EXPORT_SYMBOL_GPL(of_icc_xlate_onecell);
  * Returns a valid pointer to struct icc_node on success or ERR_PTR()
  * on failure.
  */
-static struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec)
+struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec)
 {
 	struct icc_node *node = ERR_PTR(-EPROBE_DEFER);
 	struct icc_provider *provider;
@@ -293,6 +293,7 @@ static struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec)
 
 	return node;
 }
+EXPORT_SYMBOL_GPL(of_icc_get_from_provider);
 
 /**
  * of_icc_get() - get a path handle from a DT node based on name
diff --git a/include/linux/interconnect-provider.h b/include/linux/interconnect-provider.h
index 63caccadc2db..9ecfc518b952 100644
--- a/include/linux/interconnect-provider.h
+++ b/include/linux/interconnect-provider.h
@@ -97,6 +97,7 @@ void icc_node_add(struct icc_node *node, struct icc_provider *provider);
 void icc_node_del(struct icc_node *node);
 int icc_provider_add(struct icc_provider *provider);
 int icc_provider_del(struct icc_provider *provider);
+struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec);
 
 #else
 
@@ -137,6 +138,11 @@ static inline int icc_provider_del(struct icc_provider *provider)
 	return -ENOTSUPP;
 }
 
+struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
 #endif /* CONFIG_INTERCONNECT */
 
 #endif /* __LINUX_INTERCONNECT_PROVIDER_H */
-- 
2.17.1
