Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A3E1DE2D6
	for <linux-samsung-soc@vger.kernel.org>; Sat,  8 Mar 2025 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741449249; cv=none; b=c5ZExfMRUbfl2dhpQq00M53fJ9NN/9UlVDL+Cwx98iaFxW2dyW4uqx7fNrJUFg6arIGSWlg0j1AU1zeXln3vyBSeg8+8/D1aoA8rl0PuAqHoOUk2WcaMBUW1EMiKZ8hjBa28RIZn+KEvtEbIh66CpSbVYQR63/OXFef3SkjVLjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741449249; c=relaxed/simple;
	bh=rMuV6nHCFntzsYto5y3wh+iRvpqtsKuycOOrbtN0JmE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=Eivp131fWGkN4AAjOH3brabquQ74xaS7rk04oNzvkBKBJLl6qp4qfKbbCXZeLw8jVzxV9w62tZpvPQuLshMEJzJJqrAB6QdnDuqJ2VFwQwrSXkzBJjaKSiogbOKC6Ig4zFX8QJiNNdZ9BWSno4UDLFMuCZxs9O3Fx1+9EvrSayE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ppHVffR8; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ppHVffR8"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250308155359epoutp019ef6f17d0bf141689909af6dfb5c2d13~q3ttFg_Sy2550425504epoutp01B
	for <linux-samsung-soc@vger.kernel.org>; Sat,  8 Mar 2025 15:53:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250308155359epoutp019ef6f17d0bf141689909af6dfb5c2d13~q3ttFg_Sy2550425504epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741449239;
	bh=KqFr1VhT2FTQnSr3LaaqWnUOVNuACS2W7zCBsK/XyWg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ppHVffR8fnb/BCswaIXVwhi13kROZlDPhwqyAu3iatGKZR6X+rvwBkkWSv1OHPVXK
	 G9Pa9D8tbHnMJoFztCK4J/B6kogUyjp4XHjwJoVTnnWAdNwhlQ2gGPpzIkNO7BsvqX
	 Pf4Ao6U/xPNmRve0uslePSWRXm91l0VchiwPQxyU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20250308155358epcas5p164f2e579cd86ce471b82119a926eb1ee~q3tsaFtGe1115911159epcas5p1p;
	Sat,  8 Mar 2025 15:53:58 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Z974N5YC7z4x9Pp; Sat,  8 Mar
	2025 15:53:56 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F7.AD.29212.4186CC76; Sun,  9 Mar 2025 00:53:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250307093024epcas5p1e0be921d3f3445c67daf399e451bb203~qe1gjIIBT2800428004epcas5p1Z;
	Fri,  7 Mar 2025 09:30:24 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250307093024epsmtrp12309fd6dc4c83031d7095f2e2625ec8d~qe1ghSaSe3067930679epsmtrp1C;
	Fri,  7 Mar 2025 09:30:24 +0000 (GMT)
X-AuditID: b6c32a50-801fa7000000721c-b7-67cc68143370
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B8.DE.23488.0BCBAC76; Fri,  7 Mar 2025 18:30:24 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250307093022epsmtip26314520fbe088f38ce7c9fb84b185828~qe1eigaFn2162621626epsmtip2G;
	Fri,  7 Mar 2025 09:30:22 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: gost.dev@samsung.com, Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH v3] clk: samsung: Use samsung CCF common function
