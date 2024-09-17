Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F2216A959
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Sep 2024 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569215; cv=none; b=j2zLtdYgV+HFR4UumooXQaBC+vMhS4nON3t0e2W9EcStgBQ/cXOlRrk1b6fuaMcTkApUiasRZxihYW4aQroP9uGT/6KBMPf1ri6CWEOZPN3+J16q+W6Mk25+sSqnTk8cxHRV+mufDZ3WcFAMBviHcDKETw90zgsLmkzJyR9SEEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569215; c=relaxed/simple;
	bh=37o2n5A3cl71NOZl7LHfq+0MpTbRcETMtLvUVZpiuYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=D6KxwhWL71BsFN6UJG96mkkgSHCSKXtvb+FJTUq3LTSBwG0CzwbXyrFkqnDpgJAcFpW7Jh21QYScBKIM+SS0RYdQ7IzVjvfzETgvwiMIMAnyGjDeoFeSVQLkyja+3LJkd40FOVg22ab13isuCsBdcSy/SMwgtSwIIKM8nTndY8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=W5jDXMJs; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="W5jDXMJs"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240917103331epoutp04bf9fb393cffa18cc8b1280fb407335a6~2AYzesVrO2856628566epoutp04f
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Sep 2024 10:33:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240917103331epoutp04bf9fb393cffa18cc8b1280fb407335a6~2AYzesVrO2856628566epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726569211;
	bh=yAuiMaJUu1Ka2CNlLr473WV/9ltCNEUJtt+Re/3TSlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W5jDXMJs9Q78g6kri15N3tJq/IqCUdq1X7xasKFYte0nwq6O/xYLW6pw/YjpQA5Uc
	 sxmI3t3akmi2IOD1XzBZfpaCQL1lNEu2dmQRLCPYOQyIikrGgIl4XB/SQbKXKKt+Jd
	 /i8PGxHPv9IhgraLCuyFaLbYbFl+/qbTR+eobUNA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240917103331epcas5p3af62927332f4c319ef4ce9cb6c974f90~2AYzCKJ8X2074820748epcas5p3U;
	Tue, 17 Sep 2024 10:33:31 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4X7J620Dksz4x9Pv; Tue, 17 Sep
	2024 10:33:30 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D7.C3.09640.9FA59E66; Tue, 17 Sep 2024 19:33:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20240917094452epcas5p2c6ea2af1bc0e0f8daf50218b37eb1936~1-uUblOgM1073910739epcas5p2L;
	Tue, 17 Sep 2024 09:44:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240917094452epsmtrp1d76ccc948d2a961882a9107bf153445f~1-uUZmLHJ2453424534epsmtrp1x;
	Tue, 17 Sep 2024 09:44:52 +0000 (GMT)
X-AuditID: b6c32a49-a57ff700000025a8-a1-66e95af97c98
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7B.DE.08964.39F49E66; Tue, 17 Sep 2024 18:44:51 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240917094449epsmtip1decc3a3acd052d1b834fd0f91546f043~1-uSMW5SJ2267922679epsmtip1M;
	Tue, 17 Sep 2024 09:44:49 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: pankaj.dubey@samsung.com, gost.dev@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH 1/2] clk: samsung: fsd: do not define number of clocks in
 bindings
