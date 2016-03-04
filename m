From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/2] [media] exynos4-is: Put node before s5pcsis_parse_dt() return error
Date: Fri,  4 Mar 2016 17:20:12 -0300
Message-ID: <1457122813-12791-2-git-send-email-javier@osg.samsung.com>
References: <1457122813-12791-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457122813-12791-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The MIPI CSIS DT parse function return an -ENXIO errno if the port #
is outside of the supported values. But it doesn't call of_node_put()
to decrement the node's reference counter, that's incremented inside
the of_graph_get_next_endpoint() function that was called before.

Instead of just returning, go to the error path that already does it.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/media/platform/exynos4-is/mipi-csis.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
index bd5c46c3d4b7..bf954424e7be 100644
--- a/drivers/media/platform/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/exynos4-is/mipi-csis.c
@@ -757,8 +757,10 @@ static int s5pcsis_parse_dt(struct platform_device *pdev,
 		goto err;
 
 	state->index = endpoint.base.port - FIMC_INPUT_MIPI_CSI2_0;
-	if (state->index >= CSIS_MAX_ENTITIES)
-		return -ENXIO;
+	if (state->index >= CSIS_MAX_ENTITIES) {
+		ret = -ENXIO;
+		goto err;
+	}
 
 	/* Get MIPI CSI-2 bus configration from the endpoint node. */
 	of_property_read_u32(node, "samsung,csis-hs-settle",
-- 
2.5.0
