Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216AF10A24
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 02:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145481; cv=none; b=TxwuDXBbAn/evRdVMFkADkvq2wYbtn8IL1uYbrmkPmW1hZnJOU4lco48Ip0NXfEJYREnBIqultC5XGb7nqj0dsqhcuhLo6hoMtbfPaAWnej8aluP1JXnjFfMnlDYuzFYqI6bFluKn2+1+576bX5n2USnb59XVNNlXIJN4YcwftA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145481; c=relaxed/simple;
	bh=MHkY24Dv7WD+fs05hwqba+KuOzcsESVBhdZchAukMaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=O9xs5sAgYIID5KXGOl4jshud785/ON9YZ6sbd777IaZpcD8ya4TF9dI4GS/hJ2kUUaq929kG4vg9rx2GdVbBfH1pZQSUe/8CJUV0aODE/j+eHhxrFySu5E6BdNGearJSxYFDA5X/3g4TOh29QtlgnZsPYsxlc1tbCqyZ139voqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=N1lFP1dX; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="N1lFP1dX"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240705021116epoutp01ffd38ea1f89b95ab401e2ef918c0fd6d~fLzJ2-W7L2563325633epoutp011
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 02:11:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240705021116epoutp01ffd38ea1f89b95ab401e2ef918c0fd6d~fLzJ2-W7L2563325633epoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720145476;
	bh=wwOTOcR6jUDFYsddHvTGmzoibfOdVBtmVR6pvBluhJs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=N1lFP1dXOLTJs0lRM0VQQjPyFTe+wE7qpgyK2DXzQo3Sz7htuJNJK9r2uQv49FmaK
	 dNRRWq6hEjVIUdQUiqKLSvsjQzzH1195Di+iSFJtzl+YWyFB0MEJfpuA9BpXjkw2RV
	 QOg2sAu0oiiRgUfKDhXTHmzBWOW1ufS0pOxITLHQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240705021115epcas2p12e2ad83efd561ce329c453d87eb29ac6~fLzJBYund1971819718epcas2p1R;
	Fri,  5 Jul 2024 02:11:15 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.99]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WFcSg1HYWz4x9QJ; Fri,  5 Jul
	2024 02:11:15 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	64.8D.25328.34657866; Fri,  5 Jul 2024 11:11:15 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240705021114epcas2p4bad9380e73d2681aabc6074905e112ab~fLzITV8j-2870328703epcas2p45;
	Fri,  5 Jul 2024 02:11:14 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240705021114epsmtrp1d5f56136fe83724be89c56b94f50ffc4~fLzIRgZ1z0593405934epsmtrp1M;
	Fri,  5 Jul 2024 02:11:14 +0000 (GMT)
X-AuditID: b6c32a4d-001ff700000262f0-70-668756430b18
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	60.0A.18846.24657866; Fri,  5 Jul 2024 11:11:14 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240705021114epsmtip250ab3cb5d6404e669af930df6f667712~fLzIFGkWO0030900309epsmtip2j;
	Fri,  5 Jul 2024 02:11:14 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH 0/5] initial clock support for exynosauto v920 SoC