Date: Tue, 17 Sep 2024 15:13:54 +0530
Message-Id: <20240917094355.37887-2-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240917094355.37887-1-inbaraj.e@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdlhTU/dn1Ms0gzV7LS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi5oGdTBZ3/0xiszh/fgO7xceee6wWl3fNYbOYcX4fk8XFU64Wi7Z+Ybf4
	v2cHu8XhN+2sFv+ubWRx4Pd4f6OV3WPTqk42j74tqxg9Pm+SC2CJyrbJSE1MSS1SSM1Lzk/J
	zEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMATpUSaEsMacUKBSQWFyspG9nU5Rf
	WpKqkJFfXGKrlFqQklNgUqBXnJhbXJqXrpeXWmJlaGBgZApUmJCdMe9iM1NBh0LF3gtbGRsY
	v0l1MXJySAiYSEx99Iepi5GLQ0hgN6NEV+cJRgjnE6PE1bZL7CBVQgLfGCV+rimB6bh2Yg8L
	RNFeRolp0/eyQhS1Mklsu5QLYrMJqEts6P7OBlIkIrCGSWL17BNgRcwC4RLnpl8Es4UFQiQ2
	v29mBrFZBFQl9r1ZDraNV8BKYtPlu+wQ2+QlVm84AFbDKWAt8e7nb2aQoRICP9klXjyeywJR
	5CLxY+cmZghbWOLV8S1QzVISL/vboGwfif1zfjFC2BkSx7YvZ4Ww7SUOXJkDNIcD6DhNifW7
	9CHCshJTT61jgriZT6L39xMmiDivxI55MLayxMwj99kgbEmJnZd3Qp3jIfH3/hdoCPUxSrxf
	+YplAqPcLIQVCxgZVzFKphYU56anFpsWGOallsNjLTk/dxMjODFqee5gvPvgg94hRiYOxkOM
	EhzMSiK8tr+fpgnxpiRWVqUW5ccXleakFh9iNAUG4ERmKdHkfGBqziuJNzSxNDAxMzMzsTQ2
	M1QS533dOjdFSCA9sSQ1OzW1ILUIpo+Jg1OqgSl+k/n0m29m/eZ943ylWW6RSkHdqU7Z8qc+
	5iLxHWtF7fYp5SnuuXpoz+yN2n+OFu+JFD1ivD3uQ93OiKO9F8w5JX2rF58tWnDg58cl+5w5
	tVVmNTIb+t5K4IiYmf/PKD16taDx/1eRZmyLf+Ypremw8VZmXmau45h7e8ep4L9/1kct/cmz
	66qrWNWi4OR9ou5i69m/X7+bWlpY9pOZzbr2q355yfe2WM30SI/Xad+4KwK2bVnWfj7y8t2A
	/zGmaluddsbs1dgyNXddedFn4TtWC8OL/52vTH527t27GezPjqy7oSDwPMPItkQiykswNGjB
	5WmJ2zmjPk/blFgQ9u/fq9CLNyXKrgc2FR3yua7EUpyRaKjFXFScCADRO0ROFQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWy7bCSnO5k/5dpBt0tlhYP5m1js1iz9xyT
	xfUvz1kt5h85x2px88BOJou7fyaxWZw/v4Hd4mPPPVaLy7vmsFnMOL+PyeLiKVeLRVu/sFv8
	37OD3eLwm3ZWi3/XNrI48Hu8v9HK7rFpVSebR9+WVYwenzfJBbBEcdmkpOZklqUW6dslcGXM
	u9jMVNChULH3wlbGBsZvUl2MnBwSAiYS107sYeli5OIQEtjNKLHi8WQmiISkxOzf09khbGGJ
	lf+es0MUNTNJzHrUxgiSYBNQl9jQ/Z0NJCEisItJYvri7WAJZoFIiR/tW8G6hQWCJB69XAFm
	swioSux7sxzM5hWwkth0+S7UBnmJ1RsOMIPYnALWEu9+/gazhYBqevbNY57AyLeAkWEVo2Rq
	QXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZw8Gpp7mDcvuqD3iFGJg7GQ4wSHMxKIry2v5+m
	CfGmJFZWpRblxxeV5qQWH2KU5mBREucVf9GbIiSQnliSmp2aWpBaBJNl4uCUamDS6Ph93m7L
	NzHTW9abTn3mMljzZt75YhfTprdMlh7n+uqMTvgl9zrMrcwu2SUuf6rrjK2mjufOSpO2Q+eV
	bv61az0csWDdnNZzDWohf4qW8KTu+69g+GjZJO1Hh+7nsk3PTtabeG3NtPL46yULHOS6a7wj
	H/ya5jZF5arojx++HA9CboX+t5nvocf9+JM7m3z5ha3W19itM1oW7Xq6qaajt+rsRy3FiugZ
	wpd1S+8WzYrsj3HZsmPLXK3G2tIUYREtZ0G7p153P8/PX8KQkXqGb1nMPaG1r7vX1vnXG/or
	P/1ysZ9le/RuhUq25MYvNnfiFt57smlH6Sb9gNsnLN/lTen2iHRef0BO6UZKZJ0SS3FGoqEW
	c1FxIgB/FVl5zQIAAA==
X-CMS-MailID: 20240917094452epcas5p2c6ea2af1bc0e0f8daf50218b37eb1936
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240917094452epcas5p2c6ea2af1bc0e0f8daf50218b37eb1936
References: <20240917094355.37887-1-inbaraj.e@samsung.com>
	<CGME20240917094452epcas5p2c6ea2af1bc0e0f8daf50218b37eb1936@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Number of clocks supported by Linux drivers might vary - sometimes we
add new clocks, not exposed previously.  Therefore these numbers of
clocks should not be in the bindings, as that prevents changing them.

