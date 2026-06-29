Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63B737DEA3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2026 03:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782703550; cv=none; b=GFS/YpGbid2FP4zDpLkceHoDRJMG0az+EZGNuz93MlwFZTp2YSr+sK6eGHBNHiinwG4YQCoRCNzpFyDOPfiFrUs/+d4VkQN+SbnkkTOXAHN9T4/RbcoBJui53w2g2P4xqsGwnd4Y4JRI7A4Hx4HxBvoYVfMviF/2pRaEfP95ZGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782703550; c=relaxed/simple;
	bh=2OtwiR0aUl1XQdXsTMhDBXZj/AxoFLijZjRd9Wnd81k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRps8ugHgtEpKFtuC94n3tMHgW+pT6dYm17qUKJ/ePFT9l//DUvDujIZ+A1Pv+uiU3O5ii3daq5useBW8IDPLVjfwQpnCX0Kzf9wADOM1au7UewxUiCHRLTDexVgLYiWRH4vtIyx8X3qYRVmHcPOetaSkGppLoWNAX3GbmRQHVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLJTGnRf; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLJTGnRf"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c96cb024ee0so303105a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Jun 2026 20:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782703548; x=1783308348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okd3JtsJS3ksT2GaRH8nnVfDydk7G//ESOzr5O9Y1xA=;
        b=aLJTGnRfnK2ic/gf+7LYiq8uun1z1fVASF/NubcoEb5ak7W74m/ODSB1kS5vLwZuxL
         +98lCNNtFTns7koo5/+zTvKNhdh3Zpdf36YVHDokHH4vFHqlE4b9Mms0f+b4uXURVqmV
         1QvqllnxkpMeqeHgKEjr1lyNWiX9WZAwIiPm/cFzcW4O/cZ8RZ+HUy6bONWD/Nkxbm6i
         FpO3J/I4n3Xsm0Ehw6Tl+eMsPeDDSGfXtC/1jmbDR/rbo103GGT6Ky5Ej0bXxHSi+hB2
         ktpsU6BU+TpWVXN0x+TbYQ3LIHoevXabMNipAv6PeqUeSWPol7WisYHRRvjvAN5/ANZT
         aoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782703548; x=1783308348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=okd3JtsJS3ksT2GaRH8nnVfDydk7G//ESOzr5O9Y1xA=;
        b=jwVOM6BRCzsJ0FTOp2PPF9IZspNrINWSZVCF+ylw81heU7oWunxaBR+uYqvaRdW2Xe
         y9Sq1L/6RhQC4Dh211c3MTjjyzV5Jc5vtivb6SP7tIuP9tWtv9g4TSKLy7Pa9UBfA6Hv
         aYCbEeJShyfpDpvSyBd4f2eve4kmB+5y9ciGo+B+4S14EHckihPikhk9LAg9UQptQphA
         Aoun/YVV1j95BcNG5P2RKDr8jduRTVKyhT95il+iz9s9XgjXXm7cZvMbIzz/95D/yUiT
         /UE8+K2zWplAol1pIgW/xIJ405MBEd4oOMNfhlEzjiQORs8eAvRzQgxWNQccskII/9bT
         PAdw==
X-Forwarded-Encrypted: i=1; AFNElJ8J5g71eikRJRpP29QJrjg3bd594X9+WnYS/DrldnyNsW+LaB8mdc357C8zhDcqP1YAVPHsJ6wLZgk5ksQ4gTXPGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg4SLk+JuIcAHaBMAXB4JPF/B124CGvpjcmXzoidQxWjV6Qo/e
	QoFu+SCDqpMmxnOzVv3OIHZWccu78whkrXzegL/0LRkyhueSmPf3E6jN
X-Gm-Gg: AfdE7clCC+7kwryINy6fxh843H2w04kwHAser7T5EYk8uVsQkodj0Ol+xbjUF1QURSI
	YPMjcAkL7n2RVXgKruBPa4UCCIGdEq82Q/N6Szy2Eq4G1dTnY9J7issJhiaFG6385YZQQQ8ECcD
	WL6BvUtKv+zv/iilIhL2NtMyKAVauAWp8USL6rk2qePUXUhX5w9JYhWSTV9ffv6LaRJJ5O5dxyC
	cdfmVWh5Wj4rlnmV6twbk7HPYbOjxjKhWoicM6VLL4UJBUX/I24Znx5uHuPdq8O8eMM/YtI1QDs
	3A4fWC8WV3GNzCkE/PXBlBcoPTLtTtr4YvzTZIbzyl/G4gQ5t4gqQINDCIlxecsPpIxLq/QKiT1
	BKyxmluwJ6302mcuphUt3kogV9GtM/LY/NhKV/+Yt1nqNAWDpOe6kukE8ceXzHorMiHIe37BVf4
	w6B79ufcNvp++pjbQ9Jg0Od6T3BsZVe5iKdqnKFOo7riurWz+hv70Bu1QaXaEEH2ygEGzEcXXKo
	p7vPayqhw==
X-Received: by 2002:a05:6a20:43a5:b0:3b5:4fff:fa0f with SMTP id adf61e73a8af0-3bd4ad47905mr15973328637.14.1782703547909;
        Sun, 28 Jun 2026 20:25:47 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-846c7f659ddsm1921771b3a.32.2026.06.28.20.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 20:25:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv3 3/3] clk: samsung: pll: use kzalloc_flex
