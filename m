Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A588363C69
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763558077; cv=none; b=IGqC0NyLO+oueF2G13G6Z7lEL92a5FTkFZHUXONx0AfsrcW9Xv4wIhcUjrhvu2uDM5d2p5kPIjYN7Cz1ZJtnFPxU0GHJovZDa13vm8qrRtypqC5vTLEDuN03D5HhSgcStoDSDJLgWCSpiXfH7mDddrB60b1XyrFsPy4I2xQFFzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763558077; c=relaxed/simple;
	bh=lM1FFVYGG5sVmGCJdUBpFnhHa3ZMvumPKC3jDxptqIw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=mm6CSBe3N/hAiOWSHlLSPby5EJPpzRutfk5zF8iTCVULQT6zOpmGF51DDO5LMgvUchLIEuxD6TivezNhwGL11jAhHmMPkbGiQcbWSRbLcdpF+nJiI3b0MFHxjXk+BMarhkMbvfs5DVGsbzDIjjxJ9r308vj5L+MBioAh/Kt/PQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=oNAVTcsY; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oNAVTcsY"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251119131426epoutp0392a7a4814cc635953328887dad31dbc7~5arfGyl1M3241032410epoutp035
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 13:14:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251119131426epoutp0392a7a4814cc635953328887dad31dbc7~5arfGyl1M3241032410epoutp035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763558066;
	bh=bLpW5qbNlOAyZrV0HryRmDY/8NDIwEwROLHp5IJHhaE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=oNAVTcsYVm1+GLAH/ozHljvXSy/hwLhQgbSI9c5DkKPOHB7r3Vz7T7vYblzwgnegT
	 1c/qlQTu/mLwuJAblmwJJ6cAqHBTRMaTXW710vQg3FmbzNZCzvNDrRiGSYHpcLan/m
	 crsTD1XRRuBiatXZFd573Zy7soRxRuXGsPBrAZ5I=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251119131425epcas5p33febd27e982d546d4e6db9ec38627dbb~5areYrE9x3149731497epcas5p3a;
	Wed, 19 Nov 2025 13:14:25 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dBMQ86Rbyz2SSKX; Wed, 19 Nov
	2025 13:14:24 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714~5arc--Hu72519125191epcas5p4m;
	Wed, 19 Nov 2025 13:14:24 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251119131404epsmtip10da0ffddcca29538b5d5500d4b288960~5arKcXT9c2550425504epsmtip1v;
	Wed, 19 Nov 2025 13:14:03 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com,
	kitak81.kim@samsung.com
Subject: [PATCH v2 0/3] Add basic device tree support for the Axis ARTPEC-9
 SoC
Date: Wed, 19 Nov 2025 18:42:59 +0530
Message-Id: <20251119131302.79088-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714
References: <CGME20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714@epcas5p4.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Add basic device tree support for the Axis ARTPEC-9 SoC
which contains 6-core Cortex-A55 CPU and other several IPs.
This SoC is an Axis-designed chipset used in surveillance camera products.

This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.

This patch series includes below changes:
- Bindings document update for ARTPEC-9 board (patch #1)
- Device tree for ARTPEC-9 board (patch #2 and #3)

The patch series has been tested on the ARTPEC-9 EVB with
Linux Samsung SoC tree (for-next branch) and intended
to be merged via the `arm-soc` tree.

Pinctrl and UART DT-bindings are present in another patches which are listed below:
- https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git/commit/?id=e671a1bb5d1cf9ca4dbab61b9a3e1e77579f99ba
- https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=85f17e130dc7189acf03eb0f8e2455c4ea2c4f9e

---
Changes in v2:
- Decouple the device tree related patches which was present in v1 (Patch #5 to #7)
  Device tree related patches will be sent in separate series.

Link to v1: https://lore.kernel.org/linux-samsung-soc/20250917085005.89819-1-ravi.patel@samsung.com/
---

Ravi Patel (2):
  dt-bindings: arm: axis: Add ARTPEC-9 alfred board
  arm64: dts: axis: Add ARTPEC-9 Alfred board support

SungMin Park (1):
  arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support

 .../devicetree/bindings/arm/axis.yaml         |   6 +
 arch/arm64/boot/dts/exynos/axis/Makefile      |   3 +-
 .../boot/dts/exynos/axis/artpec9-alfred.dts   |  36 +++
 .../boot/dts/exynos/axis/artpec9-pinctrl.dtsi | 115 ++++++++
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi  | 277 ++++++++++++++++++
 5 files changed, 436 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi

--
2.17.1

