Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2682FA0DB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757929517; cv=none; b=bsUf/XEqDfxUMD/avuWQrjNo8yOpfrwqjCpyAwvAKCT4rBXgFTg0keb4/HH3nroAp9zHHUnBXIuEcPZRtgSzwAYSHulv/u/lCwybiR5NTqm6bM7+Da5/Yn3PVqkDzSu8wDUSs/4RAtqaDFs5QnhUQzWLxKLx74q08U0ddMFMtAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757929517; c=relaxed/simple;
	bh=TrChAAWunZiE/sb8luU2pEwyYavetGbtrq/ex3LO5f0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=DzP8+TdFCBsJW5sQW+BYRaQvCwvl36k18s6ogbwA0m4I6FWOyoto/0ub5QCUzHKgyo9ks2mIWyhEMudNJ2XUnZQuoVh5ij3AjX4lA2x8K27SRBC8pBmr4gVQPACSPXTQywyyGTBlH6JQyZ2ckUT8mdunVFK0YvujsyR7vTtQpE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VQuL5rpj; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VQuL5rpj"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250915094512epoutp016cf1fd9626ae8b41779225e35b80fa6a~la5PaCoHg2301023010epoutp01f
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 09:45:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250915094512epoutp016cf1fd9626ae8b41779225e35b80fa6a~la5PaCoHg2301023010epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757929512;
	bh=QkNp9D58yMqtTX6qAnEQLm2JGIov8tcrreWJNSP4Fj8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=VQuL5rpjpyZIowM8MYwNifukSNfosTYhNSMeVD0np2LNEjCkOm6I7w2EtFp2XyY4q
	 zbnc8tNks2fBQ9wlqvcq988+qLTQc9iYCD/vvQpSoRWfKdVg+fDbc2qYn/+86xE0yW
	 KGIEa2UTXb+qZUvHnUHuN0Yn5zGspo9JLTINlCpo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250915094511epcas5p1ae78bac20f275fe9253e89b3ff86c2c5~la5OwEWup0088700887epcas5p1v;
	Mon, 15 Sep 2025 09:45:11 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cQKrk4pRZz6B9m5; Mon, 15 Sep
	2025 09:45:10 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250915094509epcas5p355b63f77800068afa6b891068080cde7~la5MwJfOc0109001090epcas5p3f;
	Mon, 15 Sep 2025 09:45:09 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250915094506epsmtip273b178251cb71880f5f6d2a6befb0743~la5KWSHiC0834508345epsmtip2O;
	Mon, 15 Sep 2025 09:45:06 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH v2 0/3] Add clock support for CMU_M2M
Date: Mon, 15 Sep 2025 15:23:58 +0530
Message-Id: <20250915095401.3699849-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915094509epcas5p355b63f77800068afa6b891068080cde7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915094509epcas5p355b63f77800068afa6b891068080cde7
References: <CGME20250915094509epcas5p355b63f77800068afa6b891068080cde7@epcas5p3.samsung.com>

This series adds clock support for the CMU_M2M block.

Patch[1/3]: dt-bindings: clock: exynosautov920: add m2m clock definitions
        - Adds DT binding for CMU_M2M and clock definitions

Patch[2/3]: clk: samsung: exynosautov920: add block m2m clock support
        - Adds CMU_M2M clock driver support

Patch[3/3]: arm64: dts: exynosautov920: add CMU_M2M clock DT nodes
        - Adds dt node for CMU_M2M

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
Changes in v2:
-Fixed the dt binding checks warning

Link to v1:
https://lore.kernel.org/all/20250808142146.3181062-1-raghav.s@samsung.com/

Got a comment from Krzysztof Kozlowski
Link: https://lore.kernel.org/all/f8ad7883-d879-47ce-aafc-7c5f741f3c18@kernel.org/

Raghav Sharma (3):
  dt-bindings: clock: exynosautov920: add m2m clock definitions
  clk: samsung: exynosautov920: add block m2m clock support
  arm64: dts: exynosautov920: add cmu_m2m clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 13 ++++++
 drivers/clk/samsung/clk-exynosautov920.c      | 45 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  5 +++
 4 files changed, 84 insertions(+)


base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
-- 
2.34.1

