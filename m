From: k.konieczny@partner.samsung.com
Subject: [PATCH v3 2/5] opp: core: add regulators enable and disable
Date: Fri, 19 Jul 2019 17:05:32 +0200
Message-ID: <20190719150535.15501-3-k.konieczny@partner.samsung.com>
References: <20190719150535.15501-1-k.konieczny@partner.samsung.com>
 <CGME20190719150554eucas1p2f4c9e4d2767ab740d419c42d4aeed6d5@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190719150535.15501-1-k.konieczny@partner.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: k.konieczny@partner.samsung.com
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add enable regulators to dev_pm_opp_set_regulators() and disable
regulators to dev_pm_opp_put_regulators(). Even if bootloader
leaves regulators enabled, they should be enabled in kernel in
order to increase the reference count.

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
Changes in v3:
- corrected error path in enable
- improved commit message
Changes in v2:
- move regulator enable and disable into loop
---
 drivers/opp/core.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 0e7703fe733f..a8a480cdabab 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1570,6 +1570,12 @@ struct opp_table *dev_pm_opp_set_regulators(struct device *dev,
 			goto free_regulators;
 		}
 
+		ret = regulator_enable(reg);
+		if (ret < 0) {
+			regulator_put(reg);
+			goto free_regulators;
+		}
+
 		opp_table->regulators[i] = reg;
 	}
 
@@ -1583,8 +1589,10 @@ struct opp_table *dev_pm_opp_set_regulators(struct device *dev,
 	return opp_table;
 
 free_regulators:
-	while (i != 0)
-		regulator_put(opp_table->regulators[--i]);
+	while (i--) {
+		regulator_disable(opp_table->regulators[i]);
+		regulator_put(opp_table->regulators[i]);
+	}
 
 	kfree(opp_table->regulators);
 	opp_table->regulators = NULL;
@@ -1610,8 +1618,10 @@ void dev_pm_opp_put_regulators(struct opp_table *opp_table)
 	/* Make sure there are no concurrent readers while updating opp_table */
 	WARN_ON(!list_empty(&opp_table->opp_list));
 
-	for (i = opp_table->regulator_count - 1; i >= 0; i--)
+	for (i = opp_table->regulator_count - 1; i >= 0; i--) {
+		regulator_disable(opp_table->regulators[i]);
 		regulator_put(opp_table->regulators[i]);
+	}
 
 	_free_set_opp_data(opp_table);
 
-- 
2.22.0
