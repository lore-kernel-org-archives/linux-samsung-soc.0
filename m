From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
Subject: [RFC PATCH 04/11] devfreq: exynos-bus: Clean up code
Date: Tue, 23 Jul 2019 14:20:09 +0200
Message-ID: <20190723122016.30279-5-a.swigon@partner.samsung.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <CGME20190723122024eucas1p25a480ccddaa69ee1d0f1a07960ca3f22@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723122016.30279-1-a.swigon@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: krzk@kernel.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds minor improvements to the exynos-bus driver.

Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
---
 drivers/devfreq/exynos-bus.c | 49 ++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index 4bb83b945bf7..412511ca7703 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -15,11 +15,10 @@
 #include <linux/device.h>
 #include <linux/export.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_opp.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
-#include <linux/slab.h>
 
 #define DEFAULT_SATURATION_RATIO	40
 #define DEFAULT_VOLTAGE_TOLERANCE	2
@@ -256,7 +255,7 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
 					struct exynos_bus *bus)
 {
 	struct device *dev = bus->dev;
-	int i, ret, count, size;
+	int i, ret, count;
 
 	/* Get the regulator to provide each bus with the power */
 	bus->regulator = devm_regulator_get(dev, "vdd");
@@ -283,8 +282,7 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
 	}
 	bus->edev_count = count;
 
-	size = sizeof(*bus->edev) * count;
-	bus->edev = devm_kzalloc(dev, size, GFP_KERNEL);
+	bus->edev = devm_kcalloc(dev, count, sizeof(*bus->edev), GFP_KERNEL);
 	if (!bus->edev) {
 		ret = -ENOMEM;
 		goto err_regulator;
@@ -388,7 +386,7 @@ static int exynos_bus_profile_init(struct exynos_bus *bus,
 	ondemand_data = devm_kzalloc(dev, sizeof(*ondemand_data), GFP_KERNEL);
 	if (!ondemand_data) {
 		ret = -ENOMEM;
-		goto err;
+		goto out;
 	}
 	ondemand_data->upthreshold = 40;
 	ondemand_data->downdifferential = 5;
@@ -400,14 +398,14 @@ static int exynos_bus_profile_init(struct exynos_bus *bus,
 	if (IS_ERR(bus->devfreq)) {
 		dev_err(dev, "failed to add devfreq device\n");
 		ret = PTR_ERR(bus->devfreq);
-		goto err;
+		goto out;
 	}
 
 	/* Register opp_notifier to catch the change of OPP  */
 	ret = devm_devfreq_register_opp_notifier(dev, bus->devfreq);
 	if (ret < 0) {
 		dev_err(dev, "failed to register opp notifier\n");
-		goto err;
+		goto out;
 	}
 
 	/*
@@ -417,16 +415,16 @@ static int exynos_bus_profile_init(struct exynos_bus *bus,
 	ret = exynos_bus_enable_edev(bus);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable devfreq-event devices\n");
-		goto err;
+		goto out;
 	}
 
 	ret = exynos_bus_set_event(bus);
 	if (ret < 0) {
 		dev_err(dev, "failed to set event to devfreq-event devices\n");
-		goto err;
+		goto out;
 	}
 
-err:
+out:
 	return ret;
 }
 
@@ -446,27 +444,28 @@ static int exynos_bus_profile_init_passive(struct exynos_bus *bus,
 	parent_devfreq = devfreq_get_devfreq_by_phandle(dev, 0);
 	if (IS_ERR(parent_devfreq)) {
 		ret = -EPROBE_DEFER;
-		goto err;
+		goto out;
 	}
 
 	passive_data = devm_kzalloc(dev, sizeof(*passive_data), GFP_KERNEL);
 	if (!passive_data) {
 		ret = -ENOMEM;
-		goto err;
+		goto out;
 	}
 	passive_data->parent = parent_devfreq;
 
 	/* Add devfreq device for exynos bus with passive governor */
-	bus->devfreq = devm_devfreq_add_device(dev, profile, DEVFREQ_GOV_PASSIVE,
+	bus->devfreq = devm_devfreq_add_device(dev, profile,
+						DEVFREQ_GOV_PASSIVE,
 						passive_data);
 	if (IS_ERR(bus->devfreq)) {
 		dev_err(dev,
 			"failed to add devfreq dev with passive governor\n");
 		ret = PTR_ERR(bus->devfreq);
-		goto err;
+		goto out;
 	}
 
-err:
+out:
 	return ret;
 }
 
@@ -484,11 +483,11 @@ static int exynos_bus_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
+	bus = devm_kzalloc(dev, sizeof(*bus), GFP_KERNEL);
 	if (!bus)
 		return -ENOMEM;
 	mutex_init(&bus->lock);
-	bus->dev = &pdev->dev;
+	bus->dev = dev;
 	platform_set_drvdata(pdev, bus);
 
 	/* Parse the device-tree to get the resource information */
@@ -502,7 +501,7 @@ static int exynos_bus_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	node = of_parse_phandle(dev->of_node, "devfreq", 0);
+	node = of_parse_phandle(np, "devfreq", 0);
 	if (node) {
 		of_node_put(node);
 		ret = exynos_bus_profile_init_passive(bus, profile);
@@ -547,12 +546,10 @@ static int exynos_bus_resume(struct device *dev)
 	int ret;
 
 	ret = exynos_bus_enable_edev(bus);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(dev, "failed to enable the devfreq-event devices\n");
-		return ret;
-	}
 
-	return 0;
+	return ret;
 }
 
 static int exynos_bus_suspend(struct device *dev)
@@ -561,12 +558,10 @@ static int exynos_bus_suspend(struct device *dev)
 	int ret;
 
 	ret = exynos_bus_disable_edev(bus);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(dev, "failed to disable the devfreq-event devices\n");
-		return ret;
-	}
 
-	return 0;
+	return ret;
 }
 #endif
 
-- 
2.17.1
