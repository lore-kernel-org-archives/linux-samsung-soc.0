Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A8C1A0BF3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 04:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753849052; cv=none; b=KyGCM+oz+P11nr+n1Ce+fEpaQdQTiHjfvj7mFMNBOLNPl06SAviFKcFSjsq1W6q+m1EkIPoM6Fbwkr8GnpIqu35HzBXvfxLNURmYMwZMKLc9evuuMLxrBzZlyWI7/Q71UfMEJslO+E+Sv2ZJkFkyjOTXvehqbDU/KuY6YgjB0gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753849052; c=relaxed/simple;
	bh=K7KUwKilFDHEDsfh4Yx7rczHG83ExKuciAknBf8324k=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=bqW4JxlIJVUi8AXFBjrvmk+X7nT6Vmh0zFoBGaWMX1HHOysuRzNgPQmXi/vh/CPrG56SP4EOubkY2tx4shZjSrQsvXt+6oTy3vzxSQzs0qv/7KtvyEcJnSbbg8IWJXQq2DJwwhJl/QBK2CDXA1hqfKt1pOERbU5/3BfThsDiv84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=d6XwjYRl; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="d6XwjYRl"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250730041728epoutp014c5391872489b712c42defdaeececab1~W7GrGDZJP1108711087epoutp01P
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 04:17:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250730041728epoutp014c5391872489b712c42defdaeececab1~W7GrGDZJP1108711087epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753849048;
	bh=K7KUwKilFDHEDsfh4Yx7rczHG83ExKuciAknBf8324k=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=d6XwjYRlVRX8+/zPzCEltkpw1wDRuEboXY2tXEeVRe9DQnmtYS/SFe+LRTxwGytHB
	 WWbeiTLwRcFUMYATVJyg3EYVCe/UgdNTs5e0B7FlYbz28h4qfpaQUOewYVaYlzElA6
	 XpEF5eOSYtfEUl2QL74FIKfJRXUh1etYqBlAG+F4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250730041727epcas5p24ac1bc7bcb5343f2d896777c41cc5917~W7GqaiqPk2771727717epcas5p22;
	Wed, 30 Jul 2025 04:17:27 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bsJpG3b7tz3hhTK; Wed, 30 Jul
	2025 04:17:26 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250730041726epcas5p2ab1049be882c5eda45d384680200683f~W7GpFosuY1622716227epcas5p2n;
	Wed, 30 Jul 2025 04:17:26 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250730041724epsmtip25e8f7a35ba1e498bca2040a8730bbd42~W7Gnsd4kE0316403164epsmtip21;
	Wed, 30 Jul 2025 04:17:24 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Devang Tailor'" <dev.tailor@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<faraz.ata@samsung.com>
In-Reply-To: <20250710083434.1821671-3-dev.tailor@samsung.com>
Subject: RE: [PATCH v2 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Date: Wed, 30 Jul 2025 09:47:23 +0530
Message-ID: <36d401dc0108$db031250$910936f0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQMc6yo9jRPgA4nZ2IiZrgLtyBFMygKSVtdMAw5/R1KxmzSKEA==
X-CMS-MailID: 20250730041726epcas5p2ab1049be882c5eda45d384680200683f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9@epcas5p4.samsung.com>
	<20250710083434.1821671-3-dev.tailor@samsung.com>



> -----Original Message-----
> From: Devang Tailor <dev.tailor=40samsung.com>
> Sent: Thursday, July 10, 2025 2:05 PM
> To: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; alexandre.belloni=40bootlin.com;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-
> rtc=40vger.kernel.org; faraz.ata=40samsung.com
> Cc: Devang Tailor <dev.tailor=40samsung.com>
> Subject: =5BPATCH v2 2/3=5D rtc: s3c: support for exynosautov9 on-chip RT=
C
>=20
> The on-chip RTC of this SoC is almost similar to the previous versions of=
 SoC.
> Hence re-use the existing driver with platform specific change to enable =
RTC.
>=20
> This has been tested with 'hwclock' & 'date' utilities
>=20
> Signed-off-by: Devang Tailor <dev.tailor=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

