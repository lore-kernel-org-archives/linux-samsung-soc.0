Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D93101AD
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 08:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591204; cv=none; b=UzvvHgiN5jbou22h1daJLgpO269djy65TEqFOnoMwnutaEfkUWQu7ztaQiGcO14p8uuwtwjgb5McEZEhUwClMFldB9O9tqRjnr6pJ+WbzVUT0mZfOPKWlH3itKDty2ZfeqPedXx6RFDdp7B1X8PJAIYYZiBjqTOpET+l5MmksNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591204; c=relaxed/simple;
	bh=Eb14cc9b2DuxsAVuh6Qvm88DBxeEZIs+c7FsZ6LZmSI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=uaCS7gGpdTvlEphrDNllzZk7LIpH+Q6J11OxWHbt4xg3pQauYjHb946Y8dEPAnDfmotzl8mbrf7MNjsM+Ose7uqE9mGamJpHgECoabQmd/ydOjz6lTEkW0mTvd1QHHMFXdZ5P0FHg1MHpiVAXucS3LQ+qUzI7v/ZNAJrtHQySRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=J9sgQ4/P; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="J9sgQ4/P"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250819081319epoutp0477b0e01f4f2ef60b076602e268308af7~dHOUPqt491780317803epoutp04P
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 08:13:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250819081319epoutp0477b0e01f4f2ef60b076602e268308af7~dHOUPqt491780317803epoutp04P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755591199;
	bh=UxiKAyBziT9e+nTMG+2xkk2xG/b2nNG83CX/r2e5bz4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=J9sgQ4/PiSeAhGcrXAvZsGIjGReblZLfUSDGsK1e6qMBwvd2scEn0tQZJvrcqR4Pc
	 gzyGg8xtJ4+8UI+QbYoEDNGlKkHxYUeNO4920fxFDZltSMKXWGS2kYlP3fC4/Jd/7/
	 pG+r/qPZLOy3wprc9/ydkrxShIImsWLcwOdC3Qrk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250819081318epcas5p3324c7219edd64e8c1fc1e87d1abc60a7~dHOS4TnRk1172211722epcas5p30;
	Tue, 19 Aug 2025 08:13:18 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c5j594yK1z3hhT8; Tue, 19 Aug
	2025 08:13:17 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250819074434epcas5p3aba12adc12ef9a64dceff0ba5ec62e4d~dG1Ng9NQA3036730367epcas5p3E;
	Tue, 19 Aug 2025 07:44:34 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250819074431epsmtip15ad820317f1a1565de1ff3da8c977d8a~dG1KpWY5o2126621266epsmtip1k;
	Tue, 19 Aug 2025 07:44:31 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Vinod Koul'" <vkoul@kernel.org>
Cc: <kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <aKQfsgRXL-Nj8CkC@vaman>
Subject: RE: [PATCH v5 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Date: Tue, 19 Aug 2025 13:14:30 +0530
Message-ID: <003401dc10dd$1b39c560$51ad5020$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ+ZgWj3OwstM5ZbwFL0KmcSzrOlQGuc5yxAsdJ9S8B+nVVqAJlMeHKAknGxWeyy/PDQA==
Content-Language: en-in
X-CMS-MailID: 20250819074434epcas5p3aba12adc12ef9a64dceff0ba5ec62e4d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805114323epcas5p39bf73c5e0a9382ff54b1832724804cc9
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
	<CGME20250805114323epcas5p39bf73c5e0a9382ff54b1832724804cc9@epcas5p3.samsung.com>
	<20250805115216.3798121-7-pritam.sutar@samsung.com> <aJtN7uVUV3YhfY5-@vaman>
	<038a01dc1013$900a2800$b01e7800$@samsung.com> <aKQfsgRXL-Nj8CkC@vaman>

Hi Vinod, 

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: 19 August 2025 12:25 PM
> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Cc: kishon@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; alim.akhtar@samsung.com; andre.draszik@linaro.org;
> peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
> m.szyprowski@samsung.com; s.nawrocki@samsung.com; linux-
> phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
linux-samsung-
> soc@vger.kernel.org; rosa.pila@samsung.com; dev.tailor@samsung.com;
> faraz.ata@samsung.com; muhammed.ali@samsung.com;
> selvarasu.g@samsung.com
> Subject: Re: [PATCH v5 6/6] phy: exynos5-usbdrd: support SS combo phy for
> ExynosAutov920
> 
> On 18-08-25, 13:11, Pritam Manohar Sutar wrote:
> 
> > > > +	/* check cr_para_ack*/
> > > > +	cnt = 0;
> > > > +	do {
> > > > +		/*
> > > > +		 * data symbols are captured by phy on rising edge
of the
> > > > +		 * tx_clk when tx data enabled.
> > > > +		 * completion of the write cycle is acknowledged by
> > assertion
> > > > +		 * of the cr_para_ack.
> > > > +		 */
> > > > +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> > > > +		reg = readl(reg_phy +
> > > EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > > > +		if ((reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
> > > > +			break;
> > > > +
> > > > +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> > > > +
> > > > +		/*
> > > > +		 * wait for minimum of 10 cr_para_clk cycles after
phy reset
> > > > +		 * is negated, before accessing control regs to
allow for
> > > > +		 * internal resets.
> > > > +		 */
> > > > +		cnt++;
> > > > +	} while (cnt < 10);
> > > > +
> > > > +	if (cnt == 10)
> > > > +		dev_dbg(dev, "CR write failed to 0x%04x\n", addr);
> > >
> > > Not error?
> >
> > This is only for debugging purpose. It is not considered as error.
> 
> Write failed is not an error? If this code is only for debug, pls drop it.

Sure. will drop it. 

> 
> --
> ~Vinod

Regards,
Pritam

