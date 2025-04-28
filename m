Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA7625E800
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840147; cv=none; b=qeML9uwGvfrc+fN5BGS++EZ7nHBymuua0UNGijSWqzWMn2K3Ic+b/oiXgk/g/1x8M+8amZSIJ3EuMYbqri87BHgIJMkFtUGj1vWfoNyB1sTAOUczxrobF6lhIB485ukP7incDrLyDN5Rjtd69bPsaadaRYyFslZH0l5JFHu0FI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840147; c=relaxed/simple;
	bh=fwld4zkOzPn17td9PUrYMQ1ZtsLZ+Qvv0Fddj7pLU+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=pfgFnaLuwFpaJVYOBStrcHSa3lKeyTUJOUPII9Y31jalm/dkMq/XCEL0ih97l6gnVUJDFIGy4lRNjW8r0sjSkG/G0qw20GnXWZTcvciXu2nVRQv+84MNmvY/fqqCA70fVrOnOHoeYdZILB+Z5mP3+ZbL8At7sZEMTDneQW/F+VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qLE+atdf; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qLE+atdf"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250428113542epoutp03c846c4edf7e5c11e0825ecb443623698~6eFwKcOUA1030410304epoutp03M
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 11:35:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250428113542epoutp03c846c4edf7e5c11e0825ecb443623698~6eFwKcOUA1030410304epoutp03M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745840142;
	bh=ZQy/46a1r4WAvJCApFWSuqNU0UpVfcMsny2biIWuzIE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=qLE+atdfvx+n5SWRn7JsFqmzHNJ//U1CYtZgGz8AAeyVUdy4rHTn3e6s8m3Dmui6f
	 2mI4LYEAXr13RLgOluK7Fw/5L/i3cwDilxEqfbHTKS0QYL9Uq0X7b8pLXspxT2eUvB
	 zGmv1nc3YxCTbGkYIXIB1kwkj90eRJXK0UuiFdxo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250428113541epcas2p331f0e777d96484f7ba564ecefc90b0ee~6eFvcG5kd1257712577epcas2p3A;
	Mon, 28 Apr 2025 11:35:41 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.100]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZmLws1F5Hz6B9mD; Mon, 28 Apr
	2025 11:35:41 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250428113540epcas2p4f8a2d6b473bdf6d71bd598e71fbf70c9~6eFumfo862314123141epcas2p4T;
	Mon, 28 Apr 2025 11:35:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428113540epsmtrp10cc9cceaf7072612c17dcaf6e23a395c~6eFukg35O3152331523epsmtrp1S;
	Mon, 28 Apr 2025 11:35:40 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-b4-680f680c2a6f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BF.E1.08766.C086F086; Mon, 28 Apr 2025 20:35:40 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428113540epsmtip180298e4107d75a44133400bde6cb2844~6eFuUJxzT2534225342epsmtip1b;
	Mon, 28 Apr 2025 11:35:40 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Fix CPUCL0 add CPUCL1/2 clock support for exynosauto
 v920 SoC
Date: Mon, 28 Apr 2025 20:35:13 +0900
Message-ID: <20250428113517.426987-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWy7bCSnC5PBn+GwYNN0hYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYjH5+FpWi6Zl65kc+D3e32hl99i0qpPNY/OSeo++LasYPT5vkgtgjeKySUnNySxLLdK3
	S+DKWL3oAmPBTraKV7+fMTcwzmPtYuTkkBAwkXh69RWYLSSwm1FiUW8BRFxC4vCMCYwQtrDE
	/ZYjQDVcQDXvGSXe/10ElODgYBNQldj0Wx4kLiLwlkli+f8DTCANzAKnGSV2npEBsYUFQiV+
	nb8DFmcBqr9+bQc7iM0rYCWx5fMPNpA5EgLyEv0dEhBhQYmTM5+wQIyRl2jeOpt5AiPfLCSp
	WUhSCxiZVjFKphYU56bnFhsWGOallusVJ+YWl+al6yXn525iBIe7luYOxu2rPugdYmTiYDzE
	KMHBrCTCW2XAnyHEm5JYWZValB9fVJqTWnyIUZqDRUmcV/xFb4qQQHpiSWp2ampBahFMlomD
	U6qBSVQy7/Ry3+zAsAcBCRazXTPeGSwWiHrO1bf9Q9vDfb/yTC/cutahmF0nd3+/T+utNc/Y
	j561yHRJ6DOUTZXZ+WmZcUirfYH8phitXXbC2bFFqU/Zft83fXXkicL9zGiF35PWlFf55738
	/O3U+l8PhYOf/k23Oekx/Z6o8/z6nxNTWg9u2Ra3/e+OqYm6a9abMio46bl0eXgc8HedErdL
	cj1rzrK0unn1vYczj6ta770Q2rjNkkdD6pRxQMeusi6ngvM79VXaxO6rL/i0/P2UFUkzd7ez
	L/kf8kFnbkm5/IMSv+LcG+sveR1adZGpxOGprt6BBV2P0y9+s+daHb+jPHHKnMDwDSzeXvbN
	/wrjlFiKMxINtZiLihMBRaiOmeYCAAA=
X-CMS-MailID: 20250428113540epcas2p4f8a2d6b473bdf6d71bd598e71fbf70c9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428113540epcas2p4f8a2d6b473bdf6d71bd598e71fbf70c9
References: <CGME20250428113540epcas2p4f8a2d6b473bdf6d71bd598e71fbf70c9@epcas2p4.samsung.com>

This patchset fixes the incorrect CLKS_NR_CPUCL0 definition and
adds the CMU_CPUCL1 and CMU_CPUCL2 block to support exynosauto v920 SoC.

Changes in v2:
- Separate the fix into its own patch
- Remove the extra blank line

Shin Son (4):
  dt-bindings: clock: exynosautov920: add cpucl1/2 clock definitions
  clk: samsung: exynosautov920: add cpucl1/2 clock support
  clk: samsung: exynosautov920: Fix incorrect CLKS_NR_CPUCL0 definition
  arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   |  44 ++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  26 +++
 drivers/clk/samsung/clk-exynosautov920.c      | 208 +++++++++++++++++-
 .../clock/samsung,exynosautov920.h            |  32 +++
 4 files changed, 309 insertions(+), 1 deletion(-)

-- 
2.49.0

