From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
Subject: [RFC PATCH v2 05/11] interconnect: Export
 of_icc_get_from_provider()
Date: Thu, 19 Sep 2019 16:22:30 +0200
Message-ID: <20190919142236.4071-6-a.swigon@samsung.com>
References: <20190919142236.4071-1-a.swigon@samsung.com>
        <CGME20190919142325eucas1p28102446c22b1e1c61aae0bad46d079b0@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919142236.4071-1-a.swigon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, leonard.crestez@nxp.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, krzk@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Artur Świgoń <a.swigon@partner.samsung.com>

This patch makes the above function public (for use in exynos-bus devfreq
driver).

Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/interconnect/core.c           | 3 ++-
 include/linux/interconnect-provider.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 7b971228df38..95850700e367 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -279,7 +279,7 @@ EXPORT_SYMBOL_GPL(of_icc_xlate_onecell);
  * Returns a valid pointer to struct icc_node on success or ERR_PTR()
  * on failure.
  */
-static struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec)
+struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec)
 {
 	struct icc_node *node = ERR_PTR(-EPROBE_DEFER);
 	struct icc_provider *provider;
@@ -298,6 +298,7 @@ static struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec)
 
 	return node;
 }
+EXPORT_SYMBOL_GPL(of_icc_get_from_provider);
 
 /**
  * of_icc_get() - get a path handle from a DT node based on name
diff --git a/include/linux/interconnect-provider.h b/include/linux/interconnect-provider.h
index b16f9effa555..070e411564e1 100644
--- a/include/linux/interconnect-provider.h
+++ b/include/linux/interconnect-provider.h
@@ -100,6 +100,7 @@ void icc_node_add(struct icc_node *node, struct icc_provider *provider);
 void icc_node_del(struct icc_node *node);
 int icc_provider_add(struct icc_provider *provider);
 int icc_provider_del(struct icc_provider *provider);
+struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec);
 
 #else
 
@@ -140,6 +141,11 @@ static inline int icc_provider_del(struct icc_provider *provider)
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
