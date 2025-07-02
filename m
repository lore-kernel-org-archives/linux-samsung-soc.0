Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0458315A858
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 01:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420019; cv=none; b=SG7BYZjvi5EJawxuDLNRbvjsB0O7WH+aEGRy0zyLkJuDN6LI7d4ei2JTY0E938dcsYF5wRylujouBxSC+OaKG6NqUNUdiPvIm40f0NfeN30cuKiBA36byLWuSuty7RuziCCFsG2SUIaPrJqk31jj+CkXJYgTXKhOz0T3ELizAIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420019; c=relaxed/simple;
	bh=FOQoi89NUv54CfgsP9AV7d7jkdFwueCr9s+C4BSQtMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=MnoAYDhQfOlbfq50BhywEKMq4nCVsPLEr/i8qscoolHtd+WjYFb+Vc2hL/9LRfwm0YLoqzb0kVZtsKVoU50swF3emak6/4SkTFnnI/3YB/boclCMPi53ax30mPn/r3YrU0h5uwKoO6Ej5fBYQ6xwQC2vU4DeCzPTjyEk2d2F85w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=E3A6/9j9; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="E3A6/9j9"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250702013334epoutp017a86ab3a4b40936391cd62944debaba5~OSzksWeUA1659816598epoutp01R
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 01:33:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250702013334epoutp017a86ab3a4b40936391cd62944debaba5~OSzksWeUA1659816598epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751420014;
	bh=e8uOO/gv79Kb1+qWVAngQIMnnEJqThV7WDw1WnemYmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E3A6/9j9EFYSrOwl2OEHkn59Ghts1Mifwm/H2Xl9lEU+ptdoN3dv1oeZ93bcVv2P0
	 lOU9fe1wpGL3nhGfDUS0cg+oBm6Z8TU0VhPQl/hdIz/22IJU7bGA1SWScJQAKGsd+2
	 tgoITgCQ3ZjU+Kgq9QhBVWU0YafeZpx7yxqWCI48=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250702013333epcas2p34183624e903d9a57745a17e5e1975fe7~OSzkTl1pV1430414304epcas2p3t;
	Wed,  2 Jul 2025 01:33:33 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.101]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bX2V461pkz2SSKj; Wed,  2 Jul
	2025 01:33:32 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epcas2p159e663ba3bde9f5bf28ccd743c211fd8~OSzjAH4wL0297502975epcas2p1f;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epsmtip2a6a84522c61cf883db518b17369feb0a~OSzi8lg5Z2705927059epsmtip2Q;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH 1/5] phy: samsung-ufs: update calibration settings for EVT2
Date: Wed,  2 Jul 2025 10:33:07 +0900
Message-ID: <20250702013316.2837427-2-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702013316.2837427-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250702013332epcas2p159e663ba3bde9f5bf28ccd743c211fd8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702013332epcas2p159e663ba3bde9f5bf28ccd743c211fd8
References: <20250702013316.2837427-1-sowon.na@samsung.com>
	<CGME20250702013332epcas2p159e663ba3bde9f5bf28ccd743c211fd8@epcas2p1.samsung.com>

The hardware EVT version for exynosautov920 has been updated, with EVT2
confirmed as the final production version. Accordingly, this patch updates
the UFS PHY calibration settings to match EVT2 hardware characteristics.

This ensures stable operation and optimal performance on the finalized EVT2
hardware revision.

Tested on exynosautov920 EVT2.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
---
 drivers/phy/samsung/phy-exynosautov920-ufs.c | 39 +++++++-------------
 drivers/phy/samsung/phy-samsung-ufs.h        |  1 -
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynosautov920-ufs.c b/drivers/phy/samsung/phy-exynosautov920-ufs.c
index 21ef79c42f95..5ff9fc3a0615 100644
--- a/drivers/phy/samsung/phy-exynosautov920-ufs.c
+++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
@@ -12,8 +12,7 @@
 #define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_EN		BIT(0)
 #define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS	0x5e
 
-#define EXYNOSAUTOV920_CDR_LOCK_OFFSET				0xce4
-
+#define EXYNOSAUTOV920_CAL_DONE_OFFSET				0xce0
 #define PHY_EXYNOSAUTOV920_LANE_OFFSET				0x200
 #define PHY_TRSV_REG_CFG_AUTOV920(o, v, d) \
 	PHY_TRSV_REG_CFG_OFFSET(o, v, d, PHY_EXYNOSAUTOV920_LANE_OFFSET)
