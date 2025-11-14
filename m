Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C632DF128
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 06:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763100324; cv=none; b=QNZRbWEEtVObZEgoylhJGeSkAuJpLqauDzkFghX7fmI2cO7MXWSpR/8DwPPGugnRvnBn48s0/ggkIyE/wHXypoWleqGGKNvgOOjU8kiNeagy+PAwbS+MCyD17H5oXMaEtsKWUW2dQ87dIlU9L7QvMG+rT1AEJZracxJMTRpez9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763100324; c=relaxed/simple;
	bh=5XM25Irfgey62gfRcMMyLesa52TU3QMHcB3U1Zbx0Bs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=hWjakGvtrRwfrmevy0cxeOkQNpY34Vnq6gtJXJ50FOyXLQ22dxMDSjUBERm1s2SO4oVxha0/EwY0OVaCQz5I6Ij1SdUMTUH6e+9gKJbRD8si4zh4HgiFk1J+0sHXb/7AphWm3u6u5UX2evthrfN3JEgUakareZt+cLj0wFvv3oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CjV1nJ3F; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CjV1nJ3F"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251114060519epoutp02d2995bb44e8b450fdc6e47691d10039d~3ymYuw25h2471624716epoutp02f
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 06:05:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251114060519epoutp02d2995bb44e8b450fdc6e47691d10039d~3ymYuw25h2471624716epoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763100319;
	bh=foyN9VFEd5R0A8quCBtbbHsWARJaVaEQr2kOKG08j/I=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CjV1nJ3FIGUg8MzxNHtK0U+0NJc7tqDwC6fcOtCraMcS8TqxLP9x/B9gECCEMHfIT
	 kDLQDleS0q0N6+tBA8DP0zCPzIjJAySG5j/CO/NGX20WNtC7IbI2i5we4NMc6LlgRU
	 UVqVQxil0YkcZ6HAfH7El0s5urIwPJf9QsBimLNU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251114060518epcas2p4c8439432d520565644955a31d6c77fc0~3ymYALs0M1660016600epcas2p4J;
	Fri, 14 Nov 2025 06:05:18 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.200]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d767L0cpTz3hhT7; Fri, 14 Nov
	2025 06:05:18 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20251114060517epcas2p354291681ebb7d2922c09960e33aa7de5~3ymWmajVk1718617186epcas2p3Y;
	Fri, 14 Nov 2025 06:05:17 +0000 (GMT)
Received: from KORCO118486 (unknown [12.80.208.104]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251114060516epsmtip2b0a9c0c558ff57d67c33a178db682ec7~3ymWfEl6q0508905089epsmtip2c;
	Fri, 14 Nov 2025 06:05:16 +0000 (GMT)
From: "Sanghoon Bae" <sh86.bae@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <vkoul@kernel.org>, <alim.akhtar@samsung.com>,
	<kishon@kernel.org>, <m.szyprowski@samsung.com>, <jh80.chung@samsung.com>,
	<shradha.t@samsung.com>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <649f8e90-d99b-401a-bb0f-ef0cf9c4fe7f@kernel.org>
Subject: RE: [PATCH 2/4] dt-bindings: phy: Add PCIe PHY support for
 ExynosAutov920 SoC
Date: Fri, 14 Nov 2025 15:05:16 +0900
Message-ID: <000601dc552c$a63e6060$f2bb2120$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQISOccZb2Ez4IvEWuwZme1oXG7+3gIkR40QAdlJHE0CkODhjLRRbuBw
Content-Language: ko
X-CMS-MailID: 20251114060517epcas2p354291681ebb7d2922c09960e33aa7de5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250926074017epcas2p18fb2fc616b92dc04ad9e018151c2ba29
References: <20250926073921.1000866-1-sh86.bae@samsung.com>
	<CGME20250926074017epcas2p18fb2fc616b92dc04ad9e018151c2ba29@epcas2p1.samsung.com>
	<20250926073921.1000866-3-sh86.bae@samsung.com>
	<649f8e90-d99b-401a-bb0f-ef0cf9c4fe7f@kernel.org>

> > Since the Exynosautov920 SoC uses the Samsung PCIe PHY, add support
> > for it in the Exynosautov920 PCIe PHY bindings.
> >
> > The Exynosautov920 SoC includes two PHY instances: one for a 4-lane
> > PHY and another for a 2-lane PHY. Each PHY can be used by separate
> > controllers through the bifurcation option. Therefore, from 2 up to 4
> > PCIe controllers can be supported and connected with this PHY driver.
> 
> 
> Describe hardware, not driver.
I will describe about the Exynosautov920 SoC PCIe hardware.

> > PCIe lane number is used to distinguish each PHY instance.
> > This is required since two PHY instances on ExynosAutov920 is not
> > identical.
> > On PHY driver code, need to check each instance and different settings.
> 
> 
> Describe hardware, not driver.
I will describe about the Exynosautov920 SoC PCIe hardware.

> > @@ -19,6 +19,7 @@ properties:
> >        - samsung,exynos5433-pcie-phy
> >        - tesla,fsd-pcie-phy0
> >        - tesla,fsd-pcie-phy1
> > +      - samsung,exynosautov920-pcie-phy
> 
> Messed order.
Will fix the order

> > @@ -42,6 +47,7 @@ allOf:
> >              enum:
> >                - tesla,fsd-pcie-phy0
> >                - tesla,fsd-pcie-phy1
> > +              - samsung,exynosautov920-pcie-phy
> 
> Messed order.
Will fix the order

