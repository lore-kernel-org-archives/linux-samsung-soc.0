From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] [media] exynos4-is: Add missing of_node_put to fix reference leaks
Date: Sun,  5 May 2019 17:11:09 +0200
Message-ID: <20190505151109.4361-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Drop the reference to "parallel-ports" and remote endpoint's parent
nodes obtained previously with of_get_child_by_name() and
of_get_parent() respectively.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/media/platform/exynos4-is/media-dev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 463f2d84553e..d1d5041cdae5 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -449,6 +449,7 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
 		pd->fimc_bus_type = FIMC_BUS_TYPE_ISP_WRITEBACK;
 	else
 		pd->fimc_bus_type = pd->sensor_bus_type;
+	of_node_put(np);
 
 	if (WARN_ON(index >= ARRAY_SIZE(fmd->sensor))) {
 		of_node_put(rem);
@@ -474,7 +475,8 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
 static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 {
 	struct device_node *parent = fmd->pdev->dev.of_node;
-	struct device_node *node, *ports;
+	struct device_node *ports = NULL;
+	struct device_node *node;
 	int index = 0;
 	int ret;
 
@@ -523,12 +525,14 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 		}
 		index++;
 	}
+	of_node_put(ports);
 
 rpm_put:
 	pm_runtime_put(fmd->pmf);
 	return 0;
 
 cleanup:
+	of_node_put(ports);
 	v4l2_async_notifier_cleanup(&fmd->subdev_notifier);
 	pm_runtime_put(fmd->pmf);
 	return ret;
-- 
2.17.1
