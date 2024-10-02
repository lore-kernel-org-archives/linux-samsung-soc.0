Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96A917BC9
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727847231; cv=none; b=h87vXrnfLg5UcM+Yvtewd1Id75mZlbgX5oEAmkVjbKy77oLz1rBwW8x51jjI/e0gdo2nPoJss8Rt8K3+M9NtAE1bKC/F+PSbKNEPdkXzL0RX4XbzGoF+uvG9EXpeBYEYiAxGhsWS+lOFog579cPnUL5MIXBgl2d+YV9nqPssFvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727847231; c=relaxed/simple;
	bh=ie5QYAFQRtq3h2qYr7v9pUgwFeZVT66CGy/JO2oThxE=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type:
	 References; b=a/aCQuG3b/RdHX6hGxqFFs6rEMmiUSDNE2dp3/w3/hzL2hmUMbv/MJ6Cs6SKHfJ+kQlUNi5M4D+//oUYQbuwMfJrj+E2Smv6Ju8+WkqUtu+iVSXBVdtQtEBuPeED8TBPlOBX8t/AkJ6b4+zzv1h7d1oIkayiVtOWlg7Z89PDXvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GC2ipXWh; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GC2ipXWh"
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241002053347epoutp01087ecacfaeae89abf93e95ec14e9c20d~6i_YDvFIY2636226362epoutp01W
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241002053347epoutp01087ecacfaeae89abf93e95ec14e9c20d~6i_YDvFIY2636226362epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727847227;
	bh=9HK36btNYg1/tmbbrN6xunt87oPhJWvmE+KCTOAPPqc=;
	h=From:Subject:Date:To:Cc:References:From;
	b=GC2ipXWhNzOMflQ1J+v/lqR1VhX3ga6vy1m8epOu+IE4KSs2ZfptHj5bo+BIJOuZp
	 L5Kku9Y0eyRYd0U1JcIBTWXMS/g7GvMPTFSrV11PFw7YxoHX0PgLKDWRBz7PQLfQ2y
	 Lb+XgYz73XcxZ+GqRBmZ+tA9rUmQ7aI7JkYOyhmE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241002053346epcas1p1e63e91262a98a7e498ab0d0a2fe1b65e~6i_XqhJa40159901599epcas1p12;
	Wed,  2 Oct 2024 05:33:46 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.133]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XJNlF46Xqz4x9Q9; Wed,  2 Oct
	2024 05:33:45 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
	FA.57.09398.53BDCF66; Wed,  2 Oct 2024 14:33:42 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241002053341epcas1p2b46acd87dacb4d4164402ae3ee02e968~6i_TJOz5M3276032760epcas1p2S;
	Wed,  2 Oct 2024 05:33:41 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241002053341epsmtrp222f0b6e2ca9859f9263fe8918a7562be~6i_TIg-H93067930679epsmtrp2P;
	Wed,  2 Oct 2024 05:33:41 +0000 (GMT)
X-AuditID: b6c32a39-5f9f8700000024b6-85-66fcdb352ef5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B1.74.08227.53BDCF66; Wed,  2 Oct 2024 14:33:41 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241002053341epsmtip18a5a9024db08b721a8633eacb6e948cf~6i_S7epg-1771117711epsmtip1T;
	Wed,  2 Oct 2024 05:33:41 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Subject: [PATCH WIP 0/7] drm/exynos: Add autov9 DPU code
Date: Wed, 02 Oct 2024 14:33:20 +0900
Message-Id: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACDb/GYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
	vPSU3UzU4B8JSMDIxNDAwMj3cTSknxLXUszwxSzREPLpFRTAyWg2oKi1LTMCrA50UrhngFKsbW
	1AEjPZZBcAAAA
