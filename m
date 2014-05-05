From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 09/10] thermal: exynos: remove redundant pdata checks from
 exynos_tmu_control()
Date: Mon, 05 May 2014 13:15:38 +0200
Message-ID: <1399288539-1793-10-git-send-email-b.zolnierkie@samsung.com>
References: <1399288539-1793-1-git-send-email-b.zolnierkie@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47536 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756327AbaEELUU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 07:20:20 -0400
In-reply-to: <1399288539-1793-1-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Eduardo Valentin <eduardo.valentin@ti.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com

pdata->reference_voltage and pdata->gain are always defined
to non-zero values so remove the redundant checks from
exynos_tmu_control().

There should be no functional changes caused by this patch.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index a8d9524..45d7c6f 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -215,15 +215,11 @@ static void exynos_tmu_control(struct platform_device *pdev, bool on)
 	if (pdata->test_mux)
 		con |= (pdata->test_mux << reg->test_mux_addr_shift);
 
-	if (pdata->reference_voltage) {
-		con &= ~(reg->buf_vref_sel_mask << reg->buf_vref_sel_shift);
-		con |= pdata->reference_voltage << reg->buf_vref_sel_shift;
-	}
+	con &= ~(reg->buf_vref_sel_mask << reg->buf_vref_sel_shift);
+	con |= pdata->reference_voltage << reg->buf_vref_sel_shift;
 
-	if (pdata->gain) {
-		con &= ~(reg->buf_slope_sel_mask << reg->buf_slope_sel_shift);
-		con |= (pdata->gain << reg->buf_slope_sel_shift);
-	}
+	con &= ~(reg->buf_slope_sel_mask << reg->buf_slope_sel_shift);
+	con |= (pdata->gain << reg->buf_slope_sel_shift);
 
 	if (pdata->noise_cancel_mode) {
 		con &= ~(reg->therm_trip_mode_mask <<
-- 
1.8.2.3
