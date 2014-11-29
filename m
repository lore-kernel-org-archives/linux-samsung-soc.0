From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH v5 4/6] driver: soc: exynos-pmu: Add a new structure to allow
 u32 conf data
Date: Sat, 29 Nov 2014 19:45:06 +0530
Message-ID: <1417270508-11174-5-git-send-email-amit.daniel@samsung.com>
References: <1417270508-11174-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37727 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbaK2OVu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 29 Nov 2014 09:21:50 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFT0021418DI6A0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 29 Nov 2014 23:21:49 +0900 (KST)
In-reply-to: <1417270508-11174-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, b.zolnierkie@samsung.com, pankaj.dubey@samsung.com, Amit Daniel Kachhap <amit.daniel@samsung.com>

Commit b04fa9f "ARM: EXYNOS: use u8 for val[] in struct exynos_pmu_conf"
modifies the structure to allow only u8 type configuration data. To
support SoC's which need u32 type data a new structure is added.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/soc/samsung/exynos-pmu.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index c3307eb..e1a4884 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -26,9 +26,14 @@ struct exynos_pmu_conf {
 	u8 val[NUM_SYS_POWERDOWN];
 };
 
+struct exynos_pmu_conf_extra {
+	u32 offset;
+	u32 val[NUM_SYS_POWERDOWN];
+};
+
 struct exynos_pmu_data {
 	const struct exynos_pmu_conf *pmu_config;
-	const struct exynos_pmu_conf *pmu_config_extra;
+	const struct exynos_pmu_conf_extra *pmu_config_extra;
 
 	void (*pmu_init)(void);
 	void (*powerdown_conf)(enum sys_powerdown);
@@ -324,7 +329,7 @@ static const struct exynos_pmu_conf exynos4x12_pmu_config[] = {
 	{ PMU_TABLE_END,},
 };
 
-static const struct exynos_pmu_conf exynos4412_pmu_config[] = {
+static const struct exynos_pmu_conf_extra exynos4412_pmu_config[] = {
 	{ S5P_ARM_CORE2_LOWPWR,			{ 0x0, 0x0, 0x2 } },
 	{ S5P_DIS_IRQ_CORE2,			{ 0x0, 0x0, 0x0 } },
 	{ S5P_DIS_IRQ_CENTRAL2,			{ 0x0, 0x0, 0x0 } },
-- 
1.7.9.5
