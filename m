Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84FB4E3EEE
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546246; cv=none; b=oL4iASs77/TKX4iW+NzaBqZhkgmn6v/ole/qhQ5i0qNASm7Uti/Yb0mHbPvyDktT6L2lrHqdAyQ1A3bL34ab8DmbKLQ/9skeepFksY0QX6W1LsWQ9EvUDmH2tJYa4MwS3JQY3hkiOYpNb/AHzjOWefCbeOaYNFeExLYs3NFsZVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546246; c=relaxed/simple;
	bh=wdIXtXoAkI2cpFmj93ahPbA+I4xQp5fyvKieeCH/MTE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Ri+qRrrkyWh/LVm+v250QkwjHHcG9ZJT3ikR0eQNxUx+BEUHMpy9aJoW7WJxMjVnxVShoANEhgnk/8LqjEl5QIrxKLH+P407ImF3UcJwiZ8ce5VyZny37b0EYf111YbyiXtYrXa1d+pq3D9EQwQ91lcov3MI/U1wVOZWUeLlrrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Yij9UykD; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Yij9UykD"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261009114350epoutp013e8cc367078ce3c3af43432613bc8b90~c2c3zSyla1386613866epoutp01V
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:43:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261009114350epoutp013e8cc367078ce3c3af43432613bc8b90~c2c3zSyla1386613866epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546230;
	bh=+NP2Sc9QfAH27QKUaoXkjp0qHnyNnKKBhYsb0OsmWbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yij9UykDRIcPHYTJCrnldU7fGXh0mwu9A6/D/SCvWjDiR3FIZ39S9gpY80cUoUMEf
	 2fIiTnoRcRL9iB+/0mQ6/GUmXfJCy7a6oO+ZISuBtmayE0Vgo1iM16dunElOT2aD+G
	 atyzT7qLbZxqpxhn7BQU0Fr9EUVgx2h4wHTCA034=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261009114349epcas5p23a674e72edae1e2d4b9fddf0c5b1d97c~c2c3UlB5l2795927959epcas5p2_;
	Fri,  9 Oct 2026 11:43:49 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4j1Q444jV0z6B9m7; Fri,  9 Oct
	2026 11:43:48 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114348epcas5p209346244d44e4578aa27c061b5fdebd7~c2c1zCo3C3018230182epcas5p2n;
	Fri,  9 Oct 2026 11:43:48 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114345epsmtip22cfc3abc8c2326817ee7f09b183dc469~c2czbzTT60638806388epsmtip2T;
	Fri,  9 Oct 2026 11:43:45 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 06/14] clk: samsung: clk-pll: Add support for pll_4313
Date: Fri,  9 Oct 2026 17:31:29 +0530
Message-Id: <20261009120137.2801911-7-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114348epcas5p209346244d44e4578aa27c061b5fdebd7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114348epcas5p209346244d44e4578aa27c061b5fdebd7
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114348epcas5p209346244d44e4578aa27c061b5fdebd7@epcas5p2.samsung.com>

From: Alim Akhtar <alim.akhtar@samsung.com>

PLLs 4313 are found in the Exynos8855 SoC and it is similar
to pll_531x except for CON8 offset, so re-using code for
pll_4313

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 3d837bd74355..7b0756127306 100644
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
@@ -1729,6 +1737,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_309:
 	case pll_531x:
 	case pll_4311:
+	case pll_4313:
 		init.ops = &samsung_pll531x_clk_ops;
 		break;
 	case pll_1031x:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 2457cf47c109..4825e1f5b9db 100644
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