Date: Fri,  5 Jul 2024 11:11:05 +0900
Message-ID: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkk+LIzCtJLcpLzFFi42LZdljTVNc5rD3NYM1RdosH87axWVz/8pzV
	4vz5DewWH3vusVpc3jWHzWLG+X1MFhdPuVocftPOavHv2kYWi6Zl65kcuDze32hl99i0qpPN
	o2/LKkaPz5vkAliism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVc
	fAJ03TJzgO5RUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+Wl
	llgZGhgYmQIVJmRnPDtWU7CNq2L1zE9sDYyzOboYOTkkBEwkPnauYe1i5OIQEtjDKDHvzR52
	COcTo0TrqW5WkCow5/oMMZiO403XGSGKdjJKXLx5kwXC+cgoce1aM3MXIwcHm4CuxJ9/DiBx
	EYHvjBL9b/eBFTELdDJKXD26nQlklLCAk8SPMwvYQGwWAVWJB8ems4A08wrYS6x/XAexTV7i
	4prnYCW8AoISJ2c+YQGxmYHizVtnM4PMlBC4xS6x/8oXsMUSAi4Ss85FQfQKS7w6voUdwpaS
	eNnfBmXnS0y+/pYJorcB6Oh/3cwQCXuJRWd+soPMYRbQlFi/Sx9ipLLEkVtQa/kkOg7/ZYcI
	80p0tAlBNKpJfLpyGWqIjMSxE8+gjvGQePc+CRKEsRLHnk5gncAoPwvJL7OQ/DILYe0CRuZV
	jFKpBcW56anJRgWGunmp5fBYTc7P3cQITpNavjsYX6//q3eIkYmD8RCjBAezkgiv1PvmNCHe
	lMTKqtSi/Pii0pzU4kOMpsAAnsgsJZqcD0zUeSXxhiaWBiZmZobmRqYG5krivPda56YICaQn
	lqRmp6YWpBbB9DFxcEo1MC2ZOf+/FnOs9ooNS+y6Mo1jv9pU5TBwTT9q9z8o0/jEpbjDv5RT
	H9wOee/JHzz536lpx9QqP19ZPe+gRMjEniOcuv9kX0wv2tKW6H2PQ1ypWXk5R9/bTWtVWb2f
	/HkVOmfiiZe1XMUZX7kS3v886jPFXczzSCjz+QtSItx67yu/1n7heCg+Wf/A59lGWnV6d96k
	nj5vxHvP68yaP22zL5lY1K5hNZ6fKfkq/aLs3QPTPm1zP+opr2ZzbFVS4RGVWt5nUYJqgUki
	kW86Oq5vjJEo0Wi+/K2ZlUtiZURlfVfnPk1v07ibIafkTjJVBlxbIM7NP//Rm1aJR9yPN5q+
	0IyfdWR7tefak91Nf9qOuSuxFGckGmoxFxUnAgD3enlnHAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMLMWRmVeSWpSXmKPExsWy7bCSvK5TWHuaQc9ETYsH87axWVz/8pzV
	4vz5DewWH3vusVpc3jWHzWLG+X1MFhdPuVocftPOavHv2kYWi6Zl65kcuDze32hl99i0qpPN
	o2/LKkaPz5vkAliiuGxSUnMyy1KL9O0SuDKeHasp2MZVsXrmJ7YGxtkcXYycHBICJhLHm64z
	djFycQgJbGeUmLX2ADtEQkZiY8N/KFtY4n7LEVaIoveMEjeuXWDpYuTgYBPQlfjzzwEkLiLw
	m1Hix97vYJOYBXoZJe7c/scE0i0s4CTx48wCNhCbRUBV4sGx6WDNvAL2Eusf10EskJe4uOY5
	WAmvgKDEyZlPWEBsZqB489bZzBMY+WYhSc1CklrAyLSKUTS1oDg3PTe5wFCvODG3uDQvXS85
	P3cTIzhctYJ2MC5b/1fvECMTB+MhRgkOZiURXqn3zWlCvCmJlVWpRfnxRaU5qcWHGKU5WJTE
	eZVzOlOEBNITS1KzU1MLUotgskwcnFINTGmrVIpdX6XzB5ZJtGxfq+mhY73ZZUK/pC8/S6v6
	8h9XpvD0/du29qxc+P2oE0ps0mHfe6tmm725FVy8M5dj/1+t5IK8qQ2ft0fc337U6f+tim+c
	azSFM+dO3L/Q++P7DBuGlc/EtjD9uG04RWz3tLXV1x2CPh8UeSH1cr8wx0fLL7dMyxSS7WqC
	WPTC5n6ar9b78Ypa0oIXaTEHvJ/JsH1Z/a1Dx/J4gv7hyXn5/DfeezyRPvMyo/4z98eJOasv
	aT7fxc8TL/nR9IBX4fTpHcmTf6ybWK0yueHa+71HWH3knSY0m8c8WSvNpdHKxJkbr3fMtT3w
	fNmphWeMwxhUfk28+uv3pbmdhz96uAWnCyixFGckGmoxFxUnAgD7k0RGxgIAAA==
X-CMS-MailID: 20240705021114epcas2p4bad9380e73d2681aabc6074905e112ab
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705021114epcas2p4bad9380e73d2681aabc6074905e112ab
References: <CGME20240705021114epcas2p4bad9380e73d2681aabc6074905e112ab@epcas2p4.samsung.com>

This patchset adds initial clock driver support for Exynos Auto v920 SoC.
This driver uses HW Auto Clock gating. So all gate clocks did not register.

Below CMU blocks are supported in this patchset and remains will be
implemented later.

- CMU_TOP
- CMU_PERIC0

Sunyeal Hong (5):
  dt-bindings: clock: add Exynos Auto v920 SoC CMU bindings
  dt-bindings: clock: add clock binding definitions for Exynos Auto v920
  arm64: dts: exynos: add initial CMU clock nodes in Exynos Auto v920
  clk: samsung: clk-pll: Add support for pll_531x
  clk: samsung: add top clock support for Exynos Auto v920 SoC

 .../clock/samsung,exynosautov920-clock.yaml   |  115 ++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   40 +-
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynosautov920.c      | 1176 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   45 +
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../clock/samsung,exynosautov920.h            |  191 +++
 7 files changed, 1556 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h

-- 
2.43.2

