Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F9318B479
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145310; cv=none; b=mqLBDUtf3sH8NU2C1mp0Wspm1yCTnf+XcvyEBbyRDg7zqAbtCxwRHzQxdtDghq+iW2FbGx3aVlIzICrVSpnrAMi5jDyGow4lOR5HaocuIk6gOzZqgjur4hb/KeJubxrKQ7/xac8ojXbryxXIdQpTQUTuR5c+ukboq2mIzNKYw+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145310; c=relaxed/simple;
	bh=gQFr0R2yJPrE1ig/JI/igkinoJMAVaZ4XV7epIl71f8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=ct24oiH15X79qgdhOiA8QNHhd/2SlqyTCs4zzNCIoyG9eo4jcUx6Vc0pXGhiArqT0vCfa6s8KEktbwfOxXwYWnZnfEy8fItRHWFb5hO1nEPommjBtgdnxdy3OkL4o6syJ/csCXThbog9oVmnBHwO6UpSpAbQFZv4UceZ56sR+3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CIwkCeck; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CIwkCeck"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240820091505epoutp02e69ef5e9b70fba98b88f6faad6f30389~tZQVRxeht3160531605epoutp024
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 09:15:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240820091505epoutp02e69ef5e9b70fba98b88f6faad6f30389~tZQVRxeht3160531605epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724145305;
	bh=8tMkLzhylaiHCBUalOueN3x9TqC6MrJUi++AmTMJENg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=CIwkCeck5XX/kMgc/A15PjTJ+Ad/ZsI/AuS0NDWgyCgcmQ6Es4KAT7bbWMACE9sa3
	 deb0zDBtCzocqaBhVUS9tOQRBR7Bo/lMgMQh7DWxEUUjMUC+ZJ0od7wdUJ8ZJD7n0v
	 dNp/L1V/iXdtNa2E6J5jC/VSatKDxa/uUmuUWDX8=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240820091505epcas2p2ca02bbf3b726b577fbc17936ba1fc77e~tZQUunUEs2152021520epcas2p2z;
	Tue, 20 Aug 2024 09:15:05 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.68]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Wp3hS6dSMz4x9Q1; Tue, 20 Aug
	2024 09:15:04 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	D8.31.08901.89E54C66; Tue, 20 Aug 2024 18:15:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240820091504epcas2p4b492128d21e5f12cdc084995059c6502~tZQT_RghH0982509825epcas2p4i;
	Tue, 20 Aug 2024 09:15:04 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240820091504epsmtrp1361a1f5dc3c860bb8a045fb3b1b623cd~tZQT9Y0Fm2606226062epsmtrp11;
	Tue, 20 Aug 2024 09:15:04 +0000 (GMT)
X-AuditID: b6c32a43-a0fff700000022c5-ee-66c45e984513
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	59.7F.07567.89E54C66; Tue, 20 Aug 2024 18:15:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240820091504epsmtip1768782e35c659e603dd865e7177d4a83~tZQTyTqtp3093730937epsmtip1T;
	Tue, 20 Aug 2024 09:15:04 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v8 0/4] initial clock support for exynosauto v920 SoC
