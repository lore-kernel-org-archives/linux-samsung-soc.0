Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAFE42D777
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239576; cv=none; b=psZ9HLzpIJkVRgH/ImuGCtMiTbwTmxWw3gANMUsLe5HIT/KT6pYJv08OWc0jjj9K3UPePrA/6y9pHamH3IYqPbT6RoYmfuI+EEk9aqS/q8GFO7+VOMTIH36q+rNGShU99Qh9MoUuBvUGScokoPibpemNsa8pAYsOlvEGxCUtwVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239576; c=relaxed/simple;
	bh=gvFCD8GcQUKN/C8mHn437XP93G9UJdkIewaa0Z0yWlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=gHY/VqM9IhToquRlfapARowLsz9m0O0rzZZNbMAuNW4vVl5oLs1BPKBLZooM9ORh1Q2ZnrNkNaFNwIDbmZ9ZUEeH79ugXsjQbsdh5RttMvkWaxrpcgX9kbkuL5Rb7KyJGNYJKQmKNTkPrJoSmHhKblZRoMJHFt1t/0mLTQpacMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dAA7kMbI; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dAA7kMbI"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260728115247epoutp016a78ec93ee5b2b96c1091fc72c14c170~Gce2IaAMr1088610886epoutp01Y
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:52:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260728115247epoutp016a78ec93ee5b2b96c1091fc72c14c170~Gce2IaAMr1088610886epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239567;
	bh=hbWzvsTI30SQf61MYJkSumPCBvJo8f5hh8GqDaxsf24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dAA7kMbI4pq7a2Bo2RHDnCHLJrve1yAzmyai2VYJp9Y2RlqKgOjZCUP/8NCUdKD4i
	 fgMxNlSIrfF7q1CzbHe2kGWa/Ky9Z8BRkvfAD5+NzB0+JzbnO31pGI/6BKPDPJ5147
	 xyqaAf5Ql/o1TUMobpmqAmbhr/ZPhrpe2QhPnpIg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260728115246epcas5p4f89d78fccf3a138d0363a7cfc383216d~Gce1pLgQ42034920349epcas5p4w;
	Tue, 28 Jul 2026 11:52:46 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4h8Yk60qW5z6B9m9; Tue, 28 Jul
	2026 11:52:46 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260728115245epcas5p2ffe1f7c31c6dd85161445d61a94e82e6~Gce0kFyp-0256002560epcas5p24;
	Tue, 28 Jul 2026 11:52:45 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115240epsmtip165a648674550bc732bc8949467dc8337~GcevbktXi2401424014epsmtip1h;
	Tue, 28 Jul 2026 11:52:39 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 01/13] clk: samsung: clk-pll: Add supoprt for pll_4313
Date: Tue, 28 Jul 2026 17:40:59 +0530
Message-Id: <20260728121111.2077860-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115245epcas5p2ffe1f7c31c6dd85161445d61a94e82e6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115245epcas5p2ffe1f7c31c6dd85161445d61a94e82e6
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115245epcas5p2ffe1f7c31c6dd85161445d61a94e82e6@epcas5p2.samsung.com>

From: Alim Akhtar <alim.akhtar@samsung.com>

PLLs 4313 are found in the Exynos8855 SoC and it is similar
to pll_531x except for CON8 offset, so re-using code for
pll_4313

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index e74552846ba3..b7605aa3c647 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1306,7 +1306,15 @@ static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
 	u64 mdiv, fout = parent_rate;
 
 	pll_con0 = readl_relaxed(pll->con_reg);
-	pll_con8 = readl_relaxed(pll->con_reg + 20);
+	if (pll->type == pll_4313) {
+		/* Offset for PLL_CON8 which hold FDIV different for PLL_4313
+		 * which is PLL_LOCKTIME_OFFSET - 0x4
+		 */
+		pll_con8 = readl_relaxed(pll->lock_reg - 4);
+	} else {
+		pll_con8 = readl_relaxed(pll->con_reg + 20);
+	}
+
 	mdiv = (pll_con0 >> PLL531X_MDIV_SHIFT) & PLL531X_MDIV_MASK;
 	pdiv = (pll_con0 >> PLL531X_PDIV_SHIFT) & PLL531X_PDIV_MASK;
 	sdiv = (pll_con0 >> PLL531X_SDIV_SHIFT) & PLL531X_SDIV_MASK;
@@ -1728,6 +1736,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		break;
 	case pll_531x:
 	case pll_4311:
+	case pll_4313:
 		init.ops = &samsung_pll531x_clk_ops;
 		break;
 	case pll_1031x:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index d6eb3246611b..ad47dd7b3ed2 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -49,6 +49,7 @@ enum samsung_pll_type {
 	pll_0718x,
 	pll_0732x,
 	pll_4311,
+	pll_4313,
 	pll_1017x,
 	pll_1031x,
 	pll_a9fracm,
-- 
2.34.1

