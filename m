Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A62274FCB
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344823; cv=none; b=aswDeJ89wbSZrXsdOqPI+nhCtnJuhubaDxWEBJ+2QwCcB/7CTxYS3g+vKKDKB/UtGaKNY4IlrdmdOCOq0tHRBCoUIoUpiv7BmZ+MVfQh+am4aB+LxEW5a/qAihG6pvI5Y5Oken8UFERzVa3rjQQLJz3OoqfHQPfikjfn0CWo8Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344823; c=relaxed/simple;
	bh=SZ0ix64LWkWmOzE/oZMmtvn15B1pYoikVjlEZIQ43Po=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Jmqhhe4yjH59CnrPx0sIFBMHLYOz7C8ngKXyM0sDlsgFzIxeNAH3IkOBP8yhHVdUsOfmNnWGEdz0CElzAkBmx8TC7rsZIiHWxdeoMeVz9lFrD4FrqvRQtnXUZgLs88hDIF/cl2PQss9GA4t3NnsBzlUuWV1NevgYQ/lMHza1ByI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IE/PiPjC; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IE/PiPjC"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250724081338epoutp039e7f92119e86a50bb1e280ebb499cd54~VIdK7D1HK0133001330epoutp03c
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250724081338epoutp039e7f92119e86a50bb1e280ebb499cd54~VIdK7D1HK0133001330epoutp03c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753344818;
	bh=QsQQNaYSRD2U8LOrlkyZxDfezSoAFEk1Vqrj9+PASX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IE/PiPjCu4yG3f3DRwt1j54cxsgRyc7ra0+WkQTkBuu+hb+T4ACthfPWLeUKgHBtB
	 Q8Rw1AEZEri4Wf+f+B5Zb3lO/c0ptVaVHmIMlDjJh0hgs5HV+6/rgrMEL7oJ2OcUl+
	 S80RyNeco0x3Z2nCxuLBEr1QSbAlRMHdQQNWLgxs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250724081338epcas2p25a24d73f6497f2b680918d4f8e2ca4df~VIdKgCcht0557505575epcas2p2B;
	Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.102]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bnkKY5n7Mz3hhTB; Thu, 24 Jul
	2025 08:13:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250724081337epcas2p430db7d7514b8cc05e41001f17b8b0d45~VIdJSia0H1004510045epcas2p4C;
	Thu, 24 Jul 2025 08:13:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250724081337epsmtip15995237414cebf3f8f4d85e133d21737~VIdJO8PAw1874118741epsmtip1K;
	Thu, 24 Jul 2025 08:13:37 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, khwan.seo@samsung.com,
	dongil01.park@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v4 4/4] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Date: Thu, 24 Jul 2025 17:08:54 +0900
Message-Id: <20250724080854.3866566-5-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250724080854.3866566-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250724081337epcas2p430db7d7514b8cc05e41001f17b8b0d45
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724081337epcas2p430db7d7514b8cc05e41001f17b8b0d45
References: <20250724080854.3866566-1-sw617.shin@samsung.com>
	<CGME20250724081337epcas2p430db7d7514b8cc05e41001f17b8b0d45@epcas2p4.samsung.com>

Enable supported features for ExynosAutov9 SoC.
- QUIRK_HAS_DBGACK_BIT
- QUIRK_HAS_32BIT_MAXCNT

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 184b1ad46ca6..16a845f41e74 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -305,7 +305,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
 	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
@@ -317,7 +318,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
 	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
-- 
2.25.1

