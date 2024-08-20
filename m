Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166CA158556
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139926; cv=none; b=OrrUMz+zwnhclk0yaMtx3muyGMXVGWCdXRpFaE+aMXY+j0B7+dvWnqpSMICqIjEVLngz/C0dFOJlNUKhL/4R9vYSOOSF4G0vyXFWNTdNUKlTWch5yXclzDWjUSpMbbv1LbQuSeNOfDoFBKRfuJoIDmfXjTG+IIB6zxQqyfvOkGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139926; c=relaxed/simple;
	bh=KE8BoYshCk1fFOfVsKW171RrGOGUeG+T6nx/TE6WONQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=PgtVEOfr+FEPI5YCS+VDISH9qcGzBMQOPCZeujaj8D6g3oltpr/MD5cHWg6JJ++JjrbvF+zGW4pwJbyPvIhKiJYRssoCCqCVL2VCRcU//1uu94YocicWjWdumioumOcr0/AnMokU1jQiqve/N2O5TxZ0UMe7I9IllF/gND/8EeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=srTrmRoC; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="srTrmRoC"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240820074521epoutp038f3bdde85825590abf7c0d5e11295674~tYB_YdkFP2016020160epoutp03i
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:45:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240820074521epoutp038f3bdde85825590abf7c0d5e11295674~tYB_YdkFP2016020160epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724139921;
	bh=FksUhq55h7VTsDe1ORbK1oeAEBL8Jl4PE094YZg2ymM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=srTrmRoCq+VK9PUuFW/gvbAAs2ZB2ekHJnryB7wXuaaenKQ2SmqkXQ7nEha/PPET/
	 3lL0gsFbkSBTZTZYLR9R44ot5faxjQ0THffUUT4h3Hl7s2/LZBAN8YOlh0eBFlifW5
	 4Gex/dYNzPmOON1yUCDGpfBwLcYlHcAyWpNqdmlY=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240820074520epcas2p36e05c1dbb9b28ee757fb44bed4e76ec0~tYB95CF6_2616826168epcas2p3L;
	Tue, 20 Aug 2024 07:45:20 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.89]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Wp1hw2Bn1z4x9Pv; Tue, 20 Aug
	2024 07:45:20 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	6B.39.10012.09944C66; Tue, 20 Aug 2024 16:45:20 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240820074519epcas2p4c505aa89aa9d325828fde24f65b24037~tYB9Jye4I1112511125epcas2p4G;
	Tue, 20 Aug 2024 07:45:19 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240820074519epsmtrp1f98dadc22484edf188ff6f7b348f874d~tYB9Iupr00720407204epsmtrp19;
	Tue, 20 Aug 2024 07:45:19 +0000 (GMT)
X-AuditID: b6c32a47-ea1fa7000000271c-63-66c449909b24
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F6.B1.08456.F8944C66; Tue, 20 Aug 2024 16:45:19 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240820074519epsmtip2572eb96837a3683d93afb2de1e6ca84a~tYB854n6a2557725577epsmtip2y;
	Tue, 20 Aug 2024 07:45:19 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v7 0/5] initial clock support for exynosauto v920 SoC