@@ -32,7 +31,7 @@ static const struct samsung_ufs_phy_cfg exynosautov920_pre_init_cfg[] = {
 	PHY_TRSV_REG_CFG_AUTOV920(0x202, 0x06, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x203, 0x0a, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x204, 0x00, PWR_MODE_ANY),
-	PHY_TRSV_REG_CFG_AUTOV920(0x205, 0x10, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x205, 0x11, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x207, 0x0c, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x2e1, 0xc0, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x22d, 0xf8, PWR_MODE_ANY),
@@ -46,6 +45,7 @@ static const struct samsung_ufs_phy_cfg exynosautov920_pre_init_cfg[] = {
 	PHY_TRSV_REG_CFG_AUTOV920(0x23e, 0x14, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x23f, 0x13, PWR_MODE_ANY),
 
+	PHY_TRSV_REG_CFG_AUTOV920(0x36e, 0x05, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x240, 0x4a, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x243, 0x40, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x244, 0x02, PWR_MODE_ANY),
@@ -76,6 +76,10 @@ static const struct samsung_ufs_phy_cfg exynosautov920_pre_init_cfg[] = {
 	PHY_TRSV_REG_CFG_AUTOV920(0x2bc, 0x06, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x2bd, 0x06, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x2be, 0x06, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2e4, 0x1a, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2ed, 0x25, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x269, 0x1a, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_AUTOV920(0x2f4, 0x2f, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x34b, 0x01, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x34c, 0x24, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x34d, 0x23, PWR_MODE_ANY),
@@ -107,40 +111,25 @@ static const struct samsung_ufs_phy_cfg exynosautov920_post_pwr_hs_cfg[] = {
 
 #define DELAY_IN_US	40
 #define RETRY_CNT	100
-#define EXYNOSAUTOV920_CDR_LOCK_MASK	0x8
+#define EXYNOSAUTOV920_CAL_DONE_MASK	0x8
 
-int exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane)
+static int exynosautov920_ufs_phy_wait_for_cal(struct phy *phy, u8 lane)
 {
 	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
 	u32 reg, i;
 
-	struct samsung_ufs_phy_cfg cfg[4] = {
-		PHY_TRSV_REG_CFG_AUTOV920(0x222, 0x10, PWR_MODE_ANY),
-		PHY_TRSV_REG_CFG_AUTOV920(0x222, 0x18, PWR_MODE_ANY),
-		PHY_TRSV_REG_CFG_AUTOV920(0x246, 0x01, PWR_MODE_ANY),
-		END_UFS_PHY_CFG,
-	};
-
 	for (i = 0; i < RETRY_CNT; i++) {
 		udelay(DELAY_IN_US);
 
-		reg = readl(ufs_phy->reg_pma + EXYNOSAUTOV920_CDR_LOCK_OFFSET +
+		reg = readl(ufs_phy->reg_pma + EXYNOSAUTOV920_CAL_DONE_OFFSET +
 			(PHY_APB_ADDR(PHY_EXYNOSAUTOV920_LANE_OFFSET) * lane));
 
-		if ((reg & EXYNOSAUTOV920_CDR_LOCK_MASK)
-					== EXYNOSAUTOV920_CDR_LOCK_MASK) {
-			samsung_ufs_phy_config(ufs_phy, &cfg[2], lane);
+		if ((reg & EXYNOSAUTOV920_CAL_DONE_MASK)
+					== EXYNOSAUTOV920_CAL_DONE_MASK)
 			return 0;
-		}
-
-		udelay(DELAY_IN_US);
-
-		/* Disable and enable CDR */
-		samsung_ufs_phy_config(ufs_phy, &cfg[0], lane);
-		samsung_ufs_phy_config(ufs_phy, &cfg[1], lane);
 	}
 
-	dev_err(ufs_phy->dev, "failed to get phy cdr lock\n");
+	dev_err(ufs_phy->dev, "failed to wait for cal done\n");
 	return -ETIMEDOUT;
 }
 
@@ -164,5 +153,5 @@ const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy = {
 	.clk_list = exynosautov920_ufs_phy_clks,
 	.num_clks = ARRAY_SIZE(exynosautov920_ufs_phy_clks),
 	.cdr_lock_status_offset = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS,
-	.wait_for_cdr = exynosautov920_ufs_phy_wait_cdr_lock,
+	.wait_for_cal = exynosautov920_ufs_phy_wait_for_cal,
 };
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index a28f148081d1..895741e800da 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -143,7 +143,6 @@ static inline void samsung_ufs_phy_ctrl_isol(
 }
 
 int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane);
-int exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane);
 void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
 			    const struct samsung_ufs_phy_cfg *cfg, u8 lane);
 
-- 
2.45.2

