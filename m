Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8BF15DBB6
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Sep 2024 10:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569211; cv=none; b=iicAgnhO+d45f34yMt0KEOEbxo23NNRXiML2aikyXqtf7GjpKAwgGBbtR8SPckxobYzH2eVXswIIMSxFY7IRgTqQAn5e+Nxwn992TXE6P6vswhNqXJ1txpjq1dvFYUhScRr0HvAmZzpB9+8KXx/fOaSBLCPYokwL0Yt18X45kFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569211; c=relaxed/simple;
	bh=NS4JKzKVxspF8P2blv2VOJy54b/R7elFa4JhUBB0zLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=az4RvRqU2t5VgLctKdXa77uriaJYRPLfssBQXHzF4bi4ElhyjlrV1ED1WPdU/oxTmk8TmkHM6Uyz1AyY+7jYnFACFiYGmME4Go9GF4rneOvvUS71UrjAvfhn6FLurLXbHN6Cjoff13Iv8C9XrPZhbW6Xrx+IL2hoC2QQnJjOdyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lp7nZbBO; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lp7nZbBO"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240917103326epoutp0113008a7f81fe51714ef61a92971cfe6a~2AYvFQLhP0267902679epoutp01F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Sep 2024 10:33:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240917103326epoutp0113008a7f81fe51714ef61a92971cfe6a~2AYvFQLhP0267902679epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726569207;
	bh=omlAUJcYSDtfBF+fFFayMl3M3ZyrxNAR16fqS6MpTUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lp7nZbBO6BO7OzxL1VHV9kAzq3FNqOglA8C7GdJ/PcRrykWu49yoiZVjbV7WFGktc
	 6Df3wBwc2bxyZPs7ChlNaqrVie6JHV8HBDT9H5Z9Scl8TXMhiQU2RxUQx+CuLGKUyp
	 zJCx0UQXSXS5uRoihGRgPChWFYUn/vi2E2lxH/q8=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240917103326epcas5p144f788b7b03455e69c5762da06b69fd2~2AYujw1G62495824958epcas5p13;
	Tue, 17 Sep 2024 10:33:26 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4X7J5t1pSnz4x9Pv; Tue, 17 Sep
	2024 10:33:22 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	15.FF.08855.2FA59E66; Tue, 17 Sep 2024 19:33:22 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20240917094454epcas5p22a75e3bb5a09b12eb269f1dcde573741~1-uWiMP0h1073910739epcas5p2N;
	Tue, 17 Sep 2024 09:44:54 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240917094454epsmtrp140534f551d8d5ed58ad34bc04cbd7fa3~1-uWgGGn42453424534epsmtrp10;
	Tue, 17 Sep 2024 09:44:54 +0000 (GMT)
X-AuditID: b6c32a44-107ff70000002297-c8-66e95af20b1f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	26.C4.19367.69F49E66; Tue, 17 Sep 2024 18:44:54 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240917094452epsmtip16146db8d027b6c51417cc96143e79deb~1-uUbSUAH2415624156epsmtip1a;
	Tue, 17 Sep 2024 09:44:52 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: pankaj.dubey@samsung.com, gost.dev@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH 2/2] dt-bindings: clock: samsung: remove define with number
 of clocks for FSD
