From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v2 1/3] memory: Exynos5422: minor fixes in DMC
Date: Mon, 16 Sep 2019 12:07:02 +0200
Message-ID: <20190916100704.26692-2-l.luba@partner.samsung.com>
References: <20190916100704.26692-1-l.luba@partner.samsung.com>
        <CGME20190916100717eucas1p1b8d24c74c4d0bb385aa3455cf98c76bd@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916100704.26692-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Small fixes for issues captured by static analyzes:
used kfree() insead of devm_kfree() and missing 'static' in the private
function.
Checks which show the issues:
- drivers/memory/samsung/exynos5422-dmc.c:272 exynos5_init_freq_table()
warn: passing devm_ allocated variable to kfree. 'dmc->opp'
- drivers/memory/samsung/exynos5422-dmc.c:736:1: warning: symbol
'exynos5_dmc_align_init_freq' was not declared.

Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 drivers/memory/samsung/exynos5422-dmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 8c2ec29a7d57..a809fa997c03 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -269,7 +269,7 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 	return 0;
 
 err_free_tables:
-	kfree(dmc->opp);
+	devm_kfree(dmc->dev, dmc->opp);
 err_opp:
 	dev_pm_opp_of_remove_table(dmc->dev);
 
@@ -732,7 +732,7 @@ static struct devfreq_dev_profile exynos5_dmc_df_profile = {
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
