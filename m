Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029169;
	b=gw+2H6eGyP+XCh4HOORkjmMRnQMeq14kmdwLJdSrcfF5awQapNzPc8jzmhvRHd5/obJK
	 9P3VPNSsnCrbm+Ha25fYNg52O4Mx9/IaqREAxUko2JoNaKyHAkAtCaPT1sJ8b4dHG9WdZ
	 /RI+JX2bF6pBuH8TqRQuBUhMRNTwnLVso0HVqIznunEl8bFnGYSe3pzIKPikXE+T9lXvB
	 ir9urp8DQOCuA6Uxmwu5GevNtpTvsr/LFnusC/gu1kVsEY86ioveJp2gjV9Ud3XuYttZ1
	 GdF5Sj7FR7+D7CS/BqSUokFjd8jyaRFrR0ly1LbHwbuINrkUGrDZkvXWnpNyGHJKamw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029169;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=pQnJmWW6nPDVDbiKnkWy2swOvfjrmQ+u4ZBhr5A3f7M=;
	b=vonBFL5IVnMO0kClgnJ9Loio81ty9ytj4BvggodjKvyy/LHu/k/7lxCHW9845rBCgrVA
	 aN6J/LjQ7um8msbaZA+2iIKefXgXIVFedVFdZ/P9zMvoCaiup080bvqcEo66lj2PtEj5R
	 HDXfPX7QSSznxOAb5cDJs2r+iGskvvYDPBwJ01UojfYkjIZgbjPFe0iXjxKT8X/ZZjHLV
	 ovG/nzbv2OcnhuLJvUpV4yYzC3zOucuMN2VV+XYKbLRGK9/aYWJfAOVHGg1XiPfiGdy5W
	 jn4wpVXPgn1rCLrqyMN0x2vrub71vwQR1OcGu9nrgM6yrnOiJjX/ffSBnTUxKFGQaIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=neTfT88U;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7450606A334
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 19:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7450606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=neTfT88U
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261118191240euoutp01f000a8bb61b0f2323e612699426127f4~pOYLBoKeA1782117821euoutp01r
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 19:12:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261118191240euoutp01f000a8bb61b0f2323e612699426127f4~pOYLBoKeA1782117821euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795029160;
	bh=pQnJmWW6nPDVDbiKnkWy2swOvfjrmQ+u4ZBhr5A3f7M=;
	h=From:To:Cc:Subject:Date:References:From;
	b=neTfT88UtZtb8+MzvLHLB7HJ5OGTAmn+qJocvu/auOYis5WAlCO36FGGoLnhACRtd
	 9eCrS03nfKWw/hjY+ZGPO556QcKgRsknSNojWaY0tti8QiivCYvqdoAIm46aqse5aw
	 PEX7b2cP1tcEcGuAycAmZ+mige/oUlvTgKKNkcAA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261118191239eucas1p1054471efd4b07967555d34a2aed994c0~pOYKdupe21910519105eucas1p1J;
	Wed, 18 Nov 2026 19:12:39 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261118191239eusmtip2489642b72e5eb3c0cdd84cb7d9d30c28~pOYKCR2S62280122801eusmtip2w;
	Wed, 18 Nov 2026 19:12:39 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Vinod Koul
	<vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Manivannan
	Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Peter
	Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] phy: samsung: exynos5250-sata: fix unreliable PLL lock
 timeout
Date: Wed, 18 Nov 2026 20:12:31 +0100
Message-ID: <20261118191233.376139-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261118191239eucas1p1054471efd4b07967555d34a2aed994c0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261118191239eucas1p1054471efd4b07967555d34a2aed994c0
X-EPHeader: CA
X-CMS-RootMailID: 20261118191239eucas1p1054471efd4b07967555d34a2aed994c0
References: <CGME20261118191239eucas1p1054471efd4b07967555d34a2aed994c0@eucas1p1.samsung.com>

On Arndale boards the SATA PHY occasionally fails to initialize, which
makes the AHCI controller probe fail and the attached disk disappear:

  phy phy-12170000.sata-phy.11: PHY PLL locking failed
  phy phy-12170000.sata-phy.11: phy init failed --> -14
  ahci-dwc 122f0000.sata: probe with driver ahci-dwc failed with error -14

The PLL lock is polled by wait_for_reg_status() with a timeout of
usecs_to_jiffies(1000). On ARM with the default HZ=100 that rounds up to
a single jiffy, so the effective timeout is anything between almost zero
and 10ms, depending on where in the tick period the wait starts. The
loop also does not re-check the status after the deadline has passed,
so an interrupt or preemption during polling can turn an already locked
PLL into a reported failure. Finally, -EFAULT is a misleading error code
for a timeout.

Replace the open-coded loop with readl_poll_timeout(), which measures
time with ktime, performs a final read after the timeout, and returns
-ETIMEDOUT. Use a 10ms timeout, matching the upper bound of the
previous behaviour with HZ=100.

Fixes: bcff4cba41bc ("PHY: Exynos: Add Exynos5250 SATA PHY driver")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This patch has been developed with LLM assistance and have been tested
on the real Exynos5250-based Arndale board.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 drivers/phy/samsung/phy-exynos5250-sata.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5250-sata.c b/drivers/phy/samsung/phy-exynos5250-sata.c
index a88534eba2be..b55cbb3c47b3 100644
--- a/drivers/phy/samsung/phy-exynos5250-sata.c
+++ b/drivers/phy/samsung/phy-exynos5250-sata.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -43,7 +44,8 @@
 #define EXYNOS5_SATA_PHSATA_STATM	0xf0
 #define PHSTATM_PLL_LOCKED		BIT(0)
 
-#define PHY_PLL_TIMEOUT (usecs_to_jiffies(1000))
+#define PHY_PLL_POLL_US		10
+#define PHY_PLL_TIMEOUT_US	10000
 
 struct exynos_sata_phy {
 	struct phy *phy;
@@ -53,19 +55,6 @@ struct exynos_sata_phy {
 	struct i2c_client *client;
 };
 
-static int wait_for_reg_status(void __iomem *base, u32 reg, u32 checkbit,
-				u32 status)
-{
-	unsigned long timeout = jiffies + PHY_PLL_TIMEOUT;
-
-	while (time_before(jiffies, timeout)) {
-		if ((readl(base + reg) & checkbit) == status)
-			return 0;
-	}
-
-	return -EFAULT;
-}
-
 static int exynos_sata_phy_power_on(struct phy *phy)
 {
 	struct exynos_sata_phy *sata_phy = phy_get_drvdata(phy);
@@ -142,9 +131,9 @@ static int exynos_sata_phy_init(struct phy *phy)
 	val |= RESET_CMN_RST_N;
 	writel(val, sata_phy->regs + EXYNOS5_SATA_RESET);
 
-	ret = wait_for_reg_status(sata_phy->regs,
-				EXYNOS5_SATA_PHSATA_STATM,
-				PHSTATM_PLL_LOCKED, 1);
+	ret = readl_poll_timeout(sata_phy->regs + EXYNOS5_SATA_PHSATA_STATM,
+				 val, val & PHSTATM_PLL_LOCKED,
+				 PHY_PLL_POLL_US, PHY_PLL_TIMEOUT_US);
 	if (ret < 0)
 		dev_err(&sata_phy->phy->dev,
 			"PHY PLL locking failed\n");
-- 
2.43.0

