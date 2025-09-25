Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AC672639
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804985; cv=none; b=pgyM9btaWShAw9WaknO4m6e35K5v0a1h8YM3kRGM1m1wXSclVwOjXPJy/xP0mJk7UHKSqWTL/STKydWB+IFkRxPKd/wiWtN7CoPnRQpv1PBfWGPoCxn803aOI2jLIaleunZk9Tx97hCzWLY/rXlZyqCdP+dYBCOJsLVx1rojhuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804985; c=relaxed/simple;
	bh=98TN0eqspZg8HhsJxI5gHPKb1b3bqkPo2NSXdPxHu1A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=IO8F2jufwdafddKoEbU+7sMKevgHrGOcZf23YBFmNytOIIBETyliAr9rY9zfyoHgH62haR+RAE9Q/SNGxnwHRIB9bd202o3UhqddzoLBrzzdtIyLReVcfSl/b9MOfeqiJ5UYcdu2mqQOg62W8LS4i4If64A4nDJExyqzqZ2fwIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=O8rYNWpM; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="O8rYNWpM"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250925125615epoutp023fd8b6f5dedb0d2a248ba217ab0dfd1c~oh85ocfZW2175621756epoutp02q
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 12:56:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250925125615epoutp023fd8b6f5dedb0d2a248ba217ab0dfd1c~oh85ocfZW2175621756epoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758804975;
	bh=v5cH9LES7CXkOL+qaPhX/B3bxNvyiZkJjrfEZit5rpI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=O8rYNWpMxFP/cm/PjjKgktqBRxE/aLnp4vP9DJPBLC/5+oQ7JOo3OmCGnenx8GB8L
	 APWa+fUC4Vlc5K0/SD2OBkpmHBmLXllA74wKiWDe6MswGUltlrelgDSlkP8DveRW4i
	 Oalp5TRpiZrCbkaswT/scaplIvouBcICXvyxWnAo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250925125613epcas5p254231a146bfd35bc25fe4b5a9d068153~oh84jUPFq1889718897epcas5p23;
	Thu, 25 Sep 2025 12:56:13 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cXYcY1cm3z6B9m9; Thu, 25 Sep
	2025 12:56:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250925125612epcas5p3c8ae07ba60294f861aaaa79b1a1d7613~oh83T6-vM0858208582epcas5p3k;
	Thu, 25 Sep 2025 12:56:12 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250925125606epsmtip247b2865e7da971a49bf7e81841bbf39d~oh8x4J7r41150411504epsmtip2A;
	Thu, 25 Sep 2025 12:56:06 +0000 (GMT)
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
Subject: [PATCH 0/3] Add clock support for CMU_MFC
Date: Thu, 25 Sep 2025 18:34:54 +0530
Message-Id: <20250925130457.3476803-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925125612epcas5p3c8ae07ba60294f861aaaa79b1a1d7613
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250925125612epcas5p3c8ae07ba60294f861aaaa79b1a1d7613
References: <CGME20250925125612epcas5p3c8ae07ba60294f861aaaa79b1a1d7613@epcas5p3.samsung.com>

This series adds clock support for the CMU_MFC block.

Patch[1/3]: dt-bindings: clock: exynosautov920: add mfc clock definitions
        - Adds DT binding for CMU_MFC and clock definitions

Patch[2/3]: clk: samsung: exynosautov920: add block mfc clock support
        - Adds CMU_MFC clock driver support

Patch[3/3]: arm64: dts: exynosautov920: add CMU_MFC clock DT nodes
        - Adds dt node for CMU_MFC

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
This patchlist is dependent on patches to add clock support for CMU_M2M
Link to M2M patches: https://lore.kernel.org/all/20250915095401.3699849-1-raghav.s@samsung.com/

Raghav Sharma (3):
  dt-bindings: clock: exynosautov920: add mfc clock definitions
  clk: samsung: exynosautov920: add block mfc clock support
  arm64: dts: exynosautov920: add cmu_mfc clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 13 ++++++
 drivers/clk/samsung/clk-exynosautov920.c      | 45 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  5 +++
 4 files changed, 84 insertions(+)


base-commit: b5a4da2c459f79a2c87c867398f1c0c315779781 
-- 
2.34.1

