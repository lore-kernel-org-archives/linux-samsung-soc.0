Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2E1382F33
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2026 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280694; cv=none; b=ulH67NzdehSBj0NtJee9dB9ToWnKbjXqvWt49JJdXNxHw0F5tQ9+BtwctRPBiMr9sIR/PFkUME5MHQE/jvBb/flDJhNr74m8GCjCBYeQ3ff23oY8/sZ0oEsFQ5c8kStzqyXbPb/IxDMU6bR2tXQLIY4wsEiq49L9Pga4Lmaa2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280694; c=relaxed/simple;
	bh=C4h9EdJZYlADWuf36oAoqn7TGOV0koyiTZfT0PDJDNM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=pzEOI13FYbZdUQS06fb/6L9MRYlya7N14agB+e5YUtqza3dA9B5bv0TWCE+J9lW62PQB21/xqzjPqIhEcTeKMEX/9z83m0Qh5gFfeYtCdDOjRZyALjsw8jeQ/aLUW3DslYmsd1n80R9sjkMh3PuDouDdZ/XED1nD+TbBCP/4/+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ptBKKfSx; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ptBKKfSx"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260612161130epoutp02439c4027e6d80e9649f219fd81ccb2b7~4YVmtd5om2073620736epoutp02U
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2026 16:11:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260612161130epoutp02439c4027e6d80e9649f219fd81ccb2b7~4YVmtd5om2073620736epoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781280690;
	bh=ZSlvOETrwTn2jxfzGFRxLhh+UJTgzZUXiHMZq9fMGA8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ptBKKfSxUycgJ5M07OQHuV24JKqNuo891BpbY7ia707o9x4HGPxEWZAC+DsEDd6Fw
	 livBDHhP9/yJo82uSXMGTJimGRQkzaRdQXEhGm3ZOoEbIZ3wgf9OMNQoJcyLbEULOV
	 bgLOe5rhSbDarTlsL1Fu4OVEDHv3twjk7F3fePtE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260612161129epcas5p3e7ede89e23bee40f35bdaacb9cfbb384~4YVl4WjcP1858918589epcas5p3H;
	Fri, 12 Jun 2026 16:11:29 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gcPdr5x8Yz6B9m6; Fri, 12 Jun
	2026 16:11:28 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260612161128epcas5p2fe6ebf4b1a7b3ad1794804768180cbdd~4YVkfHhST0551705517epcas5p2F;
	Fri, 12 Jun 2026 16:11:28 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260612161125epsmtip17a32a09a1f76610c7c663861c61459eb~4YVifqoaT2559525595epsmtip1b;
	Fri, 12 Jun 2026 16:11:25 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 0/5] Add minimal Exynos8855 SoC support
Date: Fri, 12 Jun 2026 22:00:15 +0530
Message-Id: <20260612163020.411761-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260612161128epcas5p2fe6ebf4b1a7b3ad1794804768180cbdd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260612161128epcas5p2fe6ebf4b1a7b3ad1794804768180cbdd
References: <CGME20260612161128epcas5p2fe6ebf4b1a7b3ad1794804768180cbdd@epcas5p2.samsung.com>

This series adds initial support for the Exynos8855 SoC and also
initial SMDK board support. 

Exynos8855 has octa-core CPUs, a combination of Cortex-A720 and Cortex-A520,
arranged in 3 clusters. And other peripheral for mobile application.

This initial support consists of CPUs, pinctrl and related nodes
needed for initial kernel boot.

With these patches, kernel can boot using initramfs till file system mounts.

More platform support will be added in near future, clock driver to go next.

Known issue: uart driver probe fails because of clk being not available yet.

Alim Akhtar (5):
  dt-binding: ARM: samsung: Add Samsung Exynos8855
  dt-binding: pinctrl: samsung: Add exynos8855-pinctrl compatible
  pinctrl: samsung: Add Exynos8855 pinctrl configuration
  arm64: dts: exynos: add initial support for Samsung Exynos8855 smdk
  MAINTAINERS: Add entry for Samsung Exynos8855 SoC

 .../bindings/arm/samsung/samsung-boards.yaml  |   6 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   1 +
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/exynos8855-pinctrl.dtsi   | 581 ++++++++++++++++++
 .../arm64/boot/dts/exynos/exynos8855-smdk.dts |  37 ++
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    | 214 +++++++
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 124 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 10 files changed, 974 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi


base-commit: b99ae45861eccff1e1d8c7b05a13650be805d437
-- 
2.34.1

