From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v4 1/6] opp: Handle target/min/max voltage in
 dev_pm_opp_adjust_voltage()
Date: Tue, 10 Sep 2019 14:36:13 +0200
Message-ID: <20190910123618.27985-2-s.nawrocki@samsung.com>
References: <20190910123618.27985-1-s.nawrocki@samsung.com>
        <CGME20190910123636eucas1p250ec04901f227b947cc38936563f63b2@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910123618.27985-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org, vireshk@kernel.org
Cc: robh+dt@kernel.org, kgene@kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

To be squashed with patch "PM / OPP: Support adjusting OPP voltages
at runtime".

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v3:
 - new patch

 drivers/opp/core.c     | 10 ++++++++--
 include/linux/pm_opp.h |  3 ++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 407a07f29b12..4ebe5a6c280b 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2057,14 +2057,18 @@ static int _opp_set_availability(struct device *dev, unsigned long freq,
  * dev_pm_opp_adjust_voltage() - helper to change the voltage of an OPP
  * @dev:		device for which we do this operation
  * @freq:		OPP frequency to adjust voltage of
- * @u_volt:		new OPP voltage
+ * @u_volt:		new OPP target voltage
+ * @u_volt_min:		new OPP min voltage
+ * @u_volt_max:		new OPP max voltage
  *
  * Return: -EINVAL for bad pointers, -ENOMEM if no memory available for the
  * copy operation, returns 0 if no modifcation was done OR modification was
  * successful.
  */
 int dev_pm_opp_adjust_voltage(struct device *dev, unsigned long freq,
-			      unsigned long u_volt)
+			      unsigned long u_volt, unsigned long u_volt_min,
+			      unsigned long u_volt_max)
+
 {
 	struct opp_table *opp_table;
 	struct dev_pm_opp *tmp_opp, *opp = ERR_PTR(-ENODEV);
@@ -2098,6 +2102,8 @@ int dev_pm_opp_adjust_voltage(struct device *dev, unsigned long freq,
 		goto adjust_unlock;

 	opp->supplies->u_volt = u_volt;
+	opp->supplies->u_volt_min = u_volt_min;
+	opp->supplies->u_volt_max = u_volt_max;

 	dev_pm_opp_get(opp);
 	mutex_unlock(&opp_table->lock);
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 86947d53e8c4..0ee1daafe6af 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -113,7 +113,8 @@ void dev_pm_opp_remove(struct device *dev, unsigned long freq);
 void dev_pm_opp_remove_all_dynamic(struct device *dev);

 int dev_pm_opp_adjust_voltage(struct device *dev, unsigned long freq,
-			      unsigned long u_volt);
+			      unsigned long u_volt, unsigned long u_volt_min,
+			      unsigned long u_volt_max);

 int dev_pm_opp_enable(struct device *dev, unsigned long freq);

--
2.17.1
