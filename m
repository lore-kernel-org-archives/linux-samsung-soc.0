Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556D727F19B
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Aug 2025 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754662518; cv=none; b=LK5ENZ0D0z4Q7zCWNSwpEKLfPSPRatgi+KRzwRXGwVM7oAGHsqBcAyoWiJhWDOFs3wH1zRGNBFGKGjpXypEZCRT4725p17qJWZ0Yr4JakeqBQTaYnrt3kRXe+ZM70v98ZtbSVp0/PNcneeLU2HhqO/3j7ZHRsvhe2jB/ylDhXM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754662518; c=relaxed/simple;
	bh=b0uz6gGOxrmWf37x43QKSPVnx5xNJDhkCz0EZ/q9xBs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=ASuyZ3l0X/8oWI+BfPHX02xJzyv0e0jhDV5jVKHdxO3PKdKfY6CwfN2jHNiChEu76S6VDLN/XUYGaIp9C7vrF3EetvkGTncjmAlAInS20a4mEMfBmOLnUA3FEmfAbTId8LLiFD8GnNvIJLgOg5m9pCWCPcI7GhQQBpQ9qPzuU/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WAZq5hDl; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WAZq5hDl"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250808141513epoutp015c82073378d56ceb3ebdb13b2941e18d~Z0EJlzsoC2982029820epoutp01j
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Aug 2025 14:15:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250808141513epoutp015c82073378d56ceb3ebdb13b2941e18d~Z0EJlzsoC2982029820epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754662513;
	bh=0+FDQ3+MGzQg8h5mRrPUliafyK3G6MDAXRWQfJde8Gc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=WAZq5hDlyEVJI9YNXcitPsrrl6QLpjmt3Nj+Yf06ScwrhQ0for3oCa1DbXPisSRV+
	 mzRIseXpE9kD6Lr0b9Vg1eXuAlSfJAk4SDFYUbaUWzW8QsHIYIE9cE+s2HNlIQDOM7
	 a/8dalKt+Ww9MbwyREM0bya0V7spsGK+WybAsDIA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250808141512epcas5p25cffc721f85d95f66d802884d8e287a1~Z0EIZGIZz2897228972epcas5p2v;
	Fri,  8 Aug 2025 14:15:12 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bz5dq1Zrmz6B9m5; Fri,  8 Aug
	2025 14:15:11 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250808141238epcas5p4a1e2767d73926bff7ca12b8afd66c36c~Z0B5s6nON3267932679epcas5p4q;
	Fri,  8 Aug 2025 14:12:38 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250808141236epsmtip2173602d1d6a8fabf184ef84cb9d8e79d~Z0B3ZH34k1965319653epsmtip2x;
	Fri,  8 Aug 2025 14:12:36 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, sunyeal.hong@samsung.com, shin.son@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dev.tailor@samsung.com,
	chandan.vn@samsung.com, karthik.sun@samsung.com, raghav.s@samsung.com
Subject: [PATCH v1 0/3] Add clock support for CMU_M2M
Date: Fri,  8 Aug 2025 19:51:43 +0530
Message-Id: <20250808142146.3181062-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250808141238epcas5p4a1e2767d73926bff7ca12b8afd66c36c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250808141238epcas5p4a1e2767d73926bff7ca12b8afd66c36c
References: <CGME20250808141238epcas5p4a1e2767d73926bff7ca12b8afd66c36c@epcas5p4.samsung.com>

This series adds clock support for the CMU_M2M block.

Patch[1/3]: dt-bindings: clock: exynosautov920: add m2m clock definitions
        - Adds DT binding for CMU_M2M and clock definitions

Patch[2/3]: clk: samsung: exynosautov920: add block m2m clock support
        - Adds CMU_M2M clock driver support

Patch[3/3]: arm64: dts: exynosautov920: add CMU_M2M clock DT nodes
        - Adds dt node for CMU_M2M

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---

Raghav Sharma (3):
  dt-bindings: clock: exynosautov920: add m2m clock definitions
  clk: samsung: exynosautov920: add block m2m clock support
  arm64: dts: exynosautov920: add cmu_m2m clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 13 ++++++
 drivers/clk/samsung/clk-exynosautov920.c      | 45 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  5 +++
 4 files changed, 84 insertions(+)


base-commit: b7d4e259682caccb51a25283655f2c8f02e32d23
-- 
2.34.1

