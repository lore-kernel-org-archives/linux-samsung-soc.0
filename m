Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F632BEC53
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128586; cv=none; b=R6oK4chke0b5uIocyQXl7HceiLcxtGoJHzbT5My5wM9HalVWv159I10kCxpvjaJuAevfhHHviT3XUSbv5VNO/pplctcwhR3NjUvsSJPTtIH/OWglL24NLEpKLSwaKpf+a3inHUvqKyS7J5AfwTnqlvxJqYW4gl4BqVTH1dVPuj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128586; c=relaxed/simple;
	bh=beV6pGHYRip3pTVz4OAPHmUeJL+BBZxjGxBozo4ZWno=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=g5VpJSzZWvg20hvVPFPK7wWUh9EklG7cIrxVrdbJ+2klD2O9nJvlhrVb3kPf2XCGbGC1IfuaOVj1oS1BXhnJzdWhJA82resNMl24Zf4SK4gcTK+D3gBfzZBvxOqjnxTSCyjlEsK4+gRYbCcFAABH8RWzb1oJLnCfqpVF+0S+BTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=s9zTNF2H; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="s9zTNF2H"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250929064943epoutp04b1694c06ee5a27ba5d343fb41488ea82~priBNPxgq1105011050epoutp04e
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:49:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250929064943epoutp04b1694c06ee5a27ba5d343fb41488ea82~priBNPxgq1105011050epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759128583;
	bh=bLrq4rO43N5uwgEaMfX6vfw6nUoLOsIdWCvpc8PcZRo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=s9zTNF2HX5rIaaQbixw8LehUVvbOFhMX/eOs5TYhqAkyhmPgMdQXhWfpH769F9/jv
	 GmF8pjXlbPk6HimMguVc3SWQkORLpGP6Ne21hvxWAsvnwxfjalxxebgKoyAtssFhyo
	 Z/VQyh+AhRTP2d5ywFehUSK09oA7+BwoLiFpNq/U=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250929064942epcas5p48727b6a24c89d39677b71492610bca36~priAc5c6_2608926089epcas5p4f;
	Mon, 29 Sep 2025 06:49:42 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cZsHn2Y5qz3hhT3; Mon, 29 Sep
	2025 06:49:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250929064940epcas5p4994a9e89543d79138f088c625bde279f~prh_9qQS42152621526epcas5p45;
	Mon, 29 Sep 2025 06:49:40 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929064937epsmtip15805f4c40f724e23936b5f428a4dd475~prh7l4ooi1470114701epsmtip1p;
	Mon, 29 Sep 2025 06:49:36 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Pritam Manohar Sutar'" <pritam.sutar@samsung.com>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andre.draszik@linaro.org>,
	<peter.griffin@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <igor.belwon@mentallysanemainliners.org>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250903073827.3015662-7-pritam.sutar@samsung.com>
Subject: RE: [PATCH v8 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Date: Mon, 29 Sep 2025 12:19:35 +0530
Message-ID: <001801dc310d$3ad95610$b08c0230$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgHrJOKSAycFebe0FycygA==
Content-Language: en-us
X-CMS-MailID: 20250929064940epcas5p4994a9e89543d79138f088c625bde279f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072952epcas5p38eaa34521236ad10d963783137748069
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072952epcas5p38eaa34521236ad10d963783137748069@epcas5p3.samsung.com>
	<20250903073827.3015662-7-pritam.sutar@samsung.com>

Hi Pritam

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Sent: Wednesday, September 3, 2025 1:08 PM
> To: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com;
> andre.draszik@linaro.org; peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
> m.szyprowski@samsung.com; s.nawrocki@samsung.com;
> pritam.sutar@samsung.com
> Cc: linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; rosa.pila@samsung.com;
> dev.tailor@samsung.com; faraz.ata@samsung.com;
> muhammed.ali@samsung.com; selvarasu.g@samsung.com
> Subject: [PATCH v8 6/6] phy: exynos5-usbdrd: support SS combo phy for
> ExynosAutov920
> 
> Add required change in phy driver to support combo SS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


