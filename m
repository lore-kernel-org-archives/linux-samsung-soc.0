Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F02515E7E2
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 May 2024 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715324354; cv=none; b=QoOadT+EU6+QdZtD89D2W+3DxJpGLJqQee0iWXuUA+6y4fdpFWzYbpmvyATaC9jje/ILuYwdbeUtKYBh3Vki0poBIz/Z8ZTOg9NKdt7cM5Lcll9Bwu3+L/aBqav31LiAEvAju3FaOkwdH6McZ+2BTcS2s7LIjltay3TThbBhW2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715324354; c=relaxed/simple;
	bh=BkiC+4/d1Aej2pvzhGaSIXoqxNJOjPJL882DbM2klIU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=B104+9sZkWx9i6EZtD4xvN0TRKKI/AD4BSQx0r6f5blEMQMe+11dmgcBMDTArnrwJVB9nAboISnHTXTlINE4O77dtscl5zwOWPM9RLG6g5Qn2C620MA9cxSRcxroXuvC2qwlKTsT2ffKFF6d2hLiokeL0kZuI7miljaRzPEOsd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZLhQLffc; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZLhQLffc"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240510065910euoutp01f7149554b2ec686d9aacfda800263da2~ODmiFbcfx2306523065euoutp01R
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 May 2024 06:59:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240510065910euoutp01f7149554b2ec686d9aacfda800263da2~ODmiFbcfx2306523065euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1715324350;
	bh=HBfnt9gcABXZGOzRBOXJB1W/3ZsYp9bTMhWlPO/BaVk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ZLhQLffcjvqGW1sC8VZcEXpsoI0uv/2Cm2YHpf2mdhbSGBwDTsO381c/9GZSBo47u
	 QDNt3161McF1JlzsPCLCZEZbbyAqMEdUWvTvXXr3rVcfrhI4d8FBv6jxSz8LyeWmVT
	 Ylj0V9dIJ4PvQlT3J7mZl1P1ew9wcEh5UyQQpz2U=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240510065909eucas1p245006c5e942d11cfa4c3286f3853e8d3~ODmhyTY531358513585eucas1p24;
	Fri, 10 May 2024 06:59:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 0A.43.09620.DB5CD366; Fri, 10
	May 2024 07:59:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240510065909eucas1p20067042a45b26e0a58110ff439dcc1b8~ODmhOJRc82385923859eucas1p2c;
	Fri, 10 May 2024 06:59:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240510065909eusmtrp14213bff433e2702d8d3007ed5904c575~ODmhMQkHo1740817408eusmtrp16;
	Fri, 10 May 2024 06:59:09 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-6b-663dc5bd854d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 16.66.08810.DB5CD366; Fri, 10
	May 2024 07:59:09 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240510065908eusmtip27a48f291d889f418c03762f184bb16d4~ODmgjNtS61647916479eusmtip2B;
	Fri, 10 May 2024 06:59:08 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam
	Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v2] clk: samsung: Don't register clkdev lookup for the fixed
 rate clocks
