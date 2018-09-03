From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] regulator: Fix useless O^2 complexity in suspend/resume
Date: Mon, 03 Sep 2018 16:49:36 +0200
Message-ID: <20180903144937.16507-2-m.szyprowski@samsung.com>
References: <20180903144937.16507-1-m.szyprowski@samsung.com>
        <CGME20180903144947eucas1p26391f4de6bd46d18cf51f075e6f22e2a@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20180903144937.16507-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

regulator_pm_ops with regulator_suspend and regulator_resume functions are
assigned to every regulator device registered in the system, so there is no
need to iterate over all again in them. Replace class_for_each_device()
construction with direct operation on the rdev embedded in the given
regulator device. This saves a lots of useless operations in suspend and
resume paths.

Fixes: f7efad10b5c4: regulator: add PM suspend and resume hooks
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/regulator/core.c | 39 +++++++++++----------------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index bb1324f93143..71ba040c7c5b 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4455,19 +4455,6 @@ void regulator_unregister(struct regulator_dev *rdev)
 EXPORT_SYMBOL_GPL(regulator_unregister);
 
 #ifdef CONFIG_SUSPEND
-static int _regulator_suspend(struct device *dev, void *data)
-{
-	struct regulator_dev *rdev = dev_to_rdev(dev);
-	suspend_state_t *state = data;
-	int ret;
-
-	regulator_lock(rdev);
-	ret = suspend_set_state(rdev, *state);
-	regulator_unlock(rdev);
-
-	return ret;
-}
-
 /**
  * regulator_suspend - prepare regulators for system wide suspend
  * @state: system suspend state
@@ -4476,20 +4463,25 @@ static int _regulator_suspend(struct device *dev, void *data)
  */
 static int regulator_suspend(struct device *dev)
 {
+	struct regulator_dev *rdev = dev_to_rdev(dev);
 	suspend_state_t state = pm_suspend_target_state;
+	int ret;
+
+	regulator_lock(rdev);
+	ret = suspend_set_state(rdev, state);
+	regulator_unlock(rdev);
 
-	return class_for_each_device(&regulator_class, NULL, &state,
-				     _regulator_suspend);
+	return ret;
 }
 
-static int _regulator_resume(struct device *dev, void *data)
+static int regulator_resume(struct device *dev)
 {
-	int ret = 0;
+	suspend_state_t state = pm_suspend_target_state;
 	struct regulator_dev *rdev = dev_to_rdev(dev);
-	suspend_state_t *state = data;
 	struct regulator_state *rstate;
+	int ret = 0;
 
-	rstate = regulator_get_suspend_state(rdev, *state);
+	rstate = regulator_get_suspend_state(rdev, state);
 	if (rstate == NULL)
 		return 0;
 
@@ -4504,15 +4496,6 @@ static int _regulator_resume(struct device *dev, void *data)
 
 	return ret;
 }
-
-static int regulator_resume(struct device *dev)
-{
-	suspend_state_t state = pm_suspend_target_state;
-
-	return class_for_each_device(&regulator_class, NULL, &state,
-				     _regulator_resume);
-}
-
 #else /* !CONFIG_SUSPEND */
 
 #define regulator_suspend	NULL
-- 
2.17.1
