From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
Subject: [RFC PATCH v2 06/11] interconnect: Relax requirement in
 of_icc_get_from_provider()
Date: Thu, 19 Sep 2019 16:22:31 +0200
Message-ID: <20190919142236.4071-7-a.swigon@samsung.com>
References: <20190919142236.4071-1-a.swigon@samsung.com>
        <CGME20190919142326eucas1p204819014fe85716b47e2de4af9102cd5@eucas1p2.samsung.com>
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

This patch relaxes the condition in of_icc_get_from_provider() so that it
is no longer required to set #interconnect-cells = <1> in the DT. In case
of the devfreq driver for exynos-bus, #interconnect-cells is always zero.

Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/interconnect/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 95850700e367..f357c3a78858 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -284,7 +284,7 @@ struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec)
 	struct icc_node *node = ERR_PTR(-EPROBE_DEFER);
 	struct icc_provider *provider;
 
-	if (!spec || spec->args_count != 1)
+	if (!spec)
 		return ERR_PTR(-EINVAL);
 
 	mutex_lock(&icc_lock);
-- 
2.17.1
