Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9161922E409;
	Thu,  5 Dec 2024 19:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427375; cv=none; b=S9EKZ9fG4j76ilKsmmVG/oLZaF5nN8JdoyyUHVrx/EeJRnOKsHWlAlzxEswsvb9qYZWDi96U+J+Bg5UcHUUJhhVT6XGyNQAy4OzypEO9gAI9GjVgKx7X1A1hlvtJlLCGlnnm0UeAQ9joe+b2l060ZbYvQpv36SEUqJKhEeVF5K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427375; c=relaxed/simple;
	bh=Djs3hVM5WphLELs/VNAZd7kS4SlmMzLUs16stVgHiRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGkyqP0n6ijmV8B1Got0421qKQAltHzpSUnIHipARnWii5vNY8VOhpRsdDU1y8DJYa1wiVlTssdm86nygF5zTNkBUWye05ItlAhsDvrddMmaF2FWbSFDFO3MxeOPLdS/pzQISQ78g+kDo2Ytt+4WIeLsbay4CS2OmtGNCbZNrCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=SVPCLkfU; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="SVPCLkfU"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y44Pf0r41zGp5Y;
	Thu, 05 Dec 2024 19:36:06 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y44PV08PYz6tkN;
	Thu,  5 Dec 2024 19:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733427360;
	bh=Djs3hVM5WphLELs/VNAZd7kS4SlmMzLUs16stVgHiRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SVPCLkfULUvZ40wR4NeRtqF5+1QTxjX7UdMZGeibEIFNdQAIaTmzM/M/Ib+RiZ9Au
	 ggsRluXs1iJXgyWTZRJv0jQY/5eVEyecPej1VqEfFZ+T8Q3WFytjV00+z2yH2V1uDG
	 gykyt6hBokBjimx8ZCvkuIiklqBi9uFnZJ0pJi7448tnqAyfnMF1zj5oPfQ4tlIzI2
	 jw0Ju5QiQi7QvPK5sQRgduNfpM+U0B4tIdGIPHYNHAJ5tyXU7hTqn/WTbt3Jn4gpYD
	 +JZ/wZ7+i/wu0OUh4bD0W7lr+K4xVjZDtVZSSdDXGKC/dAESrSSvaPpTXBCb5C577l
	 6b5BFKVItnNVg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
Date: Thu,  5 Dec 2024 20:34:22 +0100
Message-ID: <20241205193423.783815-3-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205193423.783815-1-igor.belwon@mentallysanemainliners.org>
References: <20241205193423.783815-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These PLLs are found in the Exynos990 SoC. The PLLs are similar
to pll0822x.

pll0717x and pll0718x are an exception, and they use the mdiv
mask from 1718X (that is, one bit smaller).

Apart from that, the masks/shifts are identical to those of 0822x.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/clk/samsung/clk-pll.c | 14 ++++++++++++--
 drivers/clk/samsung/clk-pll.h |  3 +++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index be6b51694919..2e94bba6c396 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -430,7 +430,10 @@ static const struct clk_ops samsung_pll36xx_clk_min_ops = {
 #define PLL0822X_LOCK_STAT_SHIFT	(29)
 #define PLL0822X_ENABLE_SHIFT		(31)
 
-/* PLL1418x is similar to PLL0822x, except that MDIV is one bit smaller */
+/*
+ * PLL1418x, PLL0717x and PLL0718x are similar
+ * to PLL0822x, except that MDIV is one bit smaller
+ */
 #define PLL1418X_MDIV_MASK		(0x1FF)
 
 static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
@@ -441,10 +444,14 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 	u64 fvco = parent_rate;
 
 	pll_con3 = readl_relaxed(pll->con_reg);
-	if (pll->type != pll_1418x)
+
+	if (pll->type != pll_1418x &&
+	    pll->type != pll_0717x &&
+	    pll->type != pll_0718x)
 		mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL0822X_MDIV_MASK;
 	else
 		mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL1418X_MDIV_MASK;
+
 	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
 	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
 
@@ -1377,6 +1384,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_0516x:
 	case pll_0517x:
 	case pll_0518x:
+	case pll_0717x:
+	case pll_0718x:
+	case pll_0732x:
 		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
 		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 858ab367eb65..6ddc54d173a0 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -45,6 +45,9 @@ enum samsung_pll_type {
 	pll_531x,
 	pll_1051x,
 	pll_1052x,
+	pll_0717x,
+	pll_0718x,
+	pll_0732x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.45.2

