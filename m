Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BBB19B5BE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722338195; cv=none; b=MAUA1uy6ydrYNjaBVpx1xn+gLCB48f9Q2YBz4rmG/pSMwu72Cxr71shL0sOuXKXSSr1me0wZmcXOhhSkAVXvNEKyFUCsLlpQtJflBguNRDZpKHf0ghMGMBTq9YIR98J8SWL5f1UteMgPpyTJWzZYAju4NYvEBCKvAtuKT/0YL0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722338195; c=relaxed/simple;
	bh=jRKXPpXuIZR840Ve52MM5Zd/L6ba4wjDiXJbsZBAX8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ZCDEh0olrguZzsaqhilNH3AV5xGZ/XV7idlD7YX8E3dHJoIOR+DAdXRa0jWw4yqob7NKdyKpdGoxM2KAgDoeuTJczSuKzVRAwFUcv1YR/Y/dfhpoVCbOgZRTN9sTzYkLxpWHfbtTdIBh22YBQWxyVbRFLeNg8B8q0QP6kFAII+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gT3X7ffK; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gT3X7ffK"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240730111630epoutp029dfd1ec9bf8512f831fa4a4737b45d10~m_XWNN5-s1693916939epoutp02G
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 11:16:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240730111630epoutp029dfd1ec9bf8512f831fa4a4737b45d10~m_XWNN5-s1693916939epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722338190;
	bh=cKzDSH0LDBzZD1sC/LZyTD3I6LFpcO9/DuWC8VFVnDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gT3X7ffKDgsfbRHGYqVBgDstzR5MooIW1jf4K83CeGWzu+8xi5zDWknfhXHledgA/
	 VySh59bI2YlwliA66Zf/GIYPyYdrTAeEeSMsvaC7sQNauGO1iB6Z6HRNdfkxscymho
	 oXLcgfSlN45oJYncl6aw6zp/k6VFnzXaF2sSUBU0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240730111630epcas1p2d714bc462a3f21451aa9a8d6f3533d54~m_XVoegP72738927389epcas1p2B;
	Tue, 30 Jul 2024 11:16:30 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.232]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WYCND5dHSz4x9Px; Tue, 30 Jul
	2024 11:16:28 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	25.54.09623.C8BC8A66; Tue, 30 Jul 2024 20:16:28 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240730111628epcas1p1148cf2853a9d2fc6decbd4ce50f23715~m_XT1856u1944719447epcas1p12;
	Tue, 30 Jul 2024 11:16:28 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240730111628epsmtrp2fae3d2a39eedcafde0630c62b860c589~m_XT1KD8e2441524415epsmtrp2S;
	Tue, 30 Jul 2024 11:16:28 +0000 (GMT)
X-AuditID: b6c32a36-15dfa70000002597-26-66a8cb8cced8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	EA.11.19367.C8BC8A66; Tue, 30 Jul 2024 20:16:28 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240730111627epsmtip1fe2a8c72bd60111cac1f0c4e3da4a88c~m_XTmvwmi0675706757epsmtip1d;
	Tue, 30 Jul 2024 11:16:27 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kwanghoon
	Son <k.son@samsung.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: exynosautov9: add dpum clock