Date: Fri, 10 May 2024 08:59:01 +0200
Message-Id: <20240510065901.535124-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djPc7p7j9qmGUw4rWnxYN42NovrX56z
	Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3eLiKVeLw2/aWS3+XdvIYvG8bx+TA5fH+xut7B6bVnWy
	edy5tofNo2/LKkaPz5vkAlijuGxSUnMyy1KL9O0SuDL2X3vCVHCCt+LRp26WBsZJ3F2MHBwS
	AiYSi66JdzFycQgJrGCU+PT9KjOE84VR4u+clVDOZ0aJxqPbgBxOsI6ZW7+zg9hCAssZJa4t
	SYTr2Hf/OBtIgk3AUKLrbReYLSLgILHr2GQmkCJmgUtMEre3LgKbJCwQJXG4dQfYJBYBVYmV
	J3aDxXkF7CSm7zgLtU1eYv/Bs1BxQYmTM5+wgNjMQPHmrbPBzpMQ2MIhsbK1hRGiwUXiysL1
	LBC2sMSr41vYIWwZidOTe1ggGtoZJRb8vs8E4UxglGh4fguq21rizrlfbKCgYRbQlFi/Sx8i
	7Cgxcc82JkiI8UnceCsIcQSfxKRt05khwrwSHW1CENVqErOOr4Nbe/DCJahfPCS2XW5nhYRc
	rMSh+V+YJjAqzELy2iwkr81CuGEBI/MqRvHU0uLc9NRi47zUcr3ixNzi0rx0veT83E2MwER0
	+t/xrzsYV7z6qHeIkYmD8RCjBAezkghvVY11mhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe1RT5
	VCGB9MSS1OzU1ILUIpgsEwenVAOTenry1yXfjh/Tuh3mNeVtfuGiVf/WfNh6b45DihNP0PRr
	W5wnXlP74ix1qizBa+eac7oxhzNXLtoReuvay8bV/IwBVjyBgUlXnT2qm2XrGEukdu922nsu
	6VLpkb9nBb1mzC4RqrsgLif0acsRKes4kZ9no+4VN293ndiWs7In1/B3+OuDK6REjWX8nsX8
	dV22VOXbkp+vHE5oTbwZ+UkrVMhy+48wD7aTM59dUW44MD+8+nCbs+Q87wPKmzg2SL1Q59py
	0OzsxYTABYslGxT+5h8U+fVul73H4jXLM9RmsJ7WuKzln2y6srjl/eTVAv1XEraZ+HSbO0yZ
	cuwuy7azN1wr5vftF5u3Q/PG2ks6r5VYijMSDbWYi4oTAU3LljGzAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsVy+t/xe7p7j9qmGbx5yGrxYN42NovrX56z
	Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3eLiKVeLw2/aWS3+XdvIYvG8bx+TA5fH+xut7B6bVnWy
	edy5tofNo2/LKkaPz5vkAlij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX0
	7WxSUnMyy1KL9O0S9DL2X3vCVHCCt+LRp26WBsZJ3F2MnBwSAiYSM7d+Z+9i5OIQEljKKHFj
	yQR2iISMxMlpDawQtrDEn2tdbBBFnxglXnRuAEuwCRhKdL0FSXByiAg4STz6fBNsErPADSaJ
	ZYt3M4MkhAUiJC5+e84IYrMIqEqsPAER5xWwk5i+4ywzxAZ5if0Hz0LFBSVOznzCAmIzA8Wb
	t85mnsDINwtJahaS1AJGplWMIqmlxbnpucWGesWJucWleel6yfm5mxiBMbDt2M/NOxjnvfqo
	d4iRiYPxEKMEB7OSCG9VjXWaEG9KYmVValF+fFFpTmrxIUZToPsmMkuJJucDozCvJN7QzMDU
	0MTM0sDU0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNTqoFJQqy+0fNrz7+Dgi0/Di5j7dn5
	UqHGb8rLtE3/bXh64sx3P+/yN9Jh1Tx48xdrBOv/gBm/Lx//X1IVvDI1+q7wlO/mPpJXZ7pN
	lWF/6zB7Jm/qkpUvduYIn6t6U6P1Olv5rtBdUZn1W6N8Rf44+GozRoQZWRTFm19x/yDY/Ee6
	blbm+k0dyhHz5+nyiX6w49t30utX58XKnxLKWzZ/5uNzv/jtl4Zf49ND+vHTuJ9dlUt/sUD1
	orv39GTR1u3zl+pn35jBLlAtu1B94tf2/TYtPPk/nrP4Ny58aCF94d26zVskyvZsMHsXEsJ6
	qD+D6Y+Xa8Hin3fCVD7PjTz2cvmj8FS5azOdHmulyzlW/2dXYinOSDTUYi4qTgQAuSwklAoD
	AAA=
X-CMS-MailID: 20240510065909eucas1p20067042a45b26e0a58110ff439dcc1b8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240510065909eucas1p20067042a45b26e0a58110ff439dcc1b8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240510065909eucas1p20067042a45b26e0a58110ff439dcc1b8
References: <CGME20240510065909eucas1p20067042a45b26e0a58110ff439dcc1b8@eucas1p2.samsung.com>

Commit 4d11c62ca8d7 ("clkdev: report over-sized strings when creating
clkdev entries") revealed that clock lookup is registered for all fixed
clocks. The mentioned commit added a check if the registered name is not
too long. This fails for some clocks registered for Exynos542x SoCs family.
This lookup is a left-over from early common clock framework days, not
really needed nowadays, so remove it to avoid further issues.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
---
v2:
- removed unused 'ret' variable
---
 drivers/clk/samsung/clk.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index b6701905f254..afa5760ed3a1 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -139,7 +139,7 @@ void __init samsung_clk_register_fixed_rate(struct samsung_clk_provider *ctx,
 		unsigned int nr_clk)
 {
 	struct clk_hw *clk_hw;
-	unsigned int idx, ret;
+	unsigned int idx;
 
 	for (idx = 0; idx < nr_clk; idx++, list++) {
 		clk_hw = clk_hw_register_fixed_rate(ctx->dev, list->name,
@@ -151,15 +151,6 @@ void __init samsung_clk_register_fixed_rate(struct samsung_clk_provider *ctx,
 		}
 
 		samsung_clk_add_lookup(ctx, clk_hw, list->id);
-
-		/*
-		 * Unconditionally add a clock lookup for the fixed rate clocks.
-		 * There are not many of these on any of Samsung platforms.
-		 */
-		ret = clk_hw_register_clkdev(clk_hw, list->name, NULL);
-		if (ret)
-			pr_err("%s: failed to register clock lookup for %s",
-				__func__, list->name);
 	}
 }
 
-- 
2.34.1

