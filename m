Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE4030ACE2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 04:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756270752; cv=none; b=HL6OKTG/V3hNmtuc2uXxRHr+JkoWoEm8NIXwUULZFLSWThTt1BU4s5cV2tCiWxYiAXAuINfFWIIbDwHkHHS9OFNEvyZvAU+0wlP9bRCZXNRVFq6hlYegYt3LNbws7jYm5gQgBtrbAUt9sRs/kpIs7PMBWa8DZvlJaJ2fAKWdExs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756270752; c=relaxed/simple;
	bh=mmNYAWq/BXp55PDPZ2SXY6HRIGRYCvE3HMe9d5PEs+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=BKAhh1g4qS+zlxYyPMkWpgy3hI/atgcRJxeqr3nB1lDzGI/16VXACJt/BH1FgC29Jkd+ojx8EpdfawZNQHvPzwwXwKiTlAHPS4OZozU4TShEmpNgtk5yhL5F8fTQikgXrKduDtkGSZO58GldheohRCgr+A3aGl/7qRDkhRns+rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PFozBq2P; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PFozBq2P"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250827045907epoutp041d9430c55701b75bbb95fe339e9c0417~fhvCNQa021816618166epoutp04J
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250827045907epoutp041d9430c55701b75bbb95fe339e9c0417~fhvCNQa021816618166epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756270747;
	bh=WUXp9lG7X26uP7murNUm5kgTEUw+iAz/NoMGgwgkXEI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=PFozBq2PABiLrMMGdNDfnYS0qeUAZ4gQ/TyGCL4iVM/2raVzLyTDmHy9iKyTQvr2I
	 VLjPrOhuXNlcB794I9/ucdisI+ZpeE4DZTYQw1THeWQzNtgsuv+x35C3mlrDw2hUU+
	 hr46S6zlLBPy9iBVAAsHikc/8YunaH5vbuV0iPzA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250827045906epcas2p40026048003f6d8216bc9caba963b5182~fhvBe0NlJ3229232292epcas2p4z;
	Wed, 27 Aug 2025 04:59:06 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.102]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cBXPP70F0z6B9mK; Wed, 27 Aug
	2025 04:59:05 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7~fhvARTiXQ1734917349epcas2p2u;
	Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
Received: from mclaren.dsn.sec.samsung.com (unknown [10.229.9.108]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250827045905epsmtip2fc5355cf5088afd226e12a4f77c10640~fhvAK8HCh1766017660epsmtip2D;
	Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
From: Kisung Lee <kiisung.lee@samsung.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Mauro Carvalho
	Chehab <mchehab@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Kisung Lee <kiisung.lee@samsung.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 0/4] Add DT bindings and driver code for Scaler
Date: Wed, 27 Aug 2025 04:47:16 +0000
Message-ID: <20250827044720.3751272-1-kiisung.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7
References: <CGME20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7@epcas2p2.samsung.com>

This patch series adds device tree bindings and driver support
for the ExynosAuto scaler hardware. It adds YAML binding docs,
updates Kconfig and Makefile, and provides initial driver
code to register the Scaler device as a V4L2 video node for
video processing.

Kisung Lee (4):
  dt-bindings: soc: samsung: scaler: exynos: Add ExynosAutov920
    compatible
  media: samsung: scaler: add scaler driver code
  arm64: dts: exynosautov920: enable support for scaler device
  media: samsung: scaler: Add Kconfig and Makefile

 .../bindings/gpu/samsung-scaler.yaml          |    1 +
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   22 +
 drivers/media/platform/samsung/Kconfig        |    1 +
 drivers/media/platform/samsung/Makefile       |    1 +
 .../platform/samsung/v920-scaler/Kconfig      |   17 +
 .../platform/samsung/v920-scaler/Makefile     |    9 +
 .../samsung/v920-scaler/scaler-core.c         | 3640 +++++++++++++++++
 .../samsung/v920-scaler/scaler-regs.c         |  744 ++++
 .../samsung/v920-scaler/scaler-regs.h         |  406 ++
 .../platform/samsung/v920-scaler/scaler.h     |  621 +++
 .../v920-scaler/videodev2_exynos_media.h      |  162 +
 11 files changed, 5624 insertions(+)
 create mode 100644 drivers/media/platform/samsung/v920-scaler/Kconfig
 create mode 100644 drivers/media/platform/samsung/v920-scaler/Makefile
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-core.c
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-regs.c
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-regs.h
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler.h
 create mode 100644 drivers/media/platform/samsung/v920-scaler/videodev2_exynos_media.h

-- 
2.25.1

