Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB8184A2B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 04:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491844; cv=none; b=gW+VIUxBRZLrxEvI/aOdIWu8Kv0Up1q5Vzn4FQiLzw/hntvjdhSG5HY5rDgqhZO2S/r4gIEvD2LaB75WtlLiK86TKj/7MdKuE24QT0nr/ADDeA8rKGJo2rLSx5L/h8sclTkStgk4NLClyWVDn+WCQLahldXu/KgCf/L6QVt+4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491844; c=relaxed/simple;
	bh=GGMEHVB0X2VGIc4wzUyfGmQwSg52QCIC5HEXNyGM8To=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=TtgYE/x7zTaOBoP3H306+VVcKaMNuOWX2AEqS1zbW/k5a+guZ2PBiuyMXYGrLWhM5ZgIjNKiqJ/AWAabxmQS9zGUJ1/WQ6DpKkZQAk7gEa+zcQerPWN04JqVg0r9Kx0HX0KIQ694+NUjA3Qe8MswqXlTH7YHi3xgChvKPfjgEEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hs6f1N5I; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hs6f1N5I"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250818043719epoutp01b3e38f2757de22549f8c2d1b9d7af3e1~cwobTKQ0y0361903619epoutp01S
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 04:37:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250818043719epoutp01b3e38f2757de22549f8c2d1b9d7af3e1~cwobTKQ0y0361903619epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491839;
	bh=44MXY/Ntu9rAF0ovbjOJnvuaxkF7loC1JC6bTAe9rcc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=hs6f1N5IFuWk+6F5dtOPgis0vajdlWb4bFzF6EZRtUBVaHfpqrLJBxqSBsHDZKBT5
	 /+rsGn7ltJQhYRWmKrNxZBVrFXUCdRALJQY8zXdS4dWcoKrdxSRj7civ/mQSjEkLCz
	 7WWIA4dGzeIvz5Ob5KdBV6bfzRa5QfZsBIzhMQ8I=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250818043718epcas5p3efbcae916de49e498b30a4a88463536a~cwoat_LHK0408004080epcas5p3U;
	Mon, 18 Aug 2025 04:37:18 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c50LG6cnmz6B9mL; Mon, 18 Aug
	2025 04:37:10 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250814140956epcas5p480aa24441933523484da5c241a201d3c~bp3QEJitT1225312253epcas5p4t;
	Thu, 14 Aug 2025 14:09:56 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814140952epsmtip2b069f926cc266c22788710b6b7b5e597~bp3MNOvQB1162411624epsmtip2h;
	Thu, 14 Aug 2025 14:09:52 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 00/12] Add FSD CSI support
Date: Thu, 14 Aug 2025 19:39:31 +0530
Message-ID: <20250814140943.22531-1-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814140956epcas5p480aa24441933523484da5c241a201d3c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814140956epcas5p480aa24441933523484da5c241a201d3c
References: <CGME20250814140956epcas5p480aa24441933523484da5c241a201d3c@epcas5p4.samsung.com>

FSD CSI(Camera Serial Interface) IP bundles Link controller and DMA
controller for receiving frames. FSD SoC has 12 instances of CSI IP and
3 D-PHY. 4 instances of CSI IP use 1 D-PHY.

This patch series does the following:
1) Refactor the imx-mipi-csis driver to support platform specific
clock names and interrupt handlers through device specific data
(struct mipi_csis_info).
2) Add FSD CSI link controller support in imx-mipi-csis driver.
3) Introduce a new media driver for FSD CSI DMA providing support for
video capture and streaming.
 
These patches were tested on the FSD platform using the
capture_raw_frames application.

Changes since v1:
1. Addressed review comments from Laurent Pinchart to integrate the
with imx-mipi-csis.c to handle the CSIS and expose it as a subdev.

Here is the link to v1 patch for reference:
https://patchwork.kernel.org/project/linux-media/patch/7e7832c16925386b771ddb7e00e08661115aa0ea.1668963790.git.sathya@samsung.com/

Inbaraj E (12):
  dt-bindings: clock: Add CAM_CSI clock macro for FSD
  clk: samsung: fsd: Add clk id for PCLK and PLL in CAM_CSI block
  dt-bindings: media: nxp: Add support for FSD SoC
  arm64: dts: fsd: Add CSI nodes
  media: imx-mipi-csis: Move clk to mipi_csis_info structure
  media: imx-mipi-csis: Move irq flag and handler to mipi_csis_info
    structure
  media: imx-mipi-csis: Add support to configure specific vc
  media: imx-mipi-csis: Add support to dump all vc regs
  media: imx-mipi-csis: Add support for FSD CSI Rx
  dt-bindings: media: fsd: Document CSIS DMA controller
  arm64: defconfig: Enable FSD CSIS DMA driver
  media: fsd-csis: Add support for FSD CSIS DMA

 .../bindings/media/nxp,imx-mipi-csi2.yaml     |   88 +-
 .../bindings/media/tesla,fsd-csis-media.yaml  |   74 +
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/tesla/fsd-evb.dts         |   96 +
 arch/arm64/boot/dts/tesla/fsd.dtsi            |  552 ++++++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/samsung/clk-fsd.c                 |   28 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |  354 +++-
 drivers/media/platform/samsung/Kconfig        |    1 +
 drivers/media/platform/samsung/Makefile       |    1 +
 .../media/platform/samsung/fsd-csis/Kconfig   |   16 +
 .../media/platform/samsung/fsd-csis/Makefile  |    3 +
 .../platform/samsung/fsd-csis/fsd-csis.c      | 1730 +++++++++++++++++
 include/dt-bindings/clock/fsd-clk.h           |   13 +
 14 files changed, 2890 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
 create mode 100644 drivers/media/platform/samsung/fsd-csis/Kconfig
 create mode 100644 drivers/media/platform/samsung/fsd-csis/Makefile
 create mode 100644 drivers/media/platform/samsung/fsd-csis/fsd-csis.c

-- 
2.49.0