Date: Tue, 20 Aug 2024 16:45:09 +0900
Message-ID: <20240820074514.3123767-1-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIJsWRmVeSWpSXmKPExsWy7bCmqe4EzyNpBhuO8lg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM6Y1fOApeCHQEXL5Da2BsZ5
	vF2MnBwSAiYSFw4fZO1i5OIQEtjBKLFj4jNmCOcTo0Tv8aesIFVCAt8YJa68YYTpOH7zLVTR
	XkaJ2RvPQjkfGSVeLDrP0sXIwcEmoCvx558DSFxEYA+TxJbzS5hAHGaBs4wSd+csYAcZJSzg
	KjHjyA9mEJtFQFXiYvMRFhCbV8Be4mDLDTaIdfISF9c8Z4OIC0qcnPkErIYZKN68dTbYZgmB
	Rg6J9mP/mCAaXCR2718CZQtLvDq+hR3ClpJ42d8GZedLTL7+lgmiuYFR4tq/bmaIhL3EojM/
	2UFeYBbQlFi/Sx/ElBBQljhyC2ovn0TH4b/sEGFeiY42IYhGNYlPVy5DDZGROHbiGZTtIfHl
	1T1mSCjGSkzof8oygVF+FpJvZiH5ZhbC3gWMzKsYxVILinPTU4uNCozhsZqcn7uJEZxWtdx3
	MM54+0HvECMTB+MhRgkOZiUR3u6XB9OEeFMSK6tSi/Lji0pzUosPMZoCw3cis5Rocj4wseeV
	xBuaWBqYmJkZmhuZGpgrifPea52bIiSQnliSmp2aWpBaBNPHxMEp1cAkJHBGZvXl6czXrBbd
	S61Zpswrp5JZzG5qPq/Erlfw0aGNn5o/6yu9yDkrUbIr77jPufYJYe2/Yz4qxIn19zx6YBua
	8Df3UfLl+xdPL1L/FblC+PmfTPOTm+UF4w3UK9hXRd1dPU+PVSBlauP9+SVnIrb82Wy+qFG7
	/2bmvMYLn5bKFZmsnZy3yp7ZP3Eam0OFjOGDwyHlslMTb555HLMgeFXt0SeV5Yb77+Qs97/M
	Md1LsrS5ZEGJtcGtHd+Nnk/eceByaNbL4A0rfvfGP52hbvBiWXLBmoO6XX4aSyLnLGJeJFDR
	tWH+rV0pcZt/BFj+W3DioEf+nVAlpY8e53LzJN2+ddzcXOdwrEJPL85eiaU4I9FQi7moOBEA
	qPBioDQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSvG6/55E0g+ZV2hYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGbN6
	HrAU/BCoaJncxtbAOI+3i5GTQ0LAROL4zbfMXYxcHEICuxklli9byAaRkJHY2PCfHcIWlrjf
	coQVoug9o8TaU5eBOjg42AR0Jf78cwCJiwgcYpKY+PkpC4jDLHCZUeLY3cnMIN3CAq4SM478
	ALNZBFQlLjYfYQGxeQXsJQ623IDaJi9xcc1zNoi4oMTJmU/AapiB4s1bZzNPYOSbhSQ1C0lq
	ASPTKkbJ1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT83E2M4FDX0trBuGfVB71DjEwcjIcYJTiY
	lUR4u18eTBPiTUmsrEotyo8vKs1JLT7EKM3BoiTO++11b4qQQHpiSWp2ampBahFMlomDU6qB
	qcvHt9CGTf9css7NSX+fJP79v4Z3qrhlWvebzKkTI7paLoVp78oVdeu+eWrp7wwG3/6Vl208
	I0X9rpnufKX+hoE9/+bGDKeyfzWcnqf1hQPzih/+T7zGsV3KZ4XejvzLm15dC95f+eFYbmBu
	tLZEpdvxU+LT5TRenjp34NKcF2rzudYK1S6cNuHJ43XyUnL3d5cnpiS7MpbNf7BM68CPs7P6
	3r+e8lnLLWfK2Zjj7JyTK/fwMNR+FLrRrP6AbbbTMd0HpQdfvLTiWsh1Zc+c2n37lbhPaR9w
	WpWs9eFpS4nmU66Da77fe8j6z5YlO7o4vf1aVmPYvDfurfWKOw9Uujs+ri4vM/JoefZpAatL
	thJLcUaioRZzUXEiACQu5BfkAgAA
X-CMS-MailID: 20240820074519epcas2p4c505aa89aa9d325828fde24f65b24037
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240820074519epcas2p4c505aa89aa9d325828fde24f65b24037
References: <CGME20240820074519epcas2p4c505aa89aa9d325828fde24f65b24037@epcas2p4.samsung.com>

Subject: [PATCH v6 0/4] initial clock support for exynosauto v920 SoC

This patchset adds initial clock driver support for Exynos Auto v920 SoC.
This driver uses HW Auto Clock gating. So all gate clocks did not register.

Below CMU blocks are supported in this patchset and remains will be
implemented later.

- CMU_TOP
- CMU_PERIC0/1
- CMU_MISC
- CMU_HSI0/1

Changes in v7:
 - Combine duplicate clock description

Changes in v6:
 - Add peric1, mis and hsi0/1 in the bindings document

Changes in v5:
 - Change CMU_TOP odd numbering
 - Move the descriptions and names common clocks properties

Changes in v4:
 - Change PLL_531x fdiv type and mask bit
 - Change PLL_531x mdiv type

Changes in v3:
 - Change SoC name from Exynos Auto to ExynosAuto
 - Change the makefile order to the bottom of exynosautov9
 - Add PLL_531x formula for integer PLL

Changes in v2:
 - Fix typo from v209 to v920
 - Change USI clock to appropriate
 - Merge headers into binding patches
 - Change clock-name to the recommended name

Kwanghoon Son (1):
  clk: samsung: exynosautov9: add dpum clock support

Sunyeal Hong (4):
  dt-bindings: clock: add ExynosAuto v920 SoC CMU bindings
  arm64: dts: exynos: add initial CMU clock nodes in ExynosAuto v920
  clk: samsung: clk-pll: Add support for pll_531x
  clk: samsung: add top clock support for ExynosAuto v920 SoC

 .../clock/samsung,exynosautov920-clock.yaml   |  162 +++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   40 +-
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynosautov9.c        |   83 ++
 drivers/clk/samsung/clk-exynosautov920.c      | 1173 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   44 +
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../clock/samsung,exynosautov920.h            |  191 +++
 8 files changed, 1682 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h

-- 
2.45.2

