Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FD181AC3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 04:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722227470; cv=none; b=dI4iXfSQpzpZxo+3R9h7rt6Ts1R1TiJOvjjEwLC6fHbpd84CJUOL28ubs3xSfHxVWm9FyE5sc75l7NhhyPXqIBjn5dVP2H1WNcZ1KcJHAjHs/7NnmAou6cfvfExHR64BlvbjCUXb/zbrh0u6G+EXD2metO4cFktNEMZL/KimTsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722227470; c=relaxed/simple;
	bh=hC2WQxH/kBum7QbSDLq1q79vdrRz/CgFdhb2ErII8PA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Iq+eATcRttHtlG0qKMui6cENlJw5l9fVzo230uwdEnMbJo9P0Gq935iDyJgjbwqM74MBAdinzH7tfgzh2X9YdQewTcIvGCu0HHWhuBXyOJWwIa/mnnnCU7NkSCbxo7Lj+Nz3qFsRoXh5WWymzXym3Dl4AHsNIstUs80XNNvgacM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=u0665DWJ; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="u0665DWJ"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240729043106epoutp015d23682667258f9173ffbf00f9637019~mlMGB5RFY1452214522epoutp01o
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 04:31:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240729043106epoutp015d23682667258f9173ffbf00f9637019~mlMGB5RFY1452214522epoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722227466;
	bh=vpkkOKK/ntAcFPtUcCigR63OTKRjKSJ28xLqzzoImfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u0665DWJB6ybXBrH5l6XvR22FiIWgH/vhKdbITVj74JK7NbZP3BvURM/xaJcvef50
	 iBaPGFQQ3AZGg9GISUbTz6C0AsGgRP/ozcJ/9hrtHimkiUhWOLP6h83UVSI4VdRwZG
	 EiKg9d3iusxMC7+krs/VlQcba8rlP7M/R9che4ZU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20240729043105epcas1p4c4d850c3f3647dd06c5eb5cfee4dc21f~mlMFg_MaR2159921599epcas1p48;
	Mon, 29 Jul 2024 04:31:05 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.235]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WXQQw2GFmz4x9QK; Mon, 29 Jul
	2024 04:31:04 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	96.D2.08992.70B17A66; Mon, 29 Jul 2024 13:31:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240729043102epcas1p2b76fdeec2c06b8bf799ec397efbaa184~mlMCcFET_1414414144epcas1p2R;
	Mon, 29 Jul 2024 04:31:02 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240729043102epsmtrp11adccf5a78503a0018acadcf63211691~mlMCadVHX0723007230epsmtrp1U;
	Mon, 29 Jul 2024 04:31:02 +0000 (GMT)
X-AuditID: b6c32a33-70bff70000002320-d1-66a71b07c2c2
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	28.F5.07567.60B17A66; Mon, 29 Jul 2024 13:31:02 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240729043102epsmtip1b4e72e7bfb18ec73792e9cf16791904b~mlMCA5Bwp1887518875epsmtip1F;
	Mon, 29 Jul 2024 04:31:02 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kwanghoon
	Son <k.son@samsung.com>
