Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7AA289E2D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 09:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301430; cv=none; b=ji/WTz6780l9gKsCS0mcIq6CeferD1pTXlEOdZUT9hkof1NXdhI8Ie6oZj3w2jv0bvydKbRNnw8oaf8e0UR6CDo5OziTygOMZ+ODLSTh8o/yCz9FiodojjrY8H7V0LnQl1G9wI1TtwoTD9A7xQkuMoMVjvbERp3ZyQAjYqgJHV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301430; c=relaxed/simple;
	bh=5vqIBeLxlVgd3Xg0Cvj1EUc+Oxp9S+e2ua07s1imfH4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=GwcYpuK28EmVDDfi6fZIQzL25+WvsmJHp9QKHifQFMFwrPQT6qN3h+iI7uY6pDcN3rtMWeKlgjAIuGBaojqiUCkSictZIPAX0wso26M0Bsd3ECwVB4fcULqIeNLzLL4EHGjcE7hAv1915M9Ci0Z1gF5sWNPHIdGveRh4Qs85FxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=X9iNwBAV; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="X9iNwBAV"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250515093025epoutp01a20f9d4661b4d462889fd27824a4e0b3~-qWN7sQPX2748427484epoutp01P
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 09:30:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250515093025epoutp01a20f9d4661b4d462889fd27824a4e0b3~-qWN7sQPX2748427484epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747301425;
	bh=LwnsrpMvLC2QSW4QUvZ69ahD/8TwjGI5Icjzo88ho0E=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=X9iNwBAVZCazsIae7aERKG95x3C1AmyvADys1Dp3fbYFdN5OGNTkqOb80OY3ZATEE
	 y2O4+JCs479tyOVCVbGeTMX7gZUC3TBm3vq7Ooe+z0v8rRcbGLOgrjlqCHVqy0X+Un
	 JxzM+qO78Sdo+Muo8XYpHWwcUWsPfpZZtnV4BxAA=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250515093024epcas5p1e40dc34ff2f2ca956214a06054db9ecd~-qWNVLl0H1137911379epcas5p1e;
	Thu, 15 May 2025 09:30:24 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.181]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZylLR1RT0z6B9mR; Thu, 15 May
	2025 09:30:23 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250515093022epcas5p2bb0e66bb225d96634bc6aacf984b8921~-qWLa5I0a2807728077epcas5p23;
	Thu, 15 May 2025 09:30:22 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250515093022epsmtrp227032d23c4c687f60f048b99fbe39566~-qWLZ9Lgu2206622066epsmtrp2w;
	Thu, 15 May 2025 09:30:22 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-91-6825b42dfd88
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	41.F1.08805.D24B5286; Thu, 15 May 2025 18:30:21 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250515093019epsmtip276ad656a8729e1e80dbc116905a54ea1~-qWIpqNm70035900359epsmtip26;
	Thu, 15 May 2025 09:30:19 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Pritam Manohar Sutar'" <pritam.sutar@samsung.com>,
	<gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250514140741.415981-3-pritam.sutar@samsung.com>
Subject: RE: [PATCH 2/2] usb: dwc3-exynos: add support for ExynosAutov920
Date: Thu, 15 May 2025 15:00:18 +0530
Message-ID: <0efd01dbc57b$faaafa00$f000ee00$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHb4atmIwpdDAkGWt442tTNHGskkAJ/U0NcARvjAqiztljokA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsWy7bCSvK7uFtUMg+szDSzW7D3HZHFvxzJ2
	i/lHzrFaXLuxkN2iefF6NouXs+6xWWx6fI3V4vKuOWwWM87vY7JYtKyV2eL8iy5Wi2f3VrBZ
	/N+zg93iy88HzBZHln9ksli14AC7g4DHplWdbB77565h99i8pN6jb8sqRo8t+z8zenzeJBfA
	FsVlk5Kak1mWWqRvl8CVcX5xO3vBYbaKi5sfsTQwbmDtYuTkkBAwkXi7awJbFyMXh5DAbkaJ
	JdvvM0MkpCWub5zADmELS6z89xzMFhJ4ziixujUBxGYT0JXYsbgNrFlEYA+jRMfCh4wgDrPA
	fiaJab+XMUGMPcwoMfPZfLB9nAL2EpvP72IDsYUFPCX+/vkFZHNwsAioSpx/6A4S5hWwlLg/
	vYERwhaUODnzCQuIzSygLdH7sJURxl628DXUpQoSP58uYwUZIyLgJHFzTxBEibjEy6NH2Ccw
	Cs9CMmkWkkmzkEyahaRlASPLKkbJ1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT83E2M4IjV0trB
	uGfVB71DjEwcjIcYJTiYlUR4r2cpZwjxpiRWVqUW5ccXleakFh9ilOZgURLn/fa6N0VIID2x
	JDU7NbUgtQgmy8TBKdXAZBZRe+PH2vv7bn1ZpFAdXpO02De/gXthVNlvFibN2jP12Q7rl6tc
	3ijE5R+3xYN9n2PPNfF7N8K9rly7rSYvPi31RbKUIO/hVz/Mal+oWy+6uMvBObNjkRFLd+Yf
	5QN3Ul7YLBD9eFzq4W1Jrotpp7bEGMc/YxJ5vsPXcN2ugGUtDI8i/iY6V31XejL54ZHb8+oP
	6nomXz/tpHM53npn/ROW1UHOblM6joffvfXHMLOA9cCEk39LkqvDNx47b2wRtiQx8+H6dp9n
	t//NOqQ+g93PJv74Fm6p1rZamY4L3Xwdwk1vbrxSCgx49sb9RfmXF/9PrL3M25TG/b6wplfJ
	KNIsQ7lsSQ9LyaE/tcxTlViKMxINtZiLihMBl9lrLUcDAAA=
X-CMS-MailID: 20250515093022epcas5p2bb0e66bb225d96634bc6aacf984b8921
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9
References: <20250514140741.415981-1-pritam.sutar@samsung.com>
	<CGME20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9@epcas5p1.samsung.com>
	<20250514140741.415981-3-pritam.sutar@samsung.com>

Hi Pritam

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Sent: Wednesday, May 14, 2025 7:38 PM
> To: pritam.sutar=40samsung.com; gregkh=40linuxfoundation.org;
> robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
>=20
=5Bsnip=5D
>  static const struct of_device_id exynos_dwc3_match=5B=5D =3D =7B
>  	=7B
>  		.compatible =3D =22samsung,exynos2200-dwusb3=22, =40=40 -209,6
> +215,9 =40=40 static const struct of_device_id exynos_dwc3_match=5B=5D =
=3D =7B
>  	=7D, =7B
>  		.compatible =3D =22google,gs101-dwusb3=22,
>  		.data =3D &gs101_drvdata,
> +	=7D, =7B
> +		.compatible =3D =22samsung,exynosautov920-dwusb3=22,
> +		.data =3D &exynosautov920_drvdata,

Should go below =22 samsung,exynos2200-dwusb3=22 entry (as already pointed =
by Thinh)
With that fixed

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>