Date: Tue, 17 Sep 2024 15:13:55 +0530
Message-Id: <20240917094355.37887-3-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240917094355.37887-1-inbaraj.e@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdlhTU/dT1Ms0g5bnbBYP5m1js1iz9xyT
	xfUvz1kt5h85x2px88BOJou7fyaxWZw/v4Hd4mPPPVaLy7vmsFnMOL+PyeLiKVeLRVu/sFv8
	37OD3eLwm3ZWi3/XNrI48Hu8v9HK7rFpVSebR9+WVYwenzfJBbBEZdtkpCampBYppOYl56dk
	5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAB2qpFCWmFMKFApILC5W0rezKcov
	LUlVyMgvLrFVSi1IySkwKdArTswtLs1L18tLLbEyNDAwMgUqTMjOeP67nbFgt0DFtQ1HWBsY
	9/J2MXJySAiYSJy70cfcxcjFISSwm1FizpqlbBDOJ0aJTeufMcM53b9OM8K0LGt8xwZiCwns
	ZJTo2M8HUdTKJNGzYSdYEZuAusSG7u9go0QE1jBJrJ59ghUkwSwQLnFu+kUwW1ggXuLb3yvM
	IDaLgKrErckvwWxeASuJt79fMENsk5dYveEAmM0pYC3x7udvsJMkBL6yS9zY1swOUeQiMbd7
	G9R5whKvjm+BiktJvOxvg7J9JPbP+QVVkyFxbPtyVgjbXuLAlTksXYwcQMdpSqzfpQ8RlpWY
	emodE8TNfBK9v58wQcR5JXbMg7GVJWYeuc8GYUtK7Ly8E2yMhICHxIFeY0ig9DFKfH23g3kC
	o9wshA0LGBlXMUqmFhTnpqcmmxYY5qWWw2MtOT93EyM4MWq57GC8Mf+f3iFGJg7GQ4wSHMxK
	Iry2v5+mCfGmJFZWpRblxxeV5qQWH2I0BYbfRGYp0eR8YGrOK4k3NLE0MDEzMzOxNDYzVBLn
	fd06N0VIID2xJDU7NbUgtQimj4mDU6qBid/u3bZunk+Hl32/GbXniPy/mK/F9fZOLTYab78e
	OjGjOCfb5e/r+2uVrs+1PBWrsf7tpDc94lmM6bxf2CSOFrReXhC9Pdf1R6n+1YU8C5tn+Og9
	X3FSRnzTCzWW35Ve4Wy1PI4v9ZM0FybqK69cUmqiyK1r1JNvtJeD7eDG3f7xa/SrT+3dZJ0/
	86pEpORDn1V3diu3FDk1ZNiZbePpdgwwPZIlmaHz8FfFvhVb4u396yamJea8+Ni277pq5JGp
	08LT8q/2ui9b/ptzaVck50fNa/Va6Zrxyucm7JqfJ8km1H22NuDv+mceIXJXTMPvlhdUf1zz
	4/dG+/osq/xcweMGbv+0Dwl+j/2b7NqpxFKckWioxVxUnAgA+0cSHxUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsWy7bCSnO40/5dpBpvf8lo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvFzQM7mSzu/pnEZnH+/AZ2i48991gtLu+aw2Yx4/w+JouLp1wtFm39wm7x
	f88OdovDb9pZLf5d28jiwO/x/kYru8emVZ1sHn1bVjF6fN4kF8ASxWWTkpqTWZZapG+XwJXx
	/Hc7Y8FugYprG46wNjDu5e1i5OSQEDCRWNb4jg3EFhLYziixcE0aRFxSYvbv6ewQtrDEyn/P
	gWwuoJpmJonmzYdZQBJsAuoSG7q/s4EkRAR2MUlMX7ydESTBLBAp8aN9K1i3sECsxJ0/PWA2
	i4CqxK3JL5lBbF4BK4m3v18wQ2yQl1i94QCYzSlgLfHu529miIusJHr2zWOewMi3gJFhFaNo
	akFxbnpucoGhXnFibnFpXrpecn7uJkZwyGoF7WBctv6v3iFGJg7GQ4wSHMxKIry2v5+mCfGm
	JFZWpRblxxeV5qQWH2KU5mBREudVzulMERJITyxJzU5NLUgtgskycXBKNTCZl2mvTZaz4rjy
	TdN3ffaVGzKT0p9ZuSrMjrT0jFig/aul+u7231H3Wbbp2fvvfdOaGaz2ULjj7fv/OVvXTpea
	9OBJyomZh05bzvbPnn538/aG86VJe8/PunAhVsG9artQtuDmKbwni9xW/ku1nuwftGLOvhXR
	eUFJde4zpC/kRQYFJ+sleq/9v5mNL+WC/tY974+k7JHTT+i+vv5H4kWfnDq+Davcm7TWtOyw
	Pxov+XZ2Er9Kx+pzzz7de6f49QJPTXuu95GDoZGu6keifVbd/pX+SLS3QuVxgHiRWGHErg3L
	c6bN5nvF7MrF8TxD9+KimlMnGLb7rfx4NGX3fVP/NInwsEePtY0Dzpt8EzugxFKckWioxVxU
	nAgAm3Rj18gCAAA=