Date: Fri,  7 Mar 2025 14:54:03 +0530
Message-Id: <20250307092403.19742-1-v.pavani@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAKsWRmVeSWpSXmKPExsWy7bCmlq5Ixpl0g22rtS0ezNvGZnFo81Z2
	i+tfnrNa3Dywk8ni/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrVYtHWL+wWh9+0s1r8
	u7aRxWJD7yt2Bz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgU6BUn5haX5qXr5aWWWBkaGBiZAhUmZGcsmb2HuWChWkXD7seMDYzb
	FbsYOTkkBEwkDv2/wNLFyMUhJLCHUaL35B92COcTo8TVGQfYQKqEBL4xSux5kgLT8fXvTqii
	vYwSXZsmMUI4Xxglnvz4zghSxSagJbF66nJWEFtE4AiTxJ8TqSA2s4CdxPqpc5lBbGEBR4mL
	H2ayg9gsAqoSu49NBIpzcPAKWEpcuFUDsUxeYvWGA8wg8yUE7rFLLL/QzQ6RcJGYseoUE4Qt
	LPHq+BaouJTEy/42dpA5EgLJEu2fuCHCORKXdq+CKreXOHBlDgtICbOApsT6XfoQYVmJqafW
	MUFcySfR+/sJVDmvxI55MLaSxM4dE6BsCYmnq9cAw4cdyPaQeB4EMlBIIFbi5/SsCYyysxDG
	L2BkXMUolVpQnJuemmxaYKibl1oOj6Tk/NxNjOCkpxWwg3H1hr96hxiZOBgPMUpwMCuJ8Kpt
	P5UuxJuSWFmVWpQfX1Sak1p8iNEUGF4TmaVEk/OBaTevJN7QxNLAxMzMzMTS2MxQSZy3eWdL
	upBAemJJanZqakFqEUwfEwenVAOT/kqVOT98NP4uDkm4/2Fz2sPOlTm3Xy9XOvHwr7mRfeyL
	58/vLb0wtfZXrYLMlCLGdVqKS2b7VjbuvnyD80yHnnt0dFrkUlcl5k3OU73srigZq1W81t8+
	6dOenAtmvbEXFxVteq/0LXX2ZreF9oUu897JVJeLMoqH/fb6/8Nu96kH14xXr/3FW/lj0kmd
	dt+49kNM19Yqzmqt9FoadvbozOftu9lYOx3MRb4/s7fXK04vfabi/LtTMnUar++e9Z9PXJ9+
	TyHu59OOIJuNmdtr5x+6xTd/crn5xLcnxDfP9RBoMerPP3eo82D4cbP1DLPXsmuqiLOzRNo3
	SstFNRWbHJc4Xf69lLP4CcNOpo1aSizFGYmGWsxFxYkA3Nan4gMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPLMWRmVeSWpSXmKPExsWy7bCSvO6GPafSDY5NE7B4MG8bm8WhzVvZ
	La5/ec5qcfPATiaL8+c3sFtsenyN1eJjzz1Wi8u75rBZzDi/j8ni4ilXi0Vbv7BbHH7Tzmrx
	79pGFosNva/YHfg83t9oZffYtKqTzWPzknqPvi2rGD0+b5ILYI3isklJzcksSy3St0vgylgy
	ew9zwUK1iobdjxkbGLcrdjFyckgImEh8/buTHcQWEtjNKDHpaiJEXEJi57dWZghbWGLlv+dA
	NVxANZ8YJXoXrwRLsAloSayeupwVJCEicIlJ4sCRJ2CTmAUcJC6efcICYgsLOEpc/DATLM4i
	oCqx+9hEoGYODl4BS4kLt2ogFshLrN5wgHkCI88CRoZVjJKpBcW56bnJhgWGeanlesWJucWl
	eel6yfm5mxjBYailsYPx3bcm/UOMTByMhxglOJiVRHjVtp9KF+JNSaysSi3Kjy8qzUktPsQo
	zcGiJM670jAiXUggPbEkNTs1tSC1CCbLxMEp1cDUUqsuJ+m3MfPq4S+M3z1vnwywvvo/3tRE
	l9HgYq7y5Z87fi6fPV1XecaVq128gtEuV8zTQydFG/JqMa3v6PoWV6Z0RNE2zrR0HpPO3hvX
	3vidVz+4+Ff8gldTBfJVs55ePisdIPbcdOb8dzJVUZdtnFIWH29tvHot5Lqj6E/tY7ZfbP98
	mbavNzFklk9JwQ1Rfcm30hqmRiFLte6d9wq7dOOVdHVBY8mBTenX/lxmPlH4cpI1l4ZAdGfS
	jsUei6Y9m+CwxTF07cuJG59nZTAu9ZjBf9zqUpgAh4zxs2kH2pc0m7hEv3J6yVzUsXxfw2Hv
	Kcv85U+smrnK0ob7stGqGfX7pU3jPUTt5psUvLqlxFKckWioxVxUnAgAnn1atbICAAA=
X-CMS-MailID: 20250307093024epcas5p1e0be921d3f3445c67daf399e451bb203
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250307093024epcas5p1e0be921d3f3445c67daf399e451bb203
References: <CGME20250307093024epcas5p1e0be921d3f3445c67daf399e451bb203@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Use samsung CCF function which registers multiple clock providers using
single function call samsung_cmu_register_clocks().

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
---

Changes in V3:
-Addressed checkpatch warning identified when run with --strict option, as per
review comment from Krzysztof. Below is the warning from checkpatch.
"CHECK: Unbalanced braces around else statement"
-Here is the link for V2 https://patchwork.kernel.org/project/linux-clk/patch/20250225131918.50925-2-v.pavani@samsung.com/

Changes in V2:
-No review comments in V1.

 drivers/clk/samsung/clk-exynos4.c | 74 ++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 16be0c53903c..8fc89bde0d24 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1269,6 +1269,45 @@ static const struct samsung_cpu_clock exynos4412_cpu_clks[] __initconst = {
 		CPUCLK_LAYOUT_E4210, e4412_armclk_d),
 };
 
