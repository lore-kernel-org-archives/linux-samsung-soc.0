From: k.konieczny@partner.samsung.com
Subject: [PATCH v4 5/5] devfreq: exynos-bus: remove
 exynos_bus_passive_target()
Date: Thu, 25 Jul 2019 16:43:00 +0200
Message-ID: <20190725144300.25014-6-k.konieczny@partner.samsung.com>
References: <20190725144300.25014-1-k.konieczny@partner.samsung.com>
        <CGME20190725144328eucas1p1e16c826c18c79af8f9c7283a896266a6@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725144300.25014-1-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Both functions exynos_bus_passive_target() and exynos_bus_target()
have the same code, so remove exynos_bus_passive_target(). In
exynos_bus_probe() replace it with exynos_bus_target.

Suggested-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
This patch is new to this series.

---
 drivers/devfreq/exynos-bus.c | 34 ++--------------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index ebb8f46312b6..2aeb6cc07960 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -91,7 +91,7 @@ static int exynos_bus_get_event(struct exynos_bus *bus,
 }
 
 /*
- * Must necessary function for devfreq simple-ondemand governor
+ * devfreq function for both simple-ondemand and passive governor
  */
 static int exynos_bus_target(struct device *dev, unsigned long *freq, u32 flags)
 {
@@ -167,36 +167,6 @@ static void exynos_bus_exit(struct device *dev)
 	}
 }
 
-/*
- * Must necessary function for devfreq passive governor
- */
-static int exynos_bus_passive_target(struct device *dev, unsigned long *freq,
-					u32 flags)
-{
-	struct exynos_bus *bus = dev_get_drvdata(dev);
-	struct dev_pm_opp *new_opp;
-	int ret;
-
-	/* Get correct frequency for bus. */
-	new_opp = devfreq_recommended_opp(dev, freq, flags);
-	if (IS_ERR(new_opp)) {
-		dev_err(dev, "failed to get recommended opp instance\n");
-		return PTR_ERR(new_opp);
-	}
-
-	dev_pm_opp_put(new_opp);
-
-	/* Change the frequency according to new OPP level */
-	mutex_lock(&bus->lock);
-	ret = dev_pm_opp_set_rate(dev, *freq);
-	if (!ret)
-		bus->curr_freq = *freq;
-
-	mutex_unlock(&bus->lock);
-
-	return ret;
-}
-
 static void exynos_bus_passive_exit(struct device *dev)
 {
 	struct exynos_bus *bus = dev_get_drvdata(dev);
@@ -417,7 +387,7 @@ static int exynos_bus_probe(struct platform_device *pdev)
 	goto out;
 passive:
 	/* Initialize the struct profile and governor data for passive device */
-	profile->target = exynos_bus_passive_target;
+	profile->target = exynos_bus_target;
 	profile->exit = exynos_bus_passive_exit;
 
 	/* Get the instance of parent devfreq device */
-- 
2.22.0