To: Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,  David Virag
	<virag.david003@gmail.com>,  Sam Protsenko <semen.protsenko@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Kwanghoon Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmga7Z7T9pBsfuM1k8mLeNzWLS/Qks
	Fr1rrjJZnD+/gd1ixvl9TBbP+4DE8fePGR3YPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
	NSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoDCWF
	ssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgWmBXnFibnFpXrpeXmqJlaGBgZEpUGFC
	dsbrA5eZC26oVaxacpelgXGjXBcjJ4eEgIlE74otLF2MXBxCAjsYJW49ucME4XxilJj6fjoj
	SJWQwDdGifmP9WE6ls28B1W0l1HiwaS3UO2vGCXWvljADFLFJqAusaRtLTuILSxgIfHx92k2
	EJtFQFVi77OXLCA2r4CVxKbVt5khbEGJkzOfgMWZBeQltr+dwwwyVEJgBaPEnSsXwM4QETjN
	KPF/riJEkYfEjGfr2CFOEpb4vHsNG0TDR3aJBTs/sUAkXCQ29C9ihCl6dXwLVIOUxOd3e9kg
	7GyJox9h7BKJ67MWsULYxhL7l04G+pMDaJmmxPpd+hB7+STefe1hBQlLCPBKdLQJQZjyErc6
	yyEaRSXOPP0INdBDou3xT3ZIIMZKtJ08xzSBUX4Wko9nIfl4FsKuBYzMqxjFUguKc9NTiw0L
	TOGRmpyfu4kRnBK1LHcwTn/7Qe8QIxMH4yFGCQ5mJRHee4d+pgnxpiRWVqUW5ccXleakFh9i
	NAWG+0RmKdHkfGBSziuJNzSxNDAxMzI2sTA0M1QS5z1zpSxVSCA9sSQ1OzW1ILUIpo+Jg1Oq
	gamJJ+t018PEtUZ3RFNj1v5dGrvUTknry4IowYtfw76fZVNYvXxRRsHxIu3rSdLuiTye227l
	mk8uO1gc+mjV9QT19WsfRXa815aYEmz8h1MoNrVx8qcJyQ73l1X/OnKSpXt+0M65bO83uLc9
	2KE2l+WxqN6us/lrrMINmXyfTRBvLNqXssNKQ3zj8gd+CieMToYm9Xwrmum/VmZ+k0ybwowt
	yxh9zzc976kQ6lbcm3Vrhh9HzuGIzIkrvavruDWmbthxwfFJTUfxxr/b1TjXnHL/ytXuV7jW
	YyF3qKLwb9bdF9yj/xiqz11k+sx/RulFQd1LqzqCe9U+OyyvrlXzql7kwMb90yO99EnS3asn
	5yuxFGckGmoxFxUnAgDI7ZlAEgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSnK7p7T9pBhvuaVo8mLeNzWLS/Qks
	Fr1rrjJZnD+/gd1ixvl9TBbP+4DE8fePGR3YPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
	NYrLJiU1J7MstUjfLoEr4/WBy8wFN9QqVi25y9LAuFGui5GTQ0LARGLZzHtMXYxcHEICuxkl
	Tm1oY4JIiEp0XG5k7GLkALKFJQ4fLoaoeQFS848dpIZNQF1iSdtaMFtYwELi4+/TbCA2i4Cq
	xN5nL1lAbF4BK4lNq28zQ9iCEidnPmEBmcksoCmxfpc+SJhZQF5i+9s5zCDzJQRWMEq8PDsV
	zBEROMcoce3PXnaIKg+JGc/WsUMcJyzxefcatgmMArOQzJ2FMHcWkrkLGJlXMUqmFhTnpucW
	GxYY5aWW6xUn5haX5qXrJefnbmIEB7uW1g7GPas+6B1iZOJgPMQowcGsJMJ779DPNCHelMTK
	qtSi/Pii0pzU4kOM0hwsSuK83173pggJpCeWpGanphakFsFkmTg4pRqYjgk8UZlZkbZm85vQ
	s5N2ztnxS8Fe8s2rHV9cTjwzja7Y8Mm1+JL1o6tvb0xI3xFy2bSrRbxcyvpq2fbf+p+r7jKu
	DPzuJROr5Db/3yRdWdfcvMlfDWxXM7EdlXfT1TSYbFg509BMzHWu6rEmX2Ph8B83Ns5x3lHU
	zbQvuvlxyY75iyV7TJ9pCBxeFvAv4NIjvTnrfKym8y6+OD/11Xz904UFTGGvRXjmcE6ZvnkP
	39L/3z2mqP+OkctVumBlMptlbtJbs6+n4mZKK2n8nsB7wctOU/ZZ7GT7G+usH+2XWWlYGzZp
	9nSumzft8vgqmpVUv6uWLze7vmQxc3bl++TW1Q8YGfb8PrUw02eep5DkZSWW4oxEQy3mouJE
	ABDj/cPlAgAA
X-CMS-MailID: 20241002053341epcas1p2b46acd87dacb4d4164402ae3ee02e968
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241002053341epcas1p2b46acd87dacb4d4164402ae3ee02e968
References: <CGME20241002053341epcas1p2b46acd87dacb4d4164402ae3ee02e968@epcas1p2.samsung.com>

Disclaimer: This code is WIP, not even ready for review.
If you have no interest in Exynos DRM, don't waste your time to read
it.

1. why share this ugly code?

