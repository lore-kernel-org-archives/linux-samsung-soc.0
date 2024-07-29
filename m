Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0788062A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722227471; cv=none; b=DxlRKdNiGAbSNbEHV42DJddPUsUzzde4O0FqnBX7Qjo1ws7qW50kngWauoiH+l8SB1IDgupEHbSjT4J8cN2NwU7lpVnOf9/Fw4FPMCihjgEEq/tYSoPMcOvqJOJkM0F1JUNal959obfv4k41qWitQa77VtcU1lQh6NDiMcYYT/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722227471; c=relaxed/simple;
	bh=w6Pgs5gLogCcB6IWJehDLpbfgBvPBIH0HAh39kzQaVI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=HVcYgixRBk5Gzfa8kIhFTfbGXH6ljpOeSr4TmgvP7pgQzHOPY+bJp0aKyDL+upmFLH+mMleEpWnznhscUSafgtxhAD+tU3gP7zLl2iW8Gm47vHZVFfo8isFjd96b+9KM5Iw+xGKysNEdU7136raLC57T4klisUkQePmX73Yihzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jgdGNOZc; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jgdGNOZc"
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240729043105epoutp014a1c53a55ed7f0294ba47691f4212586~mlMFAoIws1502515025epoutp01G
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 04:31:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240729043105epoutp014a1c53a55ed7f0294ba47691f4212586~mlMFAoIws1502515025epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722227465;
	bh=xGQ8EoTVk/rXaxP4zGuS3xITYIKHjHZ1+jWJVsSjs4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jgdGNOZcPGDjoARoO2w7gTxyLhEO6rmacYz88TlYPZh22bVh+/uELEiz8GZCpJNHf
	 /ebdbIcQU7Tj7RQ5CFESLgY0RI+FxVoIca8126o+MSNG20W9z/FILTpOuBvp04TrhT
	 9onqeuz8CwGQjNFkoIAPxvjjWwlpMsLzL1/F6l48=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20240729043104epcas1p489fce0d35f19d25215fca90ffff9ed95~mlMD-8B8k1911819118epcas1p4C;
	Mon, 29 Jul 2024 04:31:04 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.136]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WXQQt6DlHz4x9QC; Mon, 29 Jul
	2024 04:31:02 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	A9.0B.09623.60B17A66; Mon, 29 Jul 2024 13:31:02 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20240729043102epcas1p3f5f6421b6899673256c7548db3333d6e~mlMB-W5J00326403264epcas1p3g;
	Mon, 29 Jul 2024 04:31:02 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240729043101epsmtrp28cc7c8b4e1d81eeacf01f27d11d0cd01~mlMB9k0Wx1027510275epsmtrp2V;
	Mon, 29 Jul 2024 04:31:01 +0000 (GMT)
X-AuditID: b6c32a36-15dfa70000002597-ae-66a71b0682f5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	17.24.19367.50B17A66; Mon, 29 Jul 2024 13:31:01 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240729043101epsmtip1aadfe75563db54f1f5bd6c2a7d6ed9dd~mlMBnT_WU1808918089epsmtip1-;
	Mon, 29 Jul 2024 04:31:01 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kwanghoon
	Son <k.son@samsung.com>
Subject: [PATCH 1/4] dt-bindings: clk: exynosautov9: add dpum clock
 definitions
