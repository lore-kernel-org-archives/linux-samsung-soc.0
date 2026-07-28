Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D4842CB12
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239571; cv=none; b=ADkdN18jmsEh0ivG9tE1QTykH2mejuNmmqtWxnXAvLEcM5CWC9/3zsMiyXkCpPk1OGFEUXjDEKl10gYgSIKY+zf4e/DxiiZ8sGkp8exmtVkcnj6Y3NBrAKiNLTsxOSZvcG5SvSwR2T0GCog48Ip5Y5CPJ960F2W24BSZ92tZHTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239571; c=relaxed/simple;
	bh=4v6uHfHg6/3e1DBLlJLCeyIQj5GYdGKmPUl331n9fZs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=GsMRLg/Oq12A0HT9Z4mINuuQJj8yfseem6Bqa9FzZp/iVxsMH6eS93l0psPKa/IDaMXXCbIGvH5IuKt/EOKzaT3KOZTWGyRevgqVmRqLU02aBKumracGu34EkwOxxB9ncXe/Yn9DaPK3qG61TOJaVPS55PpDjG6+1te1O2FHAcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XNDvM/Rf; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XNDvM/Rf"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260728115242epoutp01f341bf652a09c46389f55b6502b7dbc7~GcexZr_lE1114011140epoutp012
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:52:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260728115242epoutp01f341bf652a09c46389f55b6502b7dbc7~GcexZr_lE1114011140epoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239562;
	bh=AiB02Wdm7NldivtJgubd8uEDhXBzGC4t5y0JFft5kUU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XNDvM/RfP7Jj4vhmLtoZb18UG53e4w9FlShD4p+tK0XJlvLh/i8Xa+vqDqSxDQc+g
	 ZldKBTNh4/IPp/xhrxRN0A8j8A5TX6ywkJeY3Sn90kIB7INpQv5AWGS8OijYRhipyC
	 hELNawz6iovzFV8DX4hGNrUJ4igN3ktyfoDJYEnA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260728115240epcas5p282c38caaf67285a4e6a2cdf52242f1f3~GcewPjYsV3209432094epcas5p23;
	Tue, 28 Jul 2026 11:52:40 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4h8Yk01w5Tz2SSKY; Tue, 28 Jul
	2026 11:52:40 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260728115239epcas5p218bc69194dc55a5087c363816396cd5e~Gceu_Inmk3209432094epcas5p20;
	Tue, 28 Jul 2026 11:52:39 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115236epsmtip195fdddd41628afae8490b5e6330f51bb~GcesbVrYI2235622356epsmtip1a;
	Tue, 28 Jul 2026 11:52:36 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 00/13] Add clock support for Exynos8855 SoC
Date: Tue, 28 Jul 2026 17:40:58 +0530
Message-Id: <20260728121111.2077860-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115239epcas5p218bc69194dc55a5087c363816396cd5e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115239epcas5p218bc69194dc55a5087c363816396cd5e
References: <CGME20260728115239epcas5p218bc69194dc55a5087c363816396cd5e@epcas5p2.samsung.com>

This patch series adds clock support for below blocks
found in Exynos8855 SoC

TOP & PERIC
PERIS
HSI
USB

This is the minimal clock support provided for other IPs to
be added. More clocks (MUXs, DIVs, GATEs) will be added
as we add more consumers of the clocks

There are many other blocks, for which the support will be
added in forthcoming patch series.

Alim Akhtar (1):
  clk: samsung: clk-pll: Add supoprt for pll_4313

raghav.s (12):
  dt-bindings: clock: exynos8855: add top & peric clock definitions
  clk: samsung: exynos8855: add block top and peric clock support
  arm64: dts: exynos8855: add cmu_top & cmu_peric clock DT nodes
  dt-bindings: clock: exynos8855: add peris clock definitions
  clk: samsung: exynos8855: add block peris clock support
  arm64: dts: exynos8855: add cmu_peris clock DT nodes
  dt-bindings: clock: exynos8855: add hsi clock definitions
  clk: samsung: exynos8855: add block hsi clock support
  arm64: dts: exynos8855: add cmu_hsi clock DT nodes
  dt-bindings: clock: exynos8855: add usb clock definitions
  clk: samsung: exynos8855: add block usb clock support
  arm64: dts: exynos8855: add cmu_usb clock DT nodes

 .../clock/samsung,exynos8855-clock.yaml       | 178 +++++
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    |  63 ++
 drivers/clk/samsung/Makefile                  |   1 +
 drivers/clk/samsung/clk-exynos8855.c          | 710 ++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |  11 +-
 drivers/clk/samsung/clk-pll.h                 |   1 +
 .../dt-bindings/clock/samsung,exynos8855.h    | 120 +++
 7 files changed, 1083 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8855.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8855.h


base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
-- 
2.34.1

