Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F408830
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2024 01:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720660409; cv=none; b=OjjDsrFqHWo36Q8PnjBFVJ6FsjxgZSKNof/5gFU/BhwLu9+LhXVJoiBcShSuyJfhZPcSKjj8/vKcRYrLkZvY3QcWWJfKC1ofQf26wc8gFf06aADuRWj3DRMn8m1S10CaG7ycAHA8JD8bCPdWji1WciwwLVSyTtkbd34rLy56H0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720660409; c=relaxed/simple;
	bh=+vDrfx9gSCcmmVlhUxDIg7dDIHdSBMWpGmxEX3W09v4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=GYcAUS4CLds2l1FQUgdWZWI3RMl+jikFHAgx/1L8PYfwUCi5CLhnD2Cadv3dUrLIr0zPmOw0Zvi09RHKE+5A5DKD/wVj4FwTi/N7WSYXU7dz09FlIhM4uMzfKwmtzYSmNWIKIrXDplYfF0d1UI5CgGj3dtDid1rTUkFEqdkLsYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AlP888SP; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AlP888SP"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240711011325epoutp040615837e91755917867235adfd317ed5~hA4XKJzrH0555205552epoutp04D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2024 01:13:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240711011325epoutp040615837e91755917867235adfd317ed5~hA4XKJzrH0555205552epoutp04D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720660405;
	bh=XLfN72mNtIGtMdNbunDcS+ZxnGbyTvCYz2gJ3EuHUN0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=AlP888SPoHzt2np0MXPT1zHcKYZZl0uVUPeTd2ZO3KuJ33SuYaxzII77QhYx9Av52
	 OzQvJw22iLwz5ecYwTKRv5GGfaa9c728noqGi03MOwI98Xb+mgz5k99Dvsfmh7GCtd
	 4oug/zeSOl3OL0xKza7112/atxc1NXzvwISMQRoU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240711011325epcas2p2fa7c5dcc443e3f9f51943d1d47d5e500~hA4WkEWpG0058500585epcas2p2A;
	Thu, 11 Jul 2024 01:13:25 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.90]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WKGv85gpRz4x9Py; Thu, 11 Jul
	2024 01:13:24 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	86.E2.09485.4B13F866; Thu, 11 Jul 2024 10:13:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240711011324epcas2p26548bc764e4e8edec63cc1ebffe70ede~hA4Vq2i300059100591epcas2p2J;
	Thu, 11 Jul 2024 01:13:24 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240711011324epsmtrp1ea6b09cd8b1cd99fcd618edee7c77252~hA4Vp4opk0440904409epsmtrp1P;
	Thu, 11 Jul 2024 01:13:24 +0000 (GMT)
X-AuditID: b6c32a46-f3bff7000000250d-96-668f31b436b6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	75.1D.07412.4B13F866; Thu, 11 Jul 2024 10:13:24 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240711011323epsmtip22ffdcb16e2f6e77699f35253b4696ce2~hA4Vb4HXQ0294702947epsmtip2I;
	Thu, 11 Jul 2024 01:13:23 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v3 0/4] initial clock support for exynosauto v920 SoC
