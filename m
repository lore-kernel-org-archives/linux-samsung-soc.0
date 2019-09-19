From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v3 1/2] memory: samsung: exynos5422-dmc: Fix kfree() of
 devm-allocated memory and missing static
Date: Thu, 19 Sep 2019 11:26:40 +0200
Message-ID: <20190919092641.4407-2-l.luba@partner.samsung.com>
References: <20190919092641.4407-1-l.luba@partner.samsung.com>
        <CGME20190919092652eucas1p12dbf9ba9d60a0c89cb7de05ab61893be@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919092641.4407-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com, dan.carpenter@oracle.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Fix issues captured by static checkers: used kfree() and missing 'static'
in the private function.

Fixes Smatch warning:
    drivers/memory/samsung/exynos5422-dmc.c:272
        exynos5_init_freq_table() warn: passing devm_ allocated variable to kfree. 'dmc->opp'

Fixes Sparse warning:
    drivers/memory/samsung/exynos5422-dmc.c:736:1:
        warning: symbol 'exynos5_dmc_align_init_freq' was not declared.

Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 drivers/memory/samsung/exynos5422-dmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 8c2ec29a7d57..1b54fc8c912e 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -258,7 +258,7 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 
 		opp = dev_pm_opp_find_freq_floor(dmc->dev, &freq);
 		if (IS_ERR(opp))
-			goto err_free_tables;
+			goto err_opp;
 
 		dmc->opp[idx - i].freq_hz = freq;
 		dmc->opp[idx - i].volt_uv = dev_pm_opp_get_voltage(opp);
@@ -268,8 +268,6 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 
 	return 0;
 
-err_free_tables:
-	kfree(dmc->opp);
 err_opp:
 	dev_pm_opp_of_remove_table(dmc->dev);
 
@@ -732,7 +730,7 @@ static struct devfreq_dev_profile exynos5_dmc_df_profile = {
  * statistics engine which supports only registered values. Thus, some alignment
  * must be made.
  */
-unsigned long
+static unsigned long
 exynos5_dmc_align_init_freq(struct exynos5_dmc *dmc,
 			    unsigned long bootloader_init_freq)
 {
-- 
2.17.1
