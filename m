From: Dmitry Torokhov <dtor@chromium.org>
Subject: [PATCH] [media] exynos4-is: fix error handling of
 irq_of_parse_and_map
Date: Fri, 14 Nov 2014 14:09:50 -0800
Message-ID: <20141114220950.GA34576@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Wolfram Sang <wsa@the-dreams.de>, Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Return value of irq_of_parse_and_map() is unsigned int, with 0
indicating failure, so testing for negative result never works.

Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
---

Not tested, found by casual code inspection.

 drivers/media/platform/exynos4-is/fimc-is.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index 94c6b47..0fdca86 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -814,9 +814,9 @@ static int fimc_is_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	is->irq = irq_of_parse_and_map(dev->of_node, 0);
-	if (is->irq < 0) {
+	if (!is->irq) {
 		dev_err(dev, "no irq found\n");
-		return is->irq;
+		return -EINVAL;
 	}
 
 	ret = fimc_is_get_clocks(is);
-- 
2.1.0.rc2.206.gedb03e5


-- 
Dmitry