Date: Thu, 11 Jul 2024 10:13:12 +0900
Message-ID: <20240711011316.2713270-1-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmue4Ww/40g1VLtCwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGcsfJhWsJenYueO+SwNjE84
	uxg5OSQETCTaPr1jA7GFBHYwSqzt9epi5AKyPzFKLJnQyQjhfGOU+HN1BRNMx8KVv9ghEnsZ
	Jc41b2aDcD4ySjS+7GfpYuTgYBPQlfjzzwEkLiKwh0liy/klTCAOs8BZRom7cxawg4wSFnCV
	mHShjxHEZhFQlbhwcwkriM0rYC/x9OgzZoh18hIX1zxng4gLSpyc+YQFxGYGijdvnc0MMlRC
	oJVDYv/SbkaIBheJ1ssz2SBsYYlXx7ewQ9hSEi/726DsfInJ198yQTQ3MEpc+9cNtc1eYtGZ
	n+wgLzALaEqs36UPYkoIKEscuQW1l0+i4/Bfdogwr0RHmxBEo5rEpyuXoYbISBw7AXO+h8SK
	Iw3Q8I2VeHismX0Co/wsJN/MQvLNLIS9CxiZVzGKpRYU56anFhsVGMEjNTk/dxMjOKlque1g
	nPL2g94hRiYOxkOMEhzMSiK88290pwnxpiRWVqUW5ccXleakFh9iNAWG70RmKdHkfGBazyuJ
	NzSxNDAxMzM0NzI1MFcS573XOjdFSCA9sSQ1OzW1ILUIpo+Jg1OqgcnlilvwgoM7rHkaQ858
	eFj3OzP6ctrbH03MJe4+7G0W2zn260i3iU02/nUgPWNFZcBV29bzlx1S43YHR3VIv3Mos3ac
	1LnLRo2T96nJI/PlicWaN9vSvn/dybPhDHfoww3lDcU9hz7/1DJd0pD+2uruz+jDmrV3NHn8
	fyocvFe84N2aPzf658c3TOWJ6xex0tP0fGcpsfJ+7LouxsmrU6bvlvJXD940UerGRLOiHczX
	2hVsflXFNht/evJimtCC2dd1vvsrXn9r6ruk0FRrlvM/kQbdarn51xwUJIyS122fMrVnplZD
	8S7zxXdleaotY8yOPFouvnhOxowci4Nbuz3WGi+Vla67qGnOEir6WomlOCPRUIu5qDgRAKBx
	w18zBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWy7bCSvO4Ww/40gymTWSwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4MhY+
	TCvYy1Oxc8d8lgbGJ5xdjJwcEgImEgtX/mLvYuTiEBLYzSgx99s1NoiEjMTGhv/sELawxP2W
	I6wQRe8ZJY5e2APkcHCwCehK/PnnABIXETjEJDHx81MWEIdZ4DKjxLG7k5lBuoUFXCUmXehj
	BLFZBFQlLtxcwgpi8wrYSzw9+owZYoO8xMU1z9kg4oISJ2c+YQGxmYHizVtnM09g5JuFJDUL
	SWoBI9MqRsnUguLc9NxkwwLDvNRyveLE3OLSvHS95PzcTYzgQNfS2MF4b/4/vUOMTByMhxgl
	OJiVRHjn3+hOE+JNSaysSi3Kjy8qzUktPsQozcGiJM5rOGN2ipBAemJJanZqakFqEUyWiYNT
	qoEpZ1pDuHfZlYJQq9NLv9VNzI0U+j3V5lD6zzQ/v4UuD5rSX6y4v9jr6a3PTyrDfrdqb1+m
	r/WqbfoKI50P1d4uvXY9Cd3/BdlKPYrvqDOzrly3cK3Yb/aUpYIKXn4qh7Uu931eGvW2Sf3y
	/CVai599cq9UF1ufP3+dzbMqpqUJz/cKHjJSumBv019ccuHrr1eTO8R5nB/78if4sDY2Ca2c
	v3B3oatq31nOxlJRi/Covoj6lHmeEwouhB6Pyim1rn8x4Wrfzlilu08u37YsOrLHMqoy/dBF
	1uv3Jinrb3/GtXLrolep9snCe6Yvi/B0ytjJoOB+UT+m7IUF58Fp6SxrWT0LpvKY3bw3oVnq
	t6cSS3FGoqEWc1FxIgB/CL6M4wIAAA==
X-CMS-MailID: 20240711011324epcas2p26548bc764e4e8edec63cc1ebffe70ede
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240711011324epcas2p26548bc764e4e8edec63cc1ebffe70ede
References: <CGME20240711011324epcas2p26548bc764e4e8edec63cc1ebffe70ede@epcas2p2.samsung.com>

This patchset adds initial clock driver support for Exynos Auto v920 SoC.
This driver uses HW Auto Clock gating. So all gate clocks did not register.

Below CMU blocks are supported in this patchset and remains will be
implemented later.

- CMU_TOP
- CMU_PERIC0

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

 .../clock/samsung,exynosautov920-clock.yaml   |  115 ++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   40 +-
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynosautov920.c      | 1173 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   45 +
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../clock/samsung,exynosautov920.h            |  191 +++
 7 files changed, 1553 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h

-- 
2.45.2

