From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v4 2/5] drivers: devfreq: events: change matching code
 during probe
Date: Wed,  5 Jun 2019 11:12:33 +0200
Message-ID: <20190605091236.24263-3-l.luba@partner.samsung.com>
References: <20190605091236.24263-1-l.luba@partner.samsung.com>
        <CGME20190605091302eucas1p2b2a959c0889666e95bd727381bceab24@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605091236.24263-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, kgene@kernel.org, l.luba@partner.samsung.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

The patch changes the way how the 'ops' gets populated for different
device versions. The matching function now uses 'of_device_id' in order
to identify the device type.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/devfreq/event/exynos-ppmu.c | 38 +++++++++++++++++++----------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/event/exynos-ppmu.c
index c2ea94957501..17f3c86a6f00 100644
--- a/drivers/devfreq/event/exynos-ppmu.c
+++ b/drivers/devfreq/event/exynos-ppmu.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/suspend.h>
@@ -23,6 +24,11 @@
 
 #include "exynos-ppmu.h"
 
+enum exynos_ppmu_type {
+	EXYNOS_TYPE_PPMU,
+	EXYNOS_TYPE_PPMU_V2,
+};
+
 struct exynos_ppmu_data {
 	struct clk *clk;
 };
@@ -36,6 +42,7 @@ struct exynos_ppmu {
 	struct regmap *regmap;
 
 	struct exynos_ppmu_data ppmu;
+	enum exynos_ppmu_type ppmu_type;
 };
 
 #define PPMU_EVENT(name)			\
@@ -483,31 +490,23 @@ static const struct devfreq_event_ops exynos_ppmu_v2_ops = {
 static const struct of_device_id exynos_ppmu_id_match[] = {
 	{
 		.compatible = "samsung,exynos-ppmu",
-		.data = (void *)&exynos_ppmu_ops,
+		.data = (void *)EXYNOS_TYPE_PPMU,
 	}, {
 		.compatible = "samsung,exynos-ppmu-v2",
-		.data = (void *)&exynos_ppmu_v2_ops,
+		.data = (void *)EXYNOS_TYPE_PPMU_V2,
 	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, exynos_ppmu_id_match);
 
-static struct devfreq_event_ops *exynos_bus_get_ops(struct device_node *np)
-{
-	const struct of_device_id *match;
-
-	match = of_match_node(exynos_ppmu_id_match, np);
-	return (struct devfreq_event_ops *)match->data;
-}
-
 static int of_get_devfreq_events(struct device_node *np,
 				 struct exynos_ppmu *info)
 {
 	struct devfreq_event_desc *desc;
-	struct devfreq_event_ops *event_ops;
 	struct device *dev = info->dev;
 	struct device_node *events_np, *node;
 	int i, j, count;
+	const struct of_device_id *of_id;
 
 	events_np = of_get_child_by_name(np, "events");
 	if (!events_np) {
@@ -515,7 +514,6 @@ static int of_get_devfreq_events(struct device_node *np,
 			"failed to get child node of devfreq-event devices\n");
 		return -EINVAL;
 	}
-	event_ops = exynos_bus_get_ops(np);
 
 	count = of_get_child_count(events_np);
 	desc = devm_kcalloc(dev, count, sizeof(*desc), GFP_KERNEL);
@@ -523,6 +521,12 @@ static int of_get_devfreq_events(struct device_node *np,
 		return -ENOMEM;
 	info->num_events = count;
 
+	of_id = of_match_device(exynos_ppmu_id_match, dev);
+	if (of_id)
+		info->ppmu_type = (enum exynos_ppmu_type)of_id->data;
+	else
+		return -EINVAL;
+
 	j = 0;
 	for_each_child_of_node(events_np, node) {
 		for (i = 0; i < ARRAY_SIZE(ppmu_events); i++) {
@@ -540,7 +544,15 @@ static int of_get_devfreq_events(struct device_node *np,
 			continue;
 		}
 
-		desc[j].ops = event_ops;
+		switch (info->ppmu_type) {
+		case EXYNOS_TYPE_PPMU:
+			desc[j].ops = &exynos_ppmu_ops;
+			break;
+		case EXYNOS_TYPE_PPMU_V2:
+			desc[j].ops = &exynos_ppmu_v2_ops;
+			break;
+		}
+
 		desc[j].driver_data = info;
 
 		of_property_read_string(node, "event-name", &desc[j].name);
-- 
2.17.1
