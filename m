Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D780D271
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128431; cv=none; b=L8YAzzNLbcyAKX0DsXswDCV7HBwRHzd4EmwCfXTCHhTsL99MCs0HzS9T9m0vtPoK461k7ldOU8aaX7vqyMDjDzQewW8wa3D1j4cNaijwqE1tH3YfoJppeGuDC8ntKWrK+hNXVtp/LJPwvvwxWoa51W6k6lDVK55W0Fy5/YpSrDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128431; c=relaxed/simple;
	bh=y5tPGdO0zkiGxYnKhMmtxjekDbOB0ovCzbPkwlNmCbs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=nqrf7NCdnnIJoNVvwQV692qbA2ThHOx2bHvsjtSbf1N7VM9vPFi9XgRV+W4Te2P60thMLSTkOj0YhiubbVGGNEWlgzPP5kPK7hcsSgBBAApRhT3N3RJ6p2IcEzxI5mEujmAj3B5OE1pNT4PNW/kupSiW18PYKA7jQbR2N5pY2og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=aBg3H/6V; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aBg3H/6V"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250929064707epoutp0301bfc55214fe6eff9c4cffaf9681ee4f~prfwQVkrS1956719567epoutp03v
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:47:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250929064707epoutp0301bfc55214fe6eff9c4cffaf9681ee4f~prfwQVkrS1956719567epoutp03v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759128427;
	bh=rlD+Oa758snTIeLWIc2UCK6i1q2QhpKw3wxOF2sifOI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=aBg3H/6VmTNiLUkV2VTTS3hxnFVduv5g/xJsDfljmOWJGC1Ap2KvsQL8cvl6RkPFo
	 bEmrkzXV7YkIU8iERRiGCsr7wM6wzeMzBTmoMqgLHUomM41CoPWwILzpwjSXCuF915
	 qmM659j/KaH6KbhEmnXKIx7UiCS3T73wNZVTyl7M=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250929064706epcas5p25fbef3d266435f18a5a7d550bd7fb1d9~prfvr9wQe3152631526epcas5p2C;
	Mon, 29 Sep 2025 06:47:06 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cZsDn5g4tz3hhTC; Mon, 29 Sep
	2025 06:47:05 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250929064705epcas5p28b43638ca8368376aaa55a652e2c097b~prfuB7tJr3152631526epcas5p29;
	Mon, 29 Sep 2025 06:47:05 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929064700epsmtip1803678f881cc80bb889cc76568fbd6c2~prfp-PR7e1213412134epsmtip1f;
	Mon, 29 Sep 2025 06:47:00 +0000 (GMT)
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
In-Reply-To: <20250903073827.3015662-4-pritam.sutar@samsung.com>
Subject: RE: [PATCH v8 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo hsphy
Date: Mon, 29 Sep 2025 12:16:57 +0530
Message-ID: <001501dc310c$de18fb60$9a4af220$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgI+elV9AgkpZOa0HXqrMA==
Content-Language: en-us
X-CMS-MailID: 20250929064705epcas5p28b43638ca8368376aaa55a652e2c097b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072942epcas5p2154a85b45152af50e2714248c38c5adc
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072942epcas5p2154a85b45152af50e2714248c38c5adc@epcas5p2.samsung.com>
	<20250903073827.3015662-4-pritam.sutar@samsung.com>

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
> Subject: [PATCH v8 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
> ExynosAutov920 combo hsphy
> 
> The USBDRD31 5nm controller consists of Synopsys USB2.0 femptophy and
> USBSS combophy. Add-on USB20 femptophy is required to support USB20
> data rates along with USBSS phy. Document support for the USB2.0
> femptophy found on combophy of the this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

