From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
Subject: [RFC PATCH v2 02/11] devfreq: exynos-bus: Extract
 exynos_bus_profile_init_passive()
Date: Thu, 19 Sep 2019 16:22:27 +0200
Message-ID: <20190919142236.4071-3-a.swigon@samsung.com>
References: <20190919142236.4071-1-a.swigon@samsung.com>
        <CGME20190919142322eucas1p1949ad95468af26698c4c5addc060ce00@eucas1p1.samsung.com>
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

This patch adds a new static function, exynos_bus_profile_init_passive(),
extracted from exynos_bus_probe().

Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
---
 drivers/devfreq/exynos-bus.c | 70 +++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index 78f38b7fb596..f85bed241631 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -338,13 +338,51 @@ static int exynos_bus_profile_init(struct exynos_bus *bus,
 	return ret;
 }
 
+static int exynos_bus_profile_init_passive(struct exynos_bus *bus,
+					   struct devfreq_dev_profile *profile)
+{
+	struct device *dev = bus->dev;
+	struct devfreq_passive_data *passive_data;
+	struct devfreq *parent_devfreq;
+	int ret = 0;
+
+	/* Initialize the struct profile and governor data for passive device */
+	profile->target = exynos_bus_target;
+	profile->exit = exynos_bus_passive_exit;
+
+	/* Get the instance of parent devfreq device */
+	parent_devfreq = devfreq_get_devfreq_by_phandle(dev, 0);
+	if (IS_ERR(parent_devfreq)) {
+		ret = -EPROBE_DEFER;
+		goto err;
+	}
+
+	passive_data = devm_kzalloc(dev, sizeof(*passive_data), GFP_KERNEL);
+	if (!passive_data) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	passive_data->parent = parent_devfreq;
+
+	/* Add devfreq device for exynos bus with passive governor */
+	bus->devfreq = devm_devfreq_add_device(dev, profile, DEVFREQ_GOV_PASSIVE,
+						passive_data);
+	if (IS_ERR(bus->devfreq)) {
+		dev_err(dev,
+			"failed to add devfreq dev with passive governor\n");
+		ret = PTR_ERR(bus->devfreq);
+		goto err;
+	}
+
+err:
+	return ret;
+}
+
 static int exynos_bus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *node;
 	struct devfreq_dev_profile *profile;
-	struct devfreq_passive_data *passive_data;
-	struct devfreq *parent_devfreq;
 	struct exynos_bus *bus;
 	int ret, max_state;
 	unsigned long min_freq, max_freq;
@@ -390,33 +428,9 @@ static int exynos_bus_probe(struct platform_device *pdev)
 
 	goto out;
 passive:
-	/* Initialize the struct profile and governor data for passive device */
-	profile->target = exynos_bus_target;
-	profile->exit = exynos_bus_passive_exit;
-
-	/* Get the instance of parent devfreq device */
-	parent_devfreq = devfreq_get_devfreq_by_phandle(dev, 0);
-	if (IS_ERR(parent_devfreq)) {
-		ret = -EPROBE_DEFER;
+	ret = exynos_bus_profile_init_passive(bus, profile);
+	if (ret < 0)
 		goto err;
-	}
-
-	passive_data = devm_kzalloc(dev, sizeof(*passive_data), GFP_KERNEL);
-	if (!passive_data) {
-		ret = -ENOMEM;
-		goto err;
-	}
-	passive_data->parent = parent_devfreq;
-
-	/* Add devfreq device for exynos bus with passive governor */
-	bus->devfreq = devm_devfreq_add_device(dev, profile, DEVFREQ_GOV_PASSIVE,
-						passive_data);
-	if (IS_ERR(bus->devfreq)) {
-		dev_err(dev,
-			"failed to add devfreq dev with passive governor\n");
-		ret = PTR_ERR(bus->devfreq);
-		goto err;
-	}
 
 out:
 	max_state = bus->devfreq->profile->max_state;
-- 
2.17.1
