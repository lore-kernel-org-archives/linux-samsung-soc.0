Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C2E17C203
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728285518; cv=none; b=W/8LzIXVUNxr5K2RxJg0JaXM3iJ2N40Vwe41yj1JzAkNwP6UwsLx2L1ZGwKKdjn+fgNzT2ftf48JihOpqwdAdQ9ZcWcS1RfxpMTUK3R1yn178BlYGoryh++avM6KQI3uwMVXlcHN9EodTdyPL1Fra1zkFhcwX1oMaHBKj0Ll8Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728285518; c=relaxed/simple;
	bh=8muKe8CvgfsWv3Dl1vEz215E9DNNoVOn6i8IAuo0vvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=HZv9TisJUp9Nvs55UWxZ0bnZZfxQgJqJ562/V/71FjfCXBHYYQ4TnJqzFmWl0Jo2R8AUzKvrAIXlmdzcdQXictEMAtWQaHDNnOZLuXM6BTfgXeJXIJ3sHt4SHpx7sCp3Upbs0lHSaHxdUYUGz6i34gho9jv/KdWSL1tI3sF5AsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=isOdq89I; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="isOdq89I"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241007071835epoutp03b20274dc746e1fa30339ce7b71515877~8GoT_A05m2490724907epoutp03d
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:18:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241007071835epoutp03b20274dc746e1fa30339ce7b71515877~8GoT_A05m2490724907epoutp03d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728285515;
	bh=uX9eGp3VfpYsCg0o3f5LscLulThNY4S16yjE7ISD1RI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=isOdq89IxXenYmtgwI51eJMJLk1NrWmJeplyKOXs7/1PUAEpO5OWs7xXYwY3cTjqc
	 pp+qKjVHhCz3iiIHxeWLUdmx0GMqRF4KOWXHJYJ/qD+wS2jemRQyBSd9htPJgcyWOz
	 F45GII/4ZmwVEvQgGHy7ynvTsH5zRbxvbe2jFE70=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20241007071834epcas2p3e458af707d681c652345a4609f2e0cbb~8GoTPmOTC2499324993epcas2p3K;
	Mon,  7 Oct 2024 07:18:34 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.91]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XMVqt2hlxz4x9Q2; Mon,  7 Oct
	2024 07:18:34 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	1F.C7.09811.A4B83076; Mon,  7 Oct 2024 16:18:34 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241007071833epcas2p213100b34fd5a8192497a41e2e455947a~8GoSj9-nF1011810118epcas2p2H;
	Mon,  7 Oct 2024 07:18:33 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241007071833epsmtrp2bc2d62ec215989eee6d8d7b8c58af138~8GoSizoGj3077230772epsmtrp2V;
	Mon,  7 Oct 2024 07:18:33 +0000 (GMT)
X-AuditID: b6c32a48-84fb870000002653-1d-67038b4a5f09
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	27.7B.07371.94B83076; Mon,  7 Oct 2024 16:18:33 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241007071833epsmtip16e13075390a8cf57ce8a1f090ff356e9~8GoSTPLip0918209182epsmtip1E;
	Mon,  7 Oct 2024 07:18:33 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v2 0/3] add clocks support for exynosauto v920 SoC
