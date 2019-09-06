From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH 1/3]  memory: Exynos5422: minor fixes in DMC
Date: Fri,  6 Sep 2019 12:13:42 +0200
Message-ID: <20190906101344.3535-2-l.luba@partner.samsung.com>
References: <20190906101344.3535-1-l.luba@partner.samsung.com>
 <CGME20190906101405eucas1p2e3da7b461810a3a520e76c636a06e486@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190906101344.3535-1-l.luba@partner.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, willy.mh.wolff.ml@gmail.com, b.zolnierkie@samsung.com, krzk@kernel.org, Lukasz Luba <l.luba@partner.samsung.com>, cw00.choi@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, kgene@kernel.org, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Small fixes captured by static analyzes.

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