Date: Sun, 28 Jun 2026 20:25:40 -0700
Message-ID: <20260629032540.2331559-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629032540.2331559-1-rosenp@gmail.com>
References: <20260629032540.2331559-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify allocation by using a flexible array member to combine
allocations and remove a kfree.

Use __counted_by for extra runtime analysis.

Since rate_table is now a flexible array member, NULL checks don't work.
So use the counting variable to check allocation.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 56 ++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index fdb84bcec912..e74552846ba3 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -28,7 +28,7 @@ struct samsung_clk_pll {
 	unsigned short		lock_offs;
 	enum samsung_pll_type	type;
 	unsigned int		rate_count;
-	const struct samsung_pll_rate_table *rate_table;
+	struct samsung_pll_rate_table rate_table[] __counted_by(rate_count);
 };
 
 #define to_clk_pll(_hw) container_of(_hw, struct samsung_clk_pll, hw)
@@ -1593,35 +1593,32 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 {
 	struct samsung_clk_pll *pll;
 	struct clk_init_data init;
-	int ret, len;
+	unsigned int len = 0;
+	int ret;
 
-	pll = kzalloc_obj(*pll);
+	if (pll_clk->rate_table) {
+		/* find count of rates in rate_table */
+		while (pll_clk->rate_table[len].rate != 0)
+			len++;
+	}
+
+	pll = kzalloc_flex(*pll, rate_table, len);
 	if (!pll) {
 		pr_err("%s: could not allocate pll clk %s\n",
 			__func__, pll_clk->name);
 		return;
 	}
 
+	pll->rate_count = len;
+	if (len)
+		memcpy(pll->rate_table, pll_clk->rate_table,
+		       len * sizeof(*pll->rate_table));
+
 	init.name = pll_clk->name;
 	init.flags = pll_clk->flags;
 	init.parent_names = &pll_clk->parent_name;
 	init.num_parents = 1;
 
-	if (pll_clk->rate_table) {
-		/* find count of rates in rate_table */
-		for (len = 0; pll_clk->rate_table[len].rate != 0; )
-			len++;
-
-		pll->rate_count = len;
-		pll->rate_table = kmemdup_array(pll_clk->rate_table,
-						pll->rate_count,
-						sizeof(*pll->rate_table),
-						GFP_KERNEL);
-		WARN(!pll->rate_table,
-			"%s: could not allocate rate table for %s\n",
-			__func__, pll_clk->name);
-	}
-
 	switch (pll_clk->type) {
 	case pll_2126:
 		init.ops = &samsung_pll2126_clk_ops;
@@ -1640,7 +1637,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_a9fracm:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll35xx_clk_min_ops;
 		else
 			init.ops = &samsung_pll35xx_clk_ops;
@@ -1659,7 +1656,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_0732x:
 		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
 		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll0822x_clk_min_ops;
 		else
 			init.ops = &samsung_pll0822x_clk_ops;
@@ -1669,7 +1666,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		break;
 	case pll_4502:
 	case pll_4508:
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll45xx_clk_min_ops;
 		else
 			init.ops = &samsung_pll45xx_clk_ops;
@@ -1679,7 +1676,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_2650:
 		pll->enable_offs = PLL36XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL36XX_LOCK_STAT_SHIFT;
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll36xx_clk_min_ops;
 		else
 			init.ops = &samsung_pll36xx_clk_ops;
@@ -1687,7 +1684,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_0831x:
 		pll->enable_offs = PLL0831X_ENABLE_SHIFT;
 		pll->lock_offs = PLL0831X_LOCK_STAT_SHIFT;
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll0831x_clk_min_ops;
 		else
 			init.ops = &samsung_pll0831x_clk_ops;
@@ -1703,7 +1700,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_4650:
 	case pll_4650c:
 	case pll_1460x:
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll46xx_clk_min_ops;
 		else
 			init.ops = &samsung_pll46xx_clk_ops;
@@ -1712,19 +1709,19 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		init.ops = &samsung_pll2550x_clk_ops;
 		break;
 	case pll_2550xx:
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll2550xx_clk_min_ops;
 		else
 			init.ops = &samsung_pll2550xx_clk_ops;
 		break;
 	case pll_2650x:
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll2650x_clk_min_ops;
 		else
 			init.ops = &samsung_pll2650x_clk_ops;
 		break;
 	case pll_2650xx:
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll2650xx_clk_min_ops;
 		else
 			init.ops = &samsung_pll2650xx_clk_ops;
@@ -1734,7 +1731,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		init.ops = &samsung_pll531x_clk_ops;
 		break;
 	case pll_1031x:
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll1031x_clk_min_ops;
 		else
 			init.ops = &samsung_pll1031x_clk_ops;
@@ -1742,7 +1739,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_a9fraco:
 		pll->enable_offs = PLLA9FRACO_ENABLE_SHIFT;
 		pll->lock_offs = PLLA9FRACO_LOCK_STAT_SHIFT;
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_a9fraco_clk_min_ops;
 		else
 			init.ops = &samsung_a9fraco_clk_ops;
@@ -1761,7 +1758,6 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	if (ret) {
 		pr_err("%s: failed to register pll clock %s : %d\n",
 			__func__, pll_clk->name, ret);
-		kfree(pll->rate_table);
 		kfree(pll);
 		return;
 	}
-- 
2.54.0