+static const struct samsung_cmu_info cmu_info_exynos4 __initconst = {
+	.mux_clks		= exynos4_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(exynos4_mux_clks),
+	.div_clks		= exynos4_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(exynos4_div_clks),
+	.gate_clks		= exynos4_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(exynos4_gate_clks),
+	.fixed_factor_clks	= exynos4_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(exynos4_fixed_factor_clks),
+	.fixed_clks	= exynos4_fixed_rate_clks,
+	.nr_fixed_clks	= ARRAY_SIZE(exynos4_fixed_rate_clks),
+};
+
+static const struct samsung_cmu_info cmu_info_exynos4210 __initconst = {
+	.mux_clks		= exynos4210_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(exynos4210_mux_clks),
+	.div_clks		= exynos4210_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(exynos4210_div_clks),
+	.gate_clks		= exynos4210_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(exynos4210_gate_clks),
+	.fixed_factor_clks	= exynos4210_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(exynos4210_fixed_factor_clks),
+	.fixed_clks	= exynos4210_fixed_rate_clks,
+	.nr_fixed_clks	= ARRAY_SIZE(exynos4210_fixed_rate_clks),
+	.cpu_clks		= exynos4210_cpu_clks,
+	.nr_cpu_clks		= ARRAY_SIZE(exynos4210_cpu_clks),
+};
+
+static const struct samsung_cmu_info cmu_info_exynos4x12 __initconst = {
+	.mux_clks		= exynos4x12_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(exynos4x12_mux_clks),
+	.div_clks		= exynos4x12_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(exynos4x12_div_clks),
+	.gate_clks		= exynos4x12_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(exynos4x12_gate_clks),
+	.fixed_factor_clks	= exynos4x12_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(exynos4x12_fixed_factor_clks),
+};
+
 /* register exynos4 clocks */
 static void __init exynos4_clk_init(struct device_node *np,
 				    enum exynos4_soc soc)
@@ -1322,41 +1361,12 @@ static void __init exynos4_clk_init(struct device_node *np,
 					ARRAY_SIZE(exynos4x12_plls));
 	}
 
-	samsung_clk_register_fixed_rate(ctx, exynos4_fixed_rate_clks,
-			ARRAY_SIZE(exynos4_fixed_rate_clks));
-	samsung_clk_register_mux(ctx, exynos4_mux_clks,
-			ARRAY_SIZE(exynos4_mux_clks));
-	samsung_clk_register_div(ctx, exynos4_div_clks,
-			ARRAY_SIZE(exynos4_div_clks));
-	samsung_clk_register_gate(ctx, exynos4_gate_clks,
-			ARRAY_SIZE(exynos4_gate_clks));
-	samsung_clk_register_fixed_factor(ctx, exynos4_fixed_factor_clks,
-			ARRAY_SIZE(exynos4_fixed_factor_clks));
+	samsung_cmu_register_clocks(ctx, &cmu_info_exynos4);
 
 	if (exynos4_soc == EXYNOS4210) {
-		samsung_clk_register_fixed_rate(ctx, exynos4210_fixed_rate_clks,
-			ARRAY_SIZE(exynos4210_fixed_rate_clks));
-		samsung_clk_register_mux(ctx, exynos4210_mux_clks,
-			ARRAY_SIZE(exynos4210_mux_clks));
-		samsung_clk_register_div(ctx, exynos4210_div_clks,
-			ARRAY_SIZE(exynos4210_div_clks));
-		samsung_clk_register_gate(ctx, exynos4210_gate_clks,
-			ARRAY_SIZE(exynos4210_gate_clks));
-		samsung_clk_register_fixed_factor(ctx,
-			exynos4210_fixed_factor_clks,
-			ARRAY_SIZE(exynos4210_fixed_factor_clks));
-		samsung_clk_register_cpu(ctx, exynos4210_cpu_clks,
-				ARRAY_SIZE(exynos4210_cpu_clks));
+		samsung_cmu_register_clocks(ctx, &cmu_info_exynos4210);
 	} else {
-		samsung_clk_register_mux(ctx, exynos4x12_mux_clks,
-			ARRAY_SIZE(exynos4x12_mux_clks));
-		samsung_clk_register_div(ctx, exynos4x12_div_clks,
-			ARRAY_SIZE(exynos4x12_div_clks));
-		samsung_clk_register_gate(ctx, exynos4x12_gate_clks,
-			ARRAY_SIZE(exynos4x12_gate_clks));
-		samsung_clk_register_fixed_factor(ctx,
-			exynos4x12_fixed_factor_clks,
-			ARRAY_SIZE(exynos4x12_fixed_factor_clks));
+		samsung_cmu_register_clocks(ctx, &cmu_info_exynos4x12);
 		if (soc == EXYNOS4412)
 			samsung_clk_register_cpu(ctx, exynos4412_cpu_clks,
 					ARRAY_SIZE(exynos4412_cpu_clks));
-- 
2.17.1

