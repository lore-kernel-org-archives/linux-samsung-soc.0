Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478768;
	b=qWctFByqzd8R6P6ilKxdxcCXuCnCx8fiXcHFvVEgr+R41+5Az/qG91Eyhnhaa58/RK18
	 mxKsajfwr4Bx/cWXQ3JomqFQpoocTKnO8OPDPSuvzFUyXI6NVAvPc0OLP7IRl5i2DN4uw
	 xWJXWsVYBRRsqcy54pcrQGlGqJV12kLo0U9rsPoX3cLB0twcSpVTj9IlzWXgshIiEuHCf
	 FZiV1r1vfoWmXBOOFTGB7dYGwacFhElB7tCyfaJqVELGCEJ6kJQVrvC9sNnCFYn5hkqBk
	 ajbVY38WKUayPtfyPFcty+YS30/BR5HmKQ4Sy5JX5bVGeTVvC0KZ65sWKfLp+LhX1TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478768;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=+NP2Sc9QfAH27QKUaoXkjp0qHnyNnKKBhYsb0OsmWbM=;
	b=TxLL4dkA68jbtBX916id2bS5wP7FOuFwM16QTJdHIWpo470l2MwTCgvlJGdufcjkqvKv
	 bUW47eH1U6B2tluNHXcSGK7MqDgTIhyclNaFLyFCIhGiECVMX675WEMltytdbazAaWK32
	 aOIDVRRxdS+BaueT7o/fKMISJWhqtaiblhsMusXCVxYyVcJJPQNyRIjuLxwFiI9J5wERD
	 tJJtc0/ExJOeH8L4G6f0P4NWY4JC574W0j3oglgOXmy+wCJEKSSM9AC21HgEiEmqfSZMG
	 Uoa41CxDBQTCuJmUcyZ1opYjYcJh69Mawa7UAqHmqLs8AMUtSxtq1XXl3UVnPn73SHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=T5v6jubQ;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A7D606A333
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 06:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54A7D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=T5v6jubQ
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261020064605epoutp02aa195a0c01abfc7a87a7887485e6c622~gKfC3boWe1725817258epoutp02O
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 06:46:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261020064605epoutp02aa195a0c01abfc7a87a7887485e6c622~gKfC3boWe1725817258epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792478765;
	bh=+NP2Sc9QfAH27QKUaoXkjp0qHnyNnKKBhYsb0OsmWbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T5v6jubQGzQRG7yKQZxGlVS2Jt2bKRFkKRmj/cuR0fiW206MlZ0+lU8xkFOAdMvt9
	 v1gOp2rxL2H72YKeO5BMXh0SEPUgUkfBP5MIumi30rKWb9mMDvat8juCY7GARlt9Wk
	 gWpuMya/UdySkVdNF1RR6CuZd5qzDq1sod+4DPzA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261020064605epcas5p19592347b004bc7738bdaaefeb2acc084~gKfCdk5_b3226632266epcas5p1C;
	Tue, 20 Oct 2026 06:46:05 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4j82xS36vyz2SSKq; Tue, 20 Oct
	2026 06:46:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261020063816epcas5p4e531ac51a34ccd0cc9a5e919fc830882~gKYOCYwVC0054500545epcas5p4G;
	Tue, 20 Oct 2026 06:38:16 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063813epsmtip10952631de719c793aedee8998c965985~gKYLNry0-0259902599epsmtip1W;
	Tue, 20 Oct 2026 06:38:13 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 06/14] clk: samsung: clk-pll: Add support for pll_4313
Date: Tue, 20 Oct 2026 12:25:50 +0530
Message-Id: <20261020065558.1829402-7-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020065558.1829402-1-raghav.s@samsung.com>
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
X-CMS-MailID: 20261020063816epcas5p4e531ac51a34ccd0cc9a5e919fc830882
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063816epcas5p4e531ac51a34ccd0cc9a5e919fc830882
References: <20261020065558.1829402-1-raghav.s@samsung.com>
	<CGME20261020063816epcas5p4e531ac51a34ccd0cc9a5e919fc830882@epcas5p4.samsung.com>

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

