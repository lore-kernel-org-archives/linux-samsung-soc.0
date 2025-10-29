Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7538522083
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743297; cv=none; b=RqqfctVYs8XybY1unu9qHZV/3+3e2hpewODPtYnhl9B6AyPVDF/b4h9wNgkvZM3PGeCQt1uvZ6jIVuYoSDyn2c7ciwFYxmo6YNVyFZK/l1QJ7n61zihAWBtzk2/KWxdkAVIhKzIeDLIah1aMf+D2aog9OuNQsllkvLbFCHOKafI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743297; c=relaxed/simple;
	bh=YOF7e2QqW3bM2938LNZoptXSOs0j1IlQgxJcttbQRbM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=dHtX6sA2wQyBOD5MpZQKX1A0d9ZxfzrjdeP4NjRQpOTRAbGzQqPofZOG6jJVMWPDmTCvQgLSYqfpJZwjqLCtXX73nTYEcJI96vYCYytFlIz6HeS0oABn/7EtEFI10yNn+6QwucXkIdz5qqKZfut9jCVyUWoB24ZKPVT1RZYRqvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=d2ZHJshW; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="d2ZHJshW"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251029130812epoutp01fdb91f1d7d13be2f69b21587243005da~y_DC-Xy_-0476004760epoutp01B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 13:08:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251029130812epoutp01fdb91f1d7d13be2f69b21587243005da~y_DC-Xy_-0476004760epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761743292;
	bh=byw93Ri35jRUhP+sjX8uLfNmtcc8ykjNJrhzHp/NDwM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=d2ZHJshWENHEHq1SEf87N0/RamN9cy/To79TjOJ/AEGomX2F9sl0yRFEN7Z1LWtdh
	 phkQd9nAuPgqp5YRLWOm0tp5Oz1Ss136exgmD2dnZL1xHpvplxYe/aOObYG6L5wobm
	 W58krZyPhr8PUfUjCbKHi4Sw+jpXn7Ajzpvf3aoQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251029130811epcas5p2109c17f4c7ec760ed93d9d3164324ae7~y_DCJr8U62631226312epcas5p23;
	Wed, 29 Oct 2025 13:08:11 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cxSGf4LFgz6B9m7; Wed, 29 Oct
	2025 13:08:10 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251029130809epcas5p3cd5341d86ffac5fe18d8541c8018e568~y_DAIzFB70997109971epcas5p3H;
	Wed, 29 Oct 2025 13:08:09 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251029130744epsmtip2a58ba371343b591aa94578b352efa07c~y_CpUhyV70628906289epsmtip2W;
	Wed, 29 Oct 2025 13:07:44 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com,
	sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: [PATCH v3 0/4] Add basic clock and pmu support for the Axis
 ARTPEC-9 SoC
Date: Wed, 29 Oct 2025 18:37:27 +0530
Message-Id: <20251029130731.51305-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20251029130809epcas5p3cd5341d86ffac5fe18d8541c8018e568
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251029130809epcas5p3cd5341d86ffac5fe18d8541c8018e568
References: <CGME20251029130809epcas5p3cd5341d86ffac5fe18d8541c8018e568@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Add basic clock driver and pmu compatible support for the
Axis ARTPEC-9 SoC which contains 6-core Cortex-A55 CPU
and other several IPs. This SoC is an Axis-designed chipset
used in surveillance camera products.

This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.

This patch series includes below changes:
- CMU (Clock Management Unit) driver and its bindings (patch #1 to #3)
- PMU bindings (patch #4)

The patch series has been tested on the ARTPEC-9 EVB with
Linux Samsung SoC tree (for-next branch) and intended
to be merged via the `arm-soc` tree.

---
Changes in v3:
- Resend all patches in single thread

Link to v2: https://lore.kernel.org/linux-samsung-soc/20251029125641.32989-1-ravi.patel@samsung.com/
---

Changes in v2:
- Decouple the device tree related patches which was present in v1 (Patch #5 to #7)
  Device tree related patches will be sent in separate series.
- Fix the division issue (in arm target) reported by kernel test in patch #2

Link to v1: https://lore.kernel.org/linux-samsung-soc/20250917085005.89819-1-ravi.patel@samsung.com/
---

GyoungBo Min (3):
  dt-bindings: clock: Add ARTPEC-9 clock controller
  clk: samsung: Add clock PLL support for ARTPEC-9 SoC
  clk: samsung: artpec-9: Add initial clock support for ARTPEC-9 SoC

SungMin Park (1):
  dt-bindings: samsung: exynos-pmu: Add compatible for ARTPEC-9 SoC

 .../bindings/clock/axis,artpec9-clock.yaml    |  232 ++++
 .../bindings/soc/samsung/exynos-pmu.yaml      |    1 +
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-artpec9.c             | 1224 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |  185 ++-
 drivers/clk/samsung/clk-pll.h                 |   17 +
 include/dt-bindings/clock/axis,artpec9-clk.h  |  195 +++
 7 files changed, 1847 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-artpec9.c
 create mode 100644 include/dt-bindings/clock/axis,artpec9-clk.h

--
2.17.1