X-CMS-MailID: 20240917094454epcas5p22a75e3bb5a09b12eb269f1dcde573741
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240917094454epcas5p22a75e3bb5a09b12eb269f1dcde573741
References: <20240917094355.37887-1-inbaraj.e@samsung.com>
	<CGME20240917094454epcas5p22a75e3bb5a09b12eb269f1dcde573741@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Number of clocks supported by Linux drivers might vary - sometimes we
add new clocks, not exposed previously.  Therefore these numbers of
clocks should not be in the bindings, as that prevents changing them.
Remove it entirely from the bindings, once Linux drivers stopped using
them.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 include/dt-bindings/clock/fsd-clk.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/dt-bindings/clock/fsd-clk.h b/include/dt-bindings/clock/fsd-clk.h
index c8a2af1dd1ad..3f7b64d93558 100644
--- a/include/dt-bindings/clock/fsd-clk.h
+++ b/include/dt-bindings/clock/fsd-clk.h
@@ -28,7 +28,6 @@
 #define DOUT_CMU_IMEM_ACLK			13
 #define DOUT_CMU_IMEM_DMACLK			14
 #define GAT_CMU_FSYS0_SHARED0DIV4		15
-#define CMU_NR_CLK				16
 
 /* PERIC */
 #define PERIC_SCLK_UART0			1
@@ -76,7 +75,6 @@
 #define PERIC_EQOS_PHYRXCLK_MUX			43
 #define PERIC_EQOS_PHYRXCLK			44
 #define PERIC_DOUT_RGMII_CLK			45
-#define PERIC_NR_CLK				46
 
 /* FSYS0 */
 #define UFS0_MPHY_REFCLK_IXTAL24		1
@@ -101,7 +99,6 @@
 #define FSYS0_EQOS_TOP0_IPCLKPORT_RGMII_CLK_I	20
 #define FSYS0_EQOS_TOP0_IPCLKPORT_CLK_RX_I	21
 #define FSYS0_DOUT_FSYS0_PERIBUS_GRP		22
-#define FSYS0_NR_CLK				23
 
 /* FSYS1 */
 #define PCIE_LINK0_IPCLKPORT_DBI_ACLK		1
@@ -112,7 +109,6 @@
 #define PCIE_LINK1_IPCLKPORT_AUX_ACLK		6
 #define PCIE_LINK1_IPCLKPORT_MSTR_ACLK		7
 #define PCIE_LINK1_IPCLKPORT_SLV_ACLK		8
-#define FSYS1_NR_CLK				9
 
 /* IMEM */
 #define IMEM_DMA0_IPCLKPORT_ACLK		1
@@ -126,11 +122,9 @@
 #define IMEM_TMU_TOP_IPCLKPORT_I_CLK_TS		9
 #define IMEM_TMU_GPU_IPCLKPORT_I_CLK_TS		10
 #define IMEM_TMU_GT_IPCLKPORT_I_CLK_TS		11
-#define IMEM_NR_CLK				12
 
 /* MFC */
 #define MFC_MFC_IPCLKPORT_ACLK			1
-#define MFC_NR_CLK				2
 
 /* CAM_CSI */
 #define CAM_CSI0_0_IPCLKPORT_I_ACLK		1
@@ -145,6 +139,5 @@
 #define CAM_CSI2_1_IPCLKPORT_I_ACLK		10
 #define CAM_CSI2_2_IPCLKPORT_I_ACLK		11
 #define CAM_CSI2_3_IPCLKPORT_I_ACLK		12
-#define CAM_CSI_NR_CLK				13
 
 #endif /*_DT_BINDINGS_CLOCK_FSD_H */
-- 
2.17.1