Date: Tue, 20 Aug 2024 18:14:56 +0900
Message-ID: <20240820091501.3395841-1-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmqe6MuCNpBmsfGFk8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7o3biFseA9f8WzKw4NjBt5
	uhg5OSQETCRW3ZvG3MXIxSEksINR4mzTSnYI5xOjxPJrX6Ey3xgl+ne/Y4FpubZhLiuILSSw
	l1Fi1hRtiKKPjBJn5r1n6mLk4GAT0JX4888BJC4isIdJYsv5JUwgDrPAWUaJu3MWsIN0Cwu4
	Slw+so4ZxGYRUJXo+rSWEcTmFbCXOHqyhxlim7zExTXP2SDighInZz4Bu4IZKN68dTbYeRIC
	rRwSh65dBNssIeAicfk2K0SvsMSr41vYIWwpiZf9bVB2vsTk62+ZIHobGCWu/euGWmYvsejM
	T3aQOcwCmhLrd+lDjFSWOHILai2fRMfhv+wQYV6JjjYhiEY1iU9XLkMNkZE4duIZlO0hMevw
	RGhYxUpsaLzDMoFRfhaSZ2YheWYWwt4FjMyrGMVSC4pz01OTjQoM4XGanJ+7iRGcUrWcdzBe
	mf9P7xAjEwfjIUYJDmYlEd7ulwfThHhTEiurUovy44tKc1KLDzGaAoN3IrOUaHI+MKnnlcQb
	mlgamJiZGZobmRqYK4nz3mudmyIkkJ5YkpqdmlqQWgTTx8TBKdXAtMnBmeNPZfXrXl27zQwt
	ly9WBIjYJK/XnNjQYJPs1nJw4cV9u9vUnp/gmPxC0jjh5iy1vJe/TqXsMr92dO2N+wEtBfsd
	DvJJTw0qWHNLolG5dvfibSIXlrGotT3vEsxL/xz+jv9OR1AaR71qukrwjEWG5h43Q/Je6nyJ
	6z64w89T9G4b11OGmivlvx8wXf3Z1Gi3dkdv1rSKKzefxj6bMje4+J8jD2Pq9TMh95bwmy/2
	M7uYycv+f17o2dunykLfXPJYyWSuULxgq9O+k4udDJYGxV2r6i34mfjmacoKk/lxO26VMP1R
	Yo1VYxZtk1386NfhKMOLTN0OrCu2P+k55mlw/omD0LW5fjNs/pYaKLEUZyQaajEXFScCADFO
	z4YyBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsWy7bCSnO6MuCNpBtd+iFs8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZfRu
	3MJY8J6/4tkVhwbGjTxdjJwcEgImEtc2zGUFsYUEdjNKvF/GBhGXkdjY8J8dwhaWuN9yBKiG
	C6jmPaPE7L47zF2MHBxsAroSf/45gMRFBA4xSUz8/JQFxGEWuMwocezuZGaQbmEBV4nLR9aB
	2SwCqhJdn9Yygti8AvYSR0/2MENskJe4uOY5G0RcUOLkzCcsIDYzULx562zmCYx8s5CkZiFJ
	LWBkWsUomVpQnJuem2xYYJiXWq5XnJhbXJqXrpecn7uJERzmWho7GO/N/6d3iJGJg/EQowQH
	s5IIb/fLg2lCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeQ1nzE4REkhPLEnNTk0tSC2CyTJxcEo1
	MCXLi08TLTQIkptYd199S/3/u6cdtjpVLgzcpP1pzbV7H3rMGC6XWvnfVb05/e3zbT39Ju9O
	yW4QCbSzdBAzXHAq6Jam/gLhyW6ZPeubT9l7z/V+wqc2tVf/v0SvbIvOJn4/tr1LEl6wTVpY
	u2lD2Eu/n9EHvwlve/Zg86I6ptJ1Yo6+szfZTCleP2dV/60koekpjJvqlNkWPPnInHvVp3XS
	89/bS0/lnKxle3NRrS/7yZLVp97tWXv2tv2RngXvqr4Jnz2c4vZOn/ch8+dzR99cTlq7ntPc
	IsfpcYTqeV1FqXKv4EU5j7O2zvvNM9HjcsG7vIrFuiITlMT2Bcf9WnJVnvl0RoHdhIqeAIN3
	NbuVWIozEg21mIuKEwEcRHiF4gIAAA==
X-CMS-MailID: 20240820091504epcas2p4b492128d21e5f12cdc084995059c6502
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240820091504epcas2p4b492128d21e5f12cdc084995059c6502
References: <CGME20240820091504epcas2p4b492128d21e5f12cdc084995059c6502@epcas2p4.samsung.com>

This patchset adds initial clock driver support for Exynos Auto v920 SoC.
This driver uses HW Auto Clock gating. So all gate clocks did not register.

Below CMU blocks are supported in this patchset and remains will be
implemented later.

- CMU_TOP
- CMU_PERIC0/1
- CMU_MISC
- CMU_HSI0/1

Changes in v8:
 - Resend it because v7 includes other SoC patches

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

Sunyeal Hong (4):
  dt-bindings: clock: add ExynosAuto v920 SoC CMU bindings
  arm64: dts: exynos: add initial CMU clock nodes in ExynosAuto v920
  clk: samsung: clk-pll: Add support for pll_531x
  clk: samsung: add top clock support for ExynosAuto v920 SoC

 .../clock/samsung,exynosautov920-clock.yaml   |  162 +++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   40 +-
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynosautov920.c      | 1173 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   44 +
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../clock/samsung,exynosautov920.h            |  191 +++
 7 files changed, 1599 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h

-- 
2.45.2

