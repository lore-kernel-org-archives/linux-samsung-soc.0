From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] regulator: Fix 'do-nothing' value for regulators
 without suspend state
Date: Mon, 03 Sep 2018 16:49:37 +0200
Message-ID: <20180903144937.16507-3-m.szyprowski@samsung.com>
References: <20180903144937.16507-1-m.szyprowski@samsung.com>
        <CGME20180903144948eucas1p2232126205868c2ccf5d40b7b0b70ff64@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20180903144937.16507-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Some regulators don't have all states defined and in such cases regulator
core should not assume anything. However in current implementation
of of_get_regulation_constraints() DO_NOTHING_IN_SUSPEND enable value was
set only for regulators which had suspend node defined, otherwise the
default 0 value was used, what means DISABLE_IN_SUSPEND. This lead to
broken system suspend/resume on boards, which had simple regulator
constraints definition (without suspend state nodes).

To avoid further mismatches between the default and uninitialized values
of the suspend enabled/disabled states, change the values of the them,
so default '0' means DO_NOTHING_IN_SUSPEND.

Fixes: 72069f9957a1: regulator: leave one item to record whether regulator is enabled
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/regulator/core.c          | 2 +-
 drivers/regulator/of_regulator.c  | 2 --
 include/linux/regulator/machine.h | 6 +++---
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 71ba040c7c5b..d1485ed98509 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3161,7 +3161,7 @@ static inline int regulator_suspend_toggle(struct regulator_dev *rdev,
 	if (!rstate->changeable)
 		return -EPERM;
 
-	rstate->enabled = en;
+	rstate->enabled = (en) ? ENABLE_IN_SUSPEND : DISABLE_IN_SUSPEND;
 
 	return 0;
 }
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 638f17d4c848..210fc20f7de7 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -213,8 +213,6 @@ static void of_get_regulation_constraints(struct device_node *np,
 		else if (of_property_read_bool(suspend_np,
 					"regulator-off-in-suspend"))
 			suspend_state->enabled = DISABLE_IN_SUSPEND;
-		else
-			suspend_state->enabled = DO_NOTHING_IN_SUSPEND;
 
 		if (!of_property_read_u32(np, "regulator-suspend-min-microvolt",
 					  &pval))
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 3468703d663a..a459a5e973a7 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -48,9 +48,9 @@ struct regulator;
  * DISABLE_IN_SUSPEND	- turn off regulator in suspend states
  * ENABLE_IN_SUSPEND	- keep regulator on in suspend states
  */
-#define DO_NOTHING_IN_SUSPEND	(-1)
-#define DISABLE_IN_SUSPEND	0
-#define ENABLE_IN_SUSPEND	1
+#define DO_NOTHING_IN_SUSPEND	0
+#define DISABLE_IN_SUSPEND	1
+#define ENABLE_IN_SUSPEND	2
 
 /* Regulator active discharge flags */
 enum regulator_active_discharge {
-- 
2.17.1