Subject: [PATCH 3/4] arm64: dts: exynosautov9: add dpum clock DT nodes
Date: Mon, 29 Jul 2024 13:30:38 +0900
Message-Id: <20240729043039.134435-4-k.son@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729043039.134435-1-k.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmri679PI0g779phYP5m1js1iz9xyT
	xfUvz1kt5h85x2rRu+Yqk8X58xvYLTY9vsZq8bHnHqvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksVi16w+jA5/H+xut7B47Z91l99i0qpPNY/OSeo++LasYPT5vkgtgi8q2yUhNTEktUkjN
	S85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAE6VkmhLDGnFCgUkFhcrKRv
	Z1OUX1qSqpCRX1xiq5RakJJTYFqgV5yYW1yal66Xl1piZWhgYGQKVJiQnbHqVEjBbfaKd523
	WBoYV7N1MXJySAiYSKxbN5u5i5GLQ0hgB6PEkc3LWSGcT4wSN6fOZoJwvjFKXNp8gbGLkQOs
	ZeukcpBuIYG9jBIvD2ZC1HxhlNi/7TgjSIJNQF1iSdtadpCEiMBxRokzS7oZQRxmgZWMEg9W
	PWEBqRIWcJO4+GYNE4jNIqAq0dVzAKybV8Bc4tyzY1Db5CUWP5AACXMKWEh0/ZvIDFEiKHFy
	JsQYZqCS5q0QP0gILOWQmPJpBzPEcy4S3yftZYewhSVeHd8CZUtJvOxvg7KzJY5+3AsNjBKJ
	67MWsULYxhL7l05mArmBWUBTYv0ufYhdfBLvvvawQpzGK9HRJgRz5a3OcohGUYkzTz9CDfSQ
	WDd1KjskfLoZJc4fPcQ2gVF+FpIPZiH5YBbCsgWMzKsYxVILinPTU5MNCwzhcZqcn7uJEZxc
	tYx3MF6e/0/vECMTB+MhRgkOZiUR3vgrS9OEeFMSK6tSi/Lji0pzUosPMZoCg3cis5Rocj4w
	veeVxBuaWBqYmBkZm1gYmhkqifOeuVKWKiSQnliSmp2aWpBaBNPHxMEp1cBUYfJkwYzWHS9q
	FiUWu3X9/Gazw3IOn8UEnajOZQdjO7/yT9wZKte76eWijap39wdtOnHrRfGu2Pf/IoMdqpP7
	op7LZhZLnlp0oM2+3JH1i9ShPIeDWtynWvLPBjYy+P/Ykbax55To3mdXym49b2JJDfhxw/dl
	5a7pQRueruj93rpE02fKtGVa37J9hC9NkPB1VlJwMt/r1uUQGi5zZfHqSZM9TnRZduqGZkxj
	e7i0fuvvridnJtV6Hsqz+JRSNjHmf0nF7wbV5tb+1bOLL01cveiV7UHb9MW7T/f7KslvZ+VR
	3L3MeuNGbaG/IvyHv57L2jX/i2Xscc7+pwEiyqlTf1cvuZQgzsSv1Htj1f94JZbijERDLeai
	4kQAiEnQfTcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnC6b9PI0g+4uYYsH87axWazZe47J
	4vqX56wW84+cY7XoXXOVyeL8+Q3sFpseX2O1+Nhzj9Vixvl9TBYXT7la/N+zg93i8Jt2Vot/
	1zayWKza9YfRgc/j/Y1Wdo+ds+6ye2xa1cnmsXlJvUffllWMHp83yQWwRXHZpKTmZJalFunb
	JXBlrDoVUnCbveJd5y2WBsbVbF2MHBwSAiYSWyeVdzFycggJ7GaU6LooD2JLCIhKdFxuZIQo
	EZY4fLi4i5ELqOQTo8SLSd/ZQGrYBNQllrStZQdJiAhcZpT4v2ASI4jDLLCWUeLplCfsIFXC
	Am4SF9+sYQKxWQRUJbp6DjCC2LwC5hLnnh2D2iAvsfiBBEiYU8BCouvfRGaIg8wl7l+dwAZR
	LihxcuYTFhCbGai8eets5gmMArOQpGYhSS1gZFrFKJlaUJybnptsWGCYl1quV5yYW1yal66X
	nJ+7iREcHVoaOxjvzf+nd4iRiYPxEKMEB7OSCG/8laVpQrwpiZVVqUX58UWlOanFhxilOViU
	xHkNZ8xOERJITyxJzU5NLUgtgskycXBKNTCpWTcWfN2Yx6fTnfs10zZWd2UGj8ppFr91scqv
	0lfYCh9pntrJurbZ7UXCloXhmx0PmFVuLNsuX3TBeJFa72nGHYo583r9Dl4SeWj/aK/fZ537
	10/9nTg/qdzqmN1t1a9ZRzcbp9np/207tdRzt43rTE7PZiG+8OD3zIcvnbp53EKVozVmqWAp
	96XjO2KDOjWXmOf831jW9WLa3dshX469SFHj/sPtmD/5udtM6+1ePC35jDOuxL25se5/V1F8
	2/Wgr2G/nRqSv+8J/6llK37mxvk7XL0lTJd8Woq6eyYvz7V/HpsbbSNQuf+9dJTYW5H9h3zs
	eSc6l5eKO7102VfOeeN3/ESmudtuHEhZkaTEUpyRaKjFXFScCACHNGAq/QIAAA==
X-CMS-MailID: 20240729043102epcas1p2b76fdeec2c06b8bf799ec397efbaa184
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240729043102epcas1p2b76fdeec2c06b8bf799ec397efbaa184
References: <20240729043039.134435-1-k.son@samsung.com>
	<CGME20240729043102epcas1p2b76fdeec2c06b8bf799ec397efbaa184@epcas1p2.samsung.com>

Add dpum clock for sysmmu, dpu.

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 0248329da49a..a8e57f499fec 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -251,6 +251,17 @@ cmu_fsys2: clock-controller@17c00000 {
 				      "dout_fsys2_clkcmu_ethernet";
 		};
 
+		cmu_dpum: clock-controller@18c00000 {
+			compatible = "samsung,exynosautov9-cmu-dpum";
+			reg = <0x18c00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_DPUM_BUS>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_dpum_bus";
+		};
+
 		cmu_core: clock-controller@1b030000 {
 			compatible = "samsung,exynosautov9-cmu-core";
 			reg = <0x1b030000 0x8000>;
-- 
2.39.2