Date: Mon, 29 Jul 2024 13:30:36 +0900
Message-Id: <20240729043039.134435-2-k.son@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729043039.134435-1-k.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOJsWRmVeSWpSXmKPExsWy7bCmgS6b9PI0g6MrDSwezNvGZrFm7zkm
	i+tfnrNazD9yjtWid81VJovz5zewW2x6fI3V4mPPPVaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYrFq1x9GBz6P9zda2T12zrrL7rFpVSebx+Yl9R59W1YxenzeJBfAFpVtk5GamJJapJCa
	l5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0rJJCWWJOKVAoILG4WEnf
	zqYov7QkVSEjv7jEVim1ICWnwLRArzgxt7g0L10vL7XEytDAwMgUqDAhO+NZfytbwV/2ikuP
	utgaGH+ydTFyckgImEi8PXaJtYuRi0NIYAejxP/9H1ggnE+MEt2dcxnhnC9Xr7HCtMxb2ccM
	kdjJKNFybTtUyxdGibaz65lBqtgE1CWWtK1lB0mICBxnlDizpBtsFrPASkaJB6uesIBUCQsE
	Sqw+egZsLouAqsSu+XeZQGxeAXOJR6fnAE3iANonL7H4gQRImFPAQqLr30RmiBJBiZMzIcYw
	A5U0b50NdpKEwEIOiftrJ0G95yLx/fUeKFtY4tXxLewQtpTE53d7oeLZEkc/wtglEtdnLYL6
	01hi/9LJTCA3MAtoSqzfpQ+xi0/i3dceVojTeCU62oRgrrzVWQ7RKCpx5ulHqIEeEr1X1jJB
	wqebUeLcpUssExjlZyH5YBaSD2YhLFvAyLyKUSy1oDg3PbXYsMAIHq3J+bmbGMEpVstsB+Ok
	tx/0DjEycTAeYpTgYFYS4Y2/sjRNiDclsbIqtSg/vqg0J7X4EKMpMHgnMkuJJucDk3xeSbyh
	iaWBiZmRsYmFoZmhkjjvmStlqUIC6YklqdmpqQWpRTB9TBycUg1MTC+PZbW7Gj25NmtyjFzW
	LJ7bVdOkt89u/fRUX90x+NRuAydb69TAMNfrifxu52Sdnlp8DuPaOyMldLva3uBlk16GFV6Y
	2v345LWFq6Mcmx9aHXxr/nfr9r4ddpGa/e/CV78++WCmT+9sV9k/PYZSyb9j/aszdyfyXtIz
	yfU+YN9y43lB1Z/vfg/F9tqv08z+bSL85S+7sd2yBvYne0JmHd0ae/G0P4NO6AZvx2mtiy6a
	W32748gdZpkaEjLjyG/1NSuuv1s1IdEo2HG5XnqquuC2D2rSk+0OHT/3d3nHVO//n49v0Ome
	zHU4sjBFxUlIwvSX/tTchU1ztjZJNOXOM/rvNOHyibjOE683hwbFKbEUZyQaajEXFScCAB2B
	L7s6BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSnC6r9PI0g5MNphYP5m1js1iz9xyT
	xfUvz1kt5h85x2rRu+Yqk8X58xvYLTY9vsZq8bHnHqvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksVi16w+jA5/H+xut7B47Z91l99i0qpPNY/OSeo++LasYPT5vkgtgi+KySUnNySxLLdK3
	S+DKeNbfylbwl73i0qMutgbGn2xdjJwcEgImEvNW9jF3MXJxCAlsZ5R43POeGSIhKtFxuZGx
	i5EDyBaWOHy4GKLmE6PEo3eb2EFq2ATUJZa0rWUHSYgIXGaU+L9gEiOIwyywllHi6ZQnYFXC
	Av4Svyc+AlvHIqAqsWv+XSYQm1fAXOLR6TnMEBvkJRY/kAAJcwpYSHT9mwh2hBBQyf2rE9gg
	ygUlTs58wgJiMwOVN2+dzTyBUWAWktQsJKkFjEyrGEVTC4pz03OTCwz1ihNzi0vz0vWS83M3
	MYJjQytoB+Oy9X/1DjEycTAeYpTgYFYS4Y2/sjRNiDclsbIqtSg/vqg0J7X4EKM0B4uSOK9y
	TmeKkEB6YklqdmpqQWoRTJaJg1OqgalnX5vpy+IFjsc3X0nb0Xx+uVtCT/fxRGfdkIVrp/vG
	Msb8aTo64eVJm/Dliua1ygr7M1mZY+c9V7PancN6+5q4sEPu7t412/eqvO/WuXuZIef1TJnk
	uH8/L58wX57nbP35fvxh16d/7snZpTxgnv21qcfgsfy3GfsuX94e+swnnJ9jw+nDF3hCE5fH
	ZAXPPSzDLLbfsmWT0OfKuo3Lp+44cm5dsdD8xL/rJ297e50vcI3SWe0XXlm9Ib+Fsj8pKzj6
	LtE495r3wSfV5xKzeFR8X5iGn5q9s0gq4NiVoMPzpX0zvjWzT0htm7n2i47VtjOcVY6ygbrb
	o+VE/8nyZN9tqRC93SGg7PO4/etHHQ0lluKMREMt5qLiRAAlahVe/AIAAA==
X-CMS-MailID: 20240729043102epcas1p3f5f6421b6899673256c7548db3333d6e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240729043102epcas1p3f5f6421b6899673256c7548db3333d6e
References: <20240729043039.134435-1-k.son@samsung.com>
	<CGME20240729043102epcas1p3f5f6421b6899673256c7548db3333d6e@epcas1p3.samsung.com>

Add dpum clk definitions.

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 include/dt-bindings/clock/samsung,exynosautov9.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

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

