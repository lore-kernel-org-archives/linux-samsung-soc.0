Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C9191F6A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209487; cv=none; b=JYDF3SFtRBk1xldz6Yi/Jm0T6MWSpv445n1o1u6dDhvL4pJbQr4pkZ+U/3wiBHmBiGNijNrXlsjzeSX1AaWFp9eXHs1dkJMXYI9nIxpghRposrvMpjwd+cHmck3nkLyxe2wwvB84b5BMJR6HU6sEI7+F/pVDqLZAS2Tkt0Mmotg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209487; c=relaxed/simple;
	bh=EmsfwNYhyePl3Y+oXJg7mIEX8RVDMxWYIqiG0U2UDsI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=IQBJviARC25H0VlWoeFLiAeNA3BWS2oYgGtJRtAHdFgz9AS2aq2rA+9EIkzqzTakIwmSyukxyXTvwrvMu2B37HlBcJFLHKbwE0YwepGgLMuwYkqon0hyIPaiXDCj8X31yBOHa7hyV3rHA62YNb109nBgH1SFQXzInYD8aoUlzfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OEgcXu8i; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OEgcXu8i"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250618011803epoutp04c64202e6fa2646428f3a1dbc71a200a6~J-kCiP5m71988819888epoutp04a
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:18:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250618011803epoutp04c64202e6fa2646428f3a1dbc71a200a6~J-kCiP5m71988819888epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750209483;
	bh=MpZ1RB5ujoYUFLrWZd+Soph740N6pKm7nhRUWlK+mb8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=OEgcXu8iKlUgh+2/ccQahqZq8huHXyVrj+jZ0O/0Ad7KgkJcAegvkgfrfr2k9giI8
	 rjh+KlIk52IPFzo81pDE2ZeB25af8tRRfSgq4DPwxSqiEz8FjjhJ+wBEMOTKpDF20M
	 hrl7OfBdEBlzg3/npYFk3L/JF/CU5bfFt7xqz5sg=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250618011803epcas5p307f50f49075ed92a804b49867a2dd288~J-kB2HGZw3159931599epcas5p3O;
	Wed, 18 Jun 2025 01:18:03 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.179]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bMQpc5ctcz3hhTS; Wed, 18 Jun
	2025 01:18:00 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250617175241epcas5p23c7284be872b6e74e3888b70ce19b01b~J5fLGRFG11003410034epcas5p24;
	Tue, 17 Jun 2025 17:52:41 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250617175237epsmtip23b9b569665566d9ebe26adcffe3fbcde~J5fIOTcPr1594015940epsmtip2i;
	Tue, 17 Jun 2025 17:52:37 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250616-resolute-ocelot-of-shopping-1c9c4a@kuoka>
Subject: RE: [PATCH v3 1/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Tue, 17 Jun 2025 23:22:36 +0530
Message-ID: <000401dbdfb0$9ec4b010$dc4e1030$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNTkACKxnsdZBPuyPiYuNftoBZF1gLpYoryAm9xWLwB5QJ1g7DeUbpQ
Content-Language: en-in
X-CMS-MailID: 20250617175241epcas5p23c7284be872b6e74e3888b70ce19b01b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a@epcas5p3.samsung.com>
	<20250613055613.866909-2-pritam.sutar@samsung.com>
	<20250616-resolute-ocelot-of-shopping-1c9c4a@kuoka>

Hi Krzysztof, 
> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 16 June 2025 01:45 PM
> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Cc: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com;
> andre.draszik@linaro.org; peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; m.szyprowski@samsung.com;
> s.nawrocki@samsung.com; linux-phy@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> rosa.pila@samsung.com; dev.tailor@samsung.com;
> faraz.ata@samsung.com; muhammed.ali@samsung.com;
> selvarasu.g@samsung.com
> Subject: Re: [PATCH v3 1/9] dt-bindings: phy: samsung,usb3-drd-phy: add
> ExynosAutov920 HS phy compatible
> 
> On Fri, Jun 13, 2025 at 11:26:05AM GMT, Pritam Manohar Sutar wrote:
> > Add a dedicated compatible string for USB HS phy found in this SoC.
> 
> You add HS phy in other commit/patch. This is just confusing.
> 
> > The devicetree node requires two clocks, named "phy" and "ref"
> 
> No. Explain the hardware, not the DTS. How many clocks, supplies etc
> hardware has.
> 

ok will change commit message accordingly in next version of the patch-set. 

> Best regards,
> Krzysztof


Thank you.

Regards,
Pritam