Date: Mon,  7 Oct 2024 16:18:26 +0900
Message-ID: <20241007071829.3042094-1-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIJsWRmVeSWpSXmKPExsWy7bCmma5XN3O6wd4XQhYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFHZNhmpiSmpRQqpecn5KZl5
	6bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAdyoplCXmlAKFAhKLi5X07WyK8ktL
	UhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxMgQoTsjOurr/HUrCRteLdqx1MDYxz
	WLoYOTkkBEwk/v+dyt7FyMUhJLCDUeL2+WZGCOcTo8StvZ3MEM43RonZVz+wwbT07f/NBJHY
	yygxd/ZBVgjnI6PEvdn7gfo5ONgEdCX+/HMAiYsI7GGS2HJ+CVgHs8BZRom7cxawg4wSFnCS
	WP7gH9hYFgFViQ/fHoDFeQXsJbpPX4BaJy9x/fFRJoi4oMTJmU/ALmcGijdvnQ12n4RAK4fE
	8kdvmUA2Swi4SNw5HAvRKyzx6vgWdghbSuLzu71QM/MlJl9/ywTR28Aoce1fNzNEwl5i0Zmf
	7CBzmAU0Jdbv0ocYqSxx5BbUWj6JjsN/2SHCvBIdbUIQjWoSn65chhoiI3HsxDMo20Pi4swP
	rCC2kECsxLXmbawTGOVnIXlmFpJnZiHsXcDIvIpRLLWgODc9tdiowAQeq8n5uZsYwWlVy2MH
	4+y3H/QOMTJxMB5ilOBgVhLhjVjDmC7Em5JYWZValB9fVJqTWnyI0RQYvBOZpUST84GJPa8k
	3tDE0sDEzMzQ3MjUwFxJnPde69wUIYH0xJLU7NTUgtQimD4mDk6pBqYk/S2XNCaF60av+MNx
	TCtAbv//r3+PWxRqhx4xvLrt8ue7Ms8Yj07b3ih84fgGk8AHVx8/vBN5VZejgEM/QeLgLhPb
	eTt3HpJ17rukeCz77tyw9LXyUzY8y9hqf+/wg83R8bGMd0+WGzgtPtQ2S2PV61sKFfzHq7Wu
	Rt45YuGdePja59liM7ffzgrasuaOyy8uQ86GlgUuh6dJ1K2Vblg8ZckS+zDTeAup3nmac67+
	vOy3bu0H4Yqc1YdnzIjnO3K3Y2uu3mvjvR99ZP8sYhLdv2eFamTvrdrlj9ZGZ97edGKBfvLJ
	xU0T8xmMHDfM7pT+MfX1VBamDcZf+E+fLGXz0TkzY2eXxwuvP9MKpyUefanEUpyRaKjFXFSc
	CAB9ssMwNAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSnK5nN3O6weF+M4sH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksWhatp7Jgc/j/Y1Wdo9NqzrZPDYvqffo27KK0ePzJrkA1igum5TUnMyy1CJ9uwSujKvr
	77EUbGStePdqB1MD4xyWLkZODgkBE4m+/b+Zuhi5OIQEdjNKLNh0iAkiISOxseE/O4QtLHG/
	5QgrRNF7Rol5uzcAdXNwsAnoSvz55wASFxE4xCQx8fNTFhCHWeAyo8Sxu5OZQbqFBZwklj/4
	xwZiswioSnz49gBsKq+AvUT36QtsEBvkJa4/PsoEEReUODnzCdh5zEDx5q2zmScw8s1CkpqF
	JLWAkWkVo2RqQXFuem6yYYFhXmq5XnFibnFpXrpecn7uJkZwqGtp7GC8N/+f3iFGJg7GQ4wS
	HMxKIrwRaxjThXhTEiurUovy44tKc1KLDzFKc7AoifMazpidIiSQnliSmp2aWpBaBJNl4uCU
	amB6ZJShdEZ799kZfewRywu9A9R/Om7kP1RWefWhzZ5ATy/HrbO2Fy3ZnHVOOf563/Gdphf3
	za2N0vZg3n00SVlqg29t1j/pv8keU45v9Z9u0+53NvZ/Os8sTcM5teau3kpBrasMG77ZrtXT
	jVkiw2wb+8V60sfbO80l+wKOmH/cNvNu9ZGH5jMKOvbdylsr7HfC+9rRr6sDfX8mX3GeHrBo
	yXS/rrxLSst7DM1u7P7SbXFyraWa4Km1rPOc3pvHRnfJ/dDIM9MIZfs8i8PkqlB5gJVcFPuV
	d3YXeZe/3TFxz78kiyTj5h/HfE83TZrmHB0UP+mx6jFtyQ2zVszJfnnFZUbJvuNPdGXXKit7
	Xj2uxFKckWioxVxUnAgAv7QsXuQCAAA=
X-CMS-MailID: 20241007071833epcas2p213100b34fd5a8192497a41e2e455947a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007071833epcas2p213100b34fd5a8192497a41e2e455947a
References: <CGME20241007071833epcas2p213100b34fd5a8192497a41e2e455947a@epcas2p2.samsung.com>

This patchset adds the CMU block below to support exynosauto v920 SoC.
- CMU_PERIC1
- CMU_MISC
- CMU_HSI0/1

Changes in v2:
 - Rebase the patch to reflect the latest fixes

Sunyeal Hong (3):
  dt-bindings: clock: exynosautov920: add peric1, misc and hsi0/1 clock
    definitions
  clk: samsung: exynosautov920: add peric1, misc and hsi0/1 clock
    support
  arm64: dts: exynosautov920: add peric1, misc and hsi0/1 clock DT nodes

 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  50 +++
 drivers/clk/samsung/clk-exynosautov920.c      | 290 ++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  47 +++
 3 files changed, 387 insertions(+)

-- 
2.46.0