Date: Tue, 30 Jul 2024 20:15:33 +0900
Message-Id: <20240730111535.135301-2-k.son@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240730111535.135301-1-k.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOJsWRmVeSWpSXmKPExsWy7bCmrm7P6RVpBgs/qVo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKtF75qrTBbnz29gt9j0+Bqrxceee6wWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLVrj+MDnwe72+0snvsnHWX3WPTqk42j81L6j36tqxi9Pi8SS6ALSrbJiM1MSW1SCE1
	Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoWCWFssScUqBQQGJxsZK+
	nU1RfmlJqkJGfnGJrVJqQUpOgWmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdkbLjnksBZeEKo7N
	ncTcwPiCr4uRk0NCwERiwdUzTF2MXBxCAjsYJaadmMcM4XxilHj+tI8Nzpn7/jUTTMvsLVug
	EjsZJQ43TmOEcL4wSvyefooFpIpNQF1iSdtadpCEiMBxRokzS7rBqpgFVjJKPFj1BKxKWMBD
	Ys6fp2BzWQRUJVY07GYFsXkFzCWurgSp4QDaJy+x+IEESJhTwEKi+dUxdogSQYmTMyHGMAOV
	NG+dDXa4hMBCDomXl06wQNzqInG19xkjhC0s8er4FnYIW0ri87u9bBB2tsTRjzB2icT1WYtY
	IWxjif1LJzOB3MAsoCmxfpc+xC4+iXdfe1ghTuOV6GgTgrnyVmc5RKOoxJmnH6EGekg8f94F
	DaxuRomLx/ewTmCUn4Xkg1lIPpiFsGwBI/MqRrHUguLc9NRiwwIjeLQm5+duYgSnWC2zHYyT
	3n7QO8TIxMF4iFGCg1lJhDf+ytI0Id6UxMqq1KL8+KLSnNTiQ4ymwOCdyCwlmpwPTPJ5JfGG
	JpYGJmZGxiYWhmaGSuK8Z66UpQoJpCeWpGanphakFsH0MXFwSjUw+fQzfDtx9nf3xYtFOvvU
	7Rk36zjJe/zIMPzM1pOupD/vw9W1CvGplctjsiOUOad/+XggxNF50fyPX/Q4D35Zd/1FenqN
	AVvmziWxXQZd63L3buMzKGJo/XrWZtbB1wpTWG4GGV61D4v431XL463xSqa+z45LKXy7u+OE
	6nh9gcWdh/LzmOUWuhm1hfZbdd+MU9wwO0OwV8pwobPfWg6WMo4FUr8f7f/eYcX3++26X9r5
	lj3fVDUe9nBsiXZhfKAbK7jvz/IdqgVeO/b1Vcmr6DkwPL6kPfnNJN8Kty15nGXHp8zifJOU
	OOfJA0//+LsMyha+ttydUdvmvai7v2nix6f1d6ed2S/59+vlxexKLMUZiYZazEXFiQBd6A5F
	OgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnG7P6RVpBpcncls8mLeNzWLN3nNM
	Fte/PGe1mH/kHKtF75qrTBbnz29gt9j0+Bqrxceee6wWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLVrj+MDnwe72+0snvsnHWX3WPTqk42j81L6j36tqxi9Pi8SS6ALYrLJiU1J7MstUjf
	LoEro2XHPJaCS0IVx+ZOYm5gfMHXxcjJISFgIjF7yxY2EFtIYDujxN0t8hBxUYmOy42MXYwc
	QLawxOHDxV2MXEAlnxglVjbeYQGpYRNQl1jStpYdJCEicJlR4v+CSYwgDrPAWkaJp1OesINU
	CQt4SMz585QJxGYRUJVY0bCbFcTmFTCXuLryCQvEBnmJxQ8kQMKcAhYSza+OsUMcZC6xYflR
	FohyQYmTM5+A2cxA5c1bZzNPYBSYhSQ1C0lqASPTKkbR1ILi3PTc5AJDveLE3OLSvHS95Pzc
	TYzgyNAK2sG4bP1fvUOMTByMhxglOJiVRHjjryxNE+JNSaysSi3Kjy8qzUktPsQozcGiJM6r
	nNOZIiSQnliSmp2aWpBaBJNl4uCUamByTT2VHHzk3cO/PuEc94SiLrZtOjVv95orXOdYq27p
	dXz+oZP9oM/z8Cm5/HmTtu/61xZYFNRkurj3hMaz2o1mvxt/cHSe4Wya+GjikeOZ6wSzngif
	Cl6fZ5/dviZwYh+b6jXnEznMHy0zOKJyDU91JtRe4Xn39P5NCZOf/3m/pp9xtvprosiW1ntp
	haJRn8TrWpcjoq2Tzv/dfaJcV/1Ix9l0va1tdgvPpurKH7qqIeCrbGAQozt1a+oXB6+iaFFJ
	y38vAkW2tsfJ7D7yL27+PF4Lp+a6hB+flbxfXBJll/nw95PCUpGd9yN8BJ/f9T057cbPjQtm
	1zBbfv1RdEHs3xvxB7PnqSZZOS7pDI9TYinOSDTUYi4qTgQANskmZPsCAAA=
X-CMS-MailID: 20240730111628epcas1p1148cf2853a9d2fc6decbd4ce50f23715
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730111628epcas1p1148cf2853a9d2fc6decbd4ce50f23715
References: <20240730111535.135301-1-k.son@samsung.com>
	<CGME20240730111628epcas1p1148cf2853a9d2fc6decbd4ce50f23715@epcas1p1.samsung.com>

Add dpum clock definitions and compatibles.

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 .../clock/samsung,exynosautov9-clock.yaml     | 19 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynosautov9.h  | 11 +++++++++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
index 55c4f94a14d1..9c8041fc9d4b 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -35,6 +35,7 @@ properties:
       - samsung,exynosautov9-cmu-top
       - samsung,exynosautov9-cmu-busmc
       - samsung,exynosautov9-cmu-core
+      - samsung,exynosautov9-cmu-dpum
       - samsung,exynosautov9-cmu-fsys0
       - samsung,exynosautov9-cmu-fsys1
       - samsung,exynosautov9-cmu-fsys2
@@ -109,6 +110,24 @@ allOf:
             - const: oscclk
             - const: dout_clkcmu_core_bus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-dpum
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_DPUM bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_dpum_bus
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
index 3065375c2d8b..ce8fb8f7d718 100644
--- a/include/dt-bindings/clock/samsung,exynosautov9.h
+++ b/include/dt-bindings/clock/samsung,exynosautov9.h
@@ -179,6 +179,17 @@
 #define CLK_GOUT_CORE_CCI_PCLK		4
 #define CLK_GOUT_CORE_CMU_CORE_PCLK	5
 
+/* CMU_DPUM */
+#define CLK_MOUT_DPUM_BUS_USER		1
+#define CLK_DOUT_DPUM_BUSP		2
+#define CLK_GOUT_DPUM_ACLK_DECON	3
+#define CLK_GOUT_DPUM_ACLK_DMA		4
+#define CLK_GOUT_DPUM_ACLK_DPP		5
+#define CLK_GOUT_DPUM_SYSMMU_D0_CLK	6
+#define CLK_GOUT_DPUM_SYSMMU_D1_CLK	7
+#define CLK_GOUT_DPUM_SYSMMU_D2_CLK	8
+#define CLK_GOUT_DPUM_SYSMMU_D3_CLK	9
+
 /* CMU_FSYS0 */
 #define CLK_MOUT_FSYS0_BUS_USER		1
 #define CLK_MOUT_FSYS0_PCIE_USER	2
-- 
2.39.2

