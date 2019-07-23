From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
Subject: [RFC PATCH 01/11] devfreq: exynos-bus: Extract
 exynos_bus_profile_init()
Date: Tue, 23 Jul 2019 14:20:06 +0200
Message-ID: <20190723122016.30279-2-a.swigon@partner.samsung.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <CGME20190723122022eucas1p1266d90873d564894bd852c20140f8474@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723122016.30279-1-a.swigon@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: krzk@kernel.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds a new static function, exynos_bus_profile_init(), extracted
from exynos_bus_probe().

Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
---
 drivers/devfreq/exynos-bus.c | 106 ++++++++++++++++++++---------------
 1 file changed, 60 insertions(+), 46 deletions(-)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index d9f377912c10..d8f1efaf2d49 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -372,12 +372,69 @@ static int exynos_bus_parse_of(struct device_node *np,
 	return ret;
 }
 
+static int exynos_bus_profile_init(struct exynos_bus *bus,
+				   struct devfreq_dev_profile *profile)
+{
+	struct device *dev = bus->dev;
+	struct devfreq_simple_ondemand_data *ondemand_data;
+	int ret;
+
+	/* Initialize the struct profile and governor data for parent device */
+	profile->polling_ms = 50;
+	profile->target = exynos_bus_target;
+	profile->get_dev_status = exynos_bus_get_dev_status;
+	profile->exit = exynos_bus_exit;
+
+	ondemand_data = devm_kzalloc(dev, sizeof(*ondemand_data), GFP_KERNEL);
+	if (!ondemand_data) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	ondemand_data->upthreshold = 40;
+	ondemand_data->downdifferential = 5;
+
+	/* Add devfreq device to monitor and handle the exynos bus */
+	bus->devfreq = devm_devfreq_add_device(dev, profile,
+						DEVFREQ_GOV_SIMPLE_ONDEMAND,
+						ondemand_data);
+	if (IS_ERR(bus->devfreq)) {
+		dev_err(dev, "failed to add devfreq device\n");
+		ret = PTR_ERR(bus->devfreq);
+		goto err;
+	}
+
+	/* Register opp_notifier to catch the change of OPP  */
+	ret = devm_devfreq_register_opp_notifier(dev, bus->devfreq);
+	if (ret < 0) {
+		dev_err(dev, "failed to register opp notifier\n");
+		goto err;
+	}
+
+	/*
+	 * Enable devfreq-event to get raw data which is used to determine
+	 * current bus load.
+	 */
+	ret = exynos_bus_enable_edev(bus);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable devfreq-event devices\n");
+		goto err;
+	}
+
+	ret = exynos_bus_set_event(bus);
+	if (ret < 0) {
+		dev_err(dev, "failed to set event to devfreq-event devices\n");
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
-	struct devfreq_simple_ondemand_data *ondemand_data;
 	struct devfreq_passive_data *passive_data;
 	struct devfreq *parent_devfreq;
 	struct exynos_bus *bus;
@@ -418,52 +475,9 @@ static int exynos_bus_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err;
 
-	/* Initialize the struct profile and governor data for parent device */
-	profile->polling_ms = 50;
-	profile->target = exynos_bus_target;
-	profile->get_dev_status = exynos_bus_get_dev_status;
-	profile->exit = exynos_bus_exit;
-
-	ondemand_data = devm_kzalloc(dev, sizeof(*ondemand_data), GFP_KERNEL);
-	if (!ondemand_data) {
-		ret = -ENOMEM;
+	ret = exynos_bus_profile_init(bus, profile);
+	if (ret < 0)
 		goto err;
-	}
-	ondemand_data->upthreshold = 40;
-	ondemand_data->downdifferential = 5;
-
-	/* Add devfreq device to monitor and handle the exynos bus */
-	bus->devfreq = devm_devfreq_add_device(dev, profile,
-						DEVFREQ_GOV_SIMPLE_ONDEMAND,
-						ondemand_data);
-	if (IS_ERR(bus->devfreq)) {
-		dev_err(dev, "failed to add devfreq device\n");
-		ret = PTR_ERR(bus->devfreq);
-		goto err;
-	}
-
-	/* Register opp_notifier to catch the change of OPP  */
-	ret = devm_devfreq_register_opp_notifier(dev, bus->devfreq);
-	if (ret < 0) {
-		dev_err(dev, "failed to register opp notifier\n");
-		goto err;
-	}
-
-	/*
-	 * Enable devfreq-event to get raw data which is used to determine
-	 * current bus load.
-	 */
-	ret = exynos_bus_enable_edev(bus);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable devfreq-event devices\n");
-		goto err;
-	}
-
-	ret = exynos_bus_set_event(bus);
-	if (ret < 0) {
-		dev_err(dev, "failed to set event to devfreq-event devices\n");
-		goto err;
-	}
 
 	goto out;
 passive:
-- 
2.17.1
