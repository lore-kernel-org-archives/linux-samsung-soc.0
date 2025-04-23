Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318CB26562B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 04:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745383325; cv=none; b=ZyUYJqQ0WFlKcMFcb/CCXzilO2/o09iP8fYeZuQfR1txqTfd3A9XT9+qdfVOh1wbc4ZlcoQvXAjConAwx4ml64UjchK9XDwh6zr+1Wd7CYNQEh+RB0ttnivsiNvS0qSeYqudbqSYsyOhxFHproffuczKZbHot+2dX8FLbcQI+0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745383325; c=relaxed/simple;
	bh=Fs8ouxQ33PEBj0wtRIWIwkguzpM6R33naGIhI4beHcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=SFRedpinqoyNTT25f6gcDTGT49AtXUCQJIYKDZwz7OZd21v3I6npZJmzZClD52JJc/QQv/pM/HRf847ycoSP3XSYI2e0OHEcTI7UIO0xtI7+P+YIDnoMH/r3ELpix9U/FFMusNf7UP50xzBrGkqBvA+eLb3NvgqndZ9J6JgJHks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=BCi6W2k2; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BCi6W2k2"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250423044201epoutp0411e0a8281eef304eb33dee54b7ee3537~42OIYMDdP1984819848epoutp04E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 04:42:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250423044201epoutp0411e0a8281eef304eb33dee54b7ee3537~42OIYMDdP1984819848epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745383321;
	bh=Aq/sg4EkIw7Nn3DqDs1qtN6iM6X4EVTY/hf5nPBEA/c=;
	h=From:To:Cc:Subject:Date:References:From;
	b=BCi6W2k2gOv300mDtT6BnBdl6m7MnZd7nIKqW4WoGJQty3NS4g0HjaFcymeibXQ82
	 ajqSqwA4RAwX7f2ZiTaJX5VeHCS3aIuROTMpMjP+IWYsowDuxWStAExBFRUjd6PKQ0
	 U+YCNad1zMdAeBbr+Te4XFGbkqgiDDv3Z/o5qXSc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250423044200epcas2p2ff50c87fe51321c3caedb36e95cc85df~42OHoyn5l3023630236epcas2p2F;
	Wed, 23 Apr 2025 04:42:00 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zj5zr0VY7z6B9m9; Wed, 23 Apr
	2025 04:42:00 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250423044159epcas2p2a064b6cd52806f765f830240adaf69a5~42OGqbTYT3023130231epcas2p2J;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250423044159epsmtrp28433c682f0e4a3cb224300c15c838135~42OGpVjcE0544505445epsmtrp2M;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-8e-68086f979b3c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C6.39.08766.79F68086; Wed, 23 Apr 2025 13:41:59 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250423044158epsmtip14cb568c54e7f3cd244a32bacd9f448e1~42OGU9tmi1643416434epsmtip1K;
	Wed, 23 Apr 2025 04:41:58 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] add CPUCL0 clock support for exynosauto v920 SoC
Date: Wed, 23 Apr 2025 13:41:50 +0900
Message-ID: <20250423044153.1288077-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWy7bCSnO70fI4Mg/4TvBYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYjH5+FpWi6Zl65kc+D3e32hl99i0qpPNY/OSeo++LasYPT5vkgtgjeKySUnNySxLLdK3
	S+DK+Prbs+Ara0XftX6mBsaHLF2MnBwSAiYSqw/OZO5i5OIQEtjNKNG64TY7REJC4vCMCYwQ
	trDE/ZYjrBBF7xklfs5tA0pwcLAJqEps+i0PEhcReMsksfz/ASaQBmaB04wSO8/IgNjCAh4S
	R3+vZAaxWYDq7/bNBavhFbCWaH2/nw1kjoSAvER/hwREWFDi5MwnLBBj5CWat85mnsDINwtJ
	ahaS1AJGplWMkqkFxbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMHhrqW5g3H7qg96hxiZOBgP
	MUpwMCuJ8P5yY88Q4k1JrKxKLcqPLyrNSS0+xCjNwaIkziv+ojdFSCA9sSQ1OzW1ILUIJsvE
	wSnVwLS83P3CEUnHXMWou7ub+0T+xL08mCvmMHNCm/JV6XOX2c2/XXbbXnxNdUbChuqTq/9u
	zL1d4KZsIjd7R1DOo1uRotafNa5r1Cv7MyjbNZWyLt8ncTPrzg/t5CWCIkucHk7MV7Fkvu+R
	XJDCHRe4znWiwcrz7JOEZxu8V3qyuj2x/nPb3rcN54067IW5rm86Wp0dpyfwfe+ZI7EnxD9M
	CPtVxTAjO2XvfD+Xe5c109+65PG//LPNeYUdu86H+7yXFhexcs21jZc6t7fjtpuHYeKZD5Mf
	qAt9t3nqdLXh7m3OGhU+odx70otuSXXZZdZPe2Mxm+XB3xnOaosCJ52M+CEU+PpzwIrXey/s
	CeO+6afEUpyRaKjFXFScCAAoLY/L5gIAAA==
X-CMS-MailID: 20250423044159epcas2p2a064b6cd52806f765f830240adaf69a5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423044159epcas2p2a064b6cd52806f765f830240adaf69a5
References: <CGME20250423044159epcas2p2a064b6cd52806f765f830240adaf69a5@epcas2p2.samsung.com>

This patchset adds the CMU_CPUCL0 block to support exynosauto v920 SoC

Changes in v2:
- Add a brief description of the hardware
- Explain why CLK_OF_DECLARE is used
- Convert uppercase hex value to lowercase
- Aligned previously misaligned lines

Shin Son (3):
  dt-bindings: clock: exynosautov920: add cpucl0 clock definitions
  clk: samsung: exynosautov920: add cpucl0 clock support
  arm64: dts: exynosautov920: add cpucl0 clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   |  25 ++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  15 ++
 drivers/clk/samsung/clk-exynosautov920.c      | 130 ++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  19 +++
 4 files changed, 189 insertions(+)

-- 
2.49.0