This patch is to share and discuss the necessary parts for recent
upstream of exynos dpu_dma, dpp[1]
Please don't look Patch 2-7, this is just proof that dpu_dma,
dpp works. (Also has build break!)
Also, since I don't have much experience in Linux kernel yet, I thought
it's better to share before going too wrong direction.
This patch is a code that successfully boots, modetest and drm from the
latest v6.12-rc1 base.

[1] https://lore.kernel.org/linux-samsung-soc/2e4d3d180f535e57d9cb98e7bac1d14b51ffc5d4.camel@gmail.com/

2. some want to help or discuss

-Naming problem
Q: What is best naming for files and Kconfig var?

As-is : exynos9_decon.c exynos_dpp.c exynos_dpu_dma.c

For DMA, there already exists an exynos_drm_dma.c, so I named it as
'dpu_dma' according to the IP manual.
But I'm considering make prefix 'exynosautov9_drm' for all or
'exynos_dpu'.

-DECON interface
Q: dpp_update(), dpu_dma_update() function are looks ok?

Origin vendor code split each channel to comaptible data(dma_fg0,
dma_g0, ...) using binding.
Problem is Exynos850 or each SOC has own dma,dpp wiring. (e.g. some
Exynos850 is not wiring with dma <-> dpp. they just dma <-> decon)

So I changed it to code level that decon call register setting
function.
Decon will control dpp, dma based on channel parameter using
dpp_update(), dpu_dma_update() function

-DP
I'm not familiar with almost all parts of DP. If someone is interested
in Exynos DP, any advice would be appreciated.

3. About exynosv9 arhitecture

In the case of the existing DRM 5 series, DECON played a role as CRTC
and sent data to the panel.
I don't know about the DRM 7 series, but the Exynos 8 and auto9 series have
DECON divided into three areas: DMA, DPP, and DECON, to started
supporting more channels and formats.

Exynos auto v9 has 

DPU_DMA - reads the image data from external memory, converts the image
into pixels, and transfers them to remaining display processing
pipeline
DPP (Display Pre-Processor) - frame data from image DMA and applies the
selected image processing function before transferring it to DECON
DECON (Display and Enhancement Controller) - same as previous decon
role.

and dma and dpp are wired with hardware (They can not mix with other
channel)

channel> sysMMU> DMA> DPP
=======================
ch0	MMU_0	GF0	GF0
ch1	MMU_0	G0	GF1
ch2	MMU_1	G1	GF2
ch3	MMU_1	GF1	GF3
ch4	MMU_2	VG0	VG0
ch5	MMU_2	G2	GF4
ch6	MMU_3	G3	GF5
ch7	MMU_3	VG1	VG1

note that exynos850 has 4 channel with different wiring.

4. Todos before RFC

- remove all vendor style code
- more features (resolution, format, plane)
- proper way register setting for dma, dpp channel
- make DP code to proper mainline code using helper functions

To: Inki Dae <inki.dae@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: David Virag <virag.david003@gmail.com>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
Kwanghoon Son (7):
      drm/exynos: Initial Exynosautov9 drm
      drm/exynos: Add Exynosautov9 decon
      drm/exynos: Add drivers on drv.c
      drm/exynos: exynos DPTX hw
      clk: samsung: exynoautov9: Add dptx cmu
      phy: samsung,dp-video-phy: Add exynosautov9 dp phy
      arm64: dts: exynosautov9: Enable drm

 arch/arm64/boot/dts/exynos/exynosautov9-dpu.dtsi   |  110 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |   30 +
 drivers/clk/samsung/clk-exynosautov9.c             |   35 +
 drivers/gpu/drm/exynos/Kconfig                     |   17 +
 drivers/gpu/drm/exynos/Makefile                    |    3 +
 drivers/gpu/drm/exynos/exynos9_decon.c             | 1765 +++++++
 drivers/gpu/drm/exynos/exynos_dpp.c                |   96 +
 drivers/gpu/drm/exynos/exynos_dpp.h                |  278 ++
 drivers/gpu/drm/exynos/exynos_dpu_dma.c            |  330 ++
 drivers/gpu/drm/exynos/exynos_dpu_dma.h            |   16 +
 drivers/gpu/drm/exynos/exynos_drm_dp.c             | 5038 ++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_dp.h             |  964 ++++
 .../gpu/drm/exynos/exynos_drm_dp_link_training.c   |  586 +++
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   11 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    3 +
 drivers/gpu/drm/exynos/regs-decon9.h               | 1244 +++++
 drivers/phy/samsung/phy-exynos-dp-video.c          |    9 +-
 include/dt-bindings/clock/samsung,exynosautov9.h   |    4 +
 18 files changed, 10537 insertions(+), 2 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241002-auto9-961d6a19be50

Best regards,
-- 
Kwanghoon Son <k.son@samsung.com>