Define number of clocks per each clock controller inside the driver
directly.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/clk/samsung/clk-fsd.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
index 6f984cfcd33c..9a6006c298c2 100644
--- a/drivers/clk/samsung/clk-fsd.c
+++ b/drivers/clk/samsung/clk-fsd.c
@@ -82,6 +82,15 @@
 #define GAT_CMU_NS_BRDG_CMU_IPCLKPORT_CLK__PSOC_CMU__CLK_CMU	0x205c
 #define GAT_CMU_SYSREG_CMU_IPCLKPORT_PCLK		0x2060
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR_CMU		(GAT_CMU_FSYS0_SHARED0DIV4 + 1)
+#define CLKS_NR_PERIC		(PERIC_DOUT_RGMII_CLK + 1)
+#define CLKS_NR_FSYS0		(FSYS0_DOUT_FSYS0_PERIBUS_GRP + 1)
+#define CLKS_NR_FSYS1		(PCIE_LINK1_IPCLKPORT_SLV_ACLK + 1)
+#define CLKS_NR_IMEM		(IMEM_TMU_GT_IPCLKPORT_I_CLK_TS + 1)
+#define CLKS_NR_MFC		(MFC_MFC_IPCLKPORT_ACLK + 1)
+#define CLKS_NR_CAM_CSI		(CAM_CSI2_3_IPCLKPORT_I_ACLK + 1)
+
 static const unsigned long cmu_clk_regs[] __initconst = {
 	PLL_LOCKTIME_PLL_SHARED0,
 	PLL_LOCKTIME_PLL_SHARED1,
@@ -300,7 +309,7 @@ static const struct samsung_cmu_info cmu_cmu_info __initconst = {
 	.nr_div_clks		= ARRAY_SIZE(cmu_div_clks),
 	.gate_clks		= cmu_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(cmu_gate_clks),
-	.nr_clk_ids		= CMU_NR_CLK,
+	.nr_clk_ids		= CLKS_NR_CMU,
 	.clk_regs		= cmu_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_clk_regs),
 };
@@ -665,7 +674,7 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
 	.nr_gate_clks		= ARRAY_SIZE(peric_gate_clks),
 	.fixed_clks		= peric_fixed_clks,
 	.nr_fixed_clks		= ARRAY_SIZE(peric_fixed_clks),
-	.nr_clk_ids		= PERIC_NR_CLK,
+	.nr_clk_ids		= CLKS_NR_PERIC,
 	.clk_regs		= peric_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric_clk_regs),
 	.clk_name		= "dout_cmu_pll_shared0_div4",
@@ -964,7 +973,7 @@ static const struct samsung_cmu_info fsys0_cmu_info __initconst = {
 	.nr_gate_clks		= ARRAY_SIZE(fsys0_gate_clks),
 	.fixed_clks		= fsys0_fixed_clks,
 	.nr_fixed_clks		= ARRAY_SIZE(fsys0_fixed_clks),
-	.nr_clk_ids		= FSYS0_NR_CLK,
+	.nr_clk_ids		= CLKS_NR_FSYS0,
 	.clk_regs		= fsys0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(fsys0_clk_regs),
 	.clk_name		= "dout_cmu_fsys0_shared1div4",
@@ -1136,7 +1145,7 @@ static const struct samsung_cmu_info fsys1_cmu_info __initconst = {
 	.nr_gate_clks		= ARRAY_SIZE(fsys1_gate_clks),
 	.fixed_clks		= fsys1_fixed_clks,
 	.nr_fixed_clks		= ARRAY_SIZE(fsys1_fixed_clks),
-	.nr_clk_ids		= FSYS1_NR_CLK,
+	.nr_clk_ids		= CLKS_NR_FSYS1,
 	.clk_regs		= fsys1_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(fsys1_clk_regs),
 	.clk_name		= "dout_cmu_fsys1_shared0div4",
@@ -1413,7 +1422,7 @@ static const struct samsung_cmu_info imem_cmu_info __initconst = {
 	.nr_div_clks		= ARRAY_SIZE(imem_div_clks),
 	.gate_clks		= imem_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(imem_gate_clks),
-	.nr_clk_ids		= IMEM_NR_CLK,
+	.nr_clk_ids		= CLKS_NR_IMEM,
 	.clk_regs		= imem_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(imem_clk_regs),
 };
@@ -1538,7 +1547,7 @@ static const struct samsung_cmu_info mfc_cmu_info __initconst = {
 	.nr_div_clks		= ARRAY_SIZE(mfc_div_clks),
 	.gate_clks		= mfc_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(mfc_gate_clks),
-	.nr_clk_ids		= MFC_NR_CLK,
+	.nr_clk_ids		= CLKS_NR_MFC,
 	.clk_regs		= mfc_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(mfc_clk_regs),
 };
@@ -1742,7 +1751,7 @@ static const struct samsung_cmu_info cam_csi_cmu_info __initconst = {
 	.nr_div_clks		= ARRAY_SIZE(cam_csi_div_clks),
 	.gate_clks		= cam_csi_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(cam_csi_gate_clks),
-	.nr_clk_ids		= CAM_CSI_NR_CLK,
+	.nr_clk_ids		= CLKS_NR_CAM_CSI,
 	.clk_regs		= cam_csi_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cam_csi_clk_regs),
 };
-- 
2.17.1

