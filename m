Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AD713AA2A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Mar 2025 04:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742962328; cv=none; b=Xe7A3ZvB0wNQasHzaqNZ/qGe+LIp4oYAwZIzfjJWWoCRKYqocg+vP3ONMpdt2KV/kQYxIUO3pjyyMzahN1Nfnrn/gKtHwGxP6VLWArlNqONN9J6/YCTz1td8OVG2gPg6sspOmyY/D2woA+LQ4dcSOVygs1GxCKQcE6yU93nmK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742962328; c=relaxed/simple;
	bh=Z/HU/7IaCHp5V/l5qTpe48nAFGMbCgTdwft/kVyiMV4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=i571lWhWbCMHO7l3qMVeXSV1TIM4Q6acKhDaAO77dc+mfgIFTKmyv1PdOACL0KfS/LQdpdsieqLxyx8KVpML9IRljRE3HWOa3ghpS4qtVQpqFYe35xZdTa1C7gew8RU4rsCBzfeCImAqkofWesk5oHJsa3b8/s6PaE+Ssiq+Ae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=X8Tnfrvc; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="X8Tnfrvc"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250326041158epoutp02789c0922005098943f799c2be7208210~wPv54-los2827728277epoutp02S
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Mar 2025 04:11:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250326041158epoutp02789c0922005098943f799c2be7208210~wPv54-los2827728277epoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1742962318;
	bh=Z/HU/7IaCHp5V/l5qTpe48nAFGMbCgTdwft/kVyiMV4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=X8TnfrvcSUrX6Jn97SxcvRF7sE+/QlWvoJyTbIo7Ao4UYDYMZyG5s6jnH6MSprHXZ
	 hzHRbe5CC8Clp3H6PNP5yL160BwRh1BDbsQ82Cclg3Z+ERBFbO8/c9tW/8EkH2nVRI
	 F4FcQZ5IFGsxczVIOdf0Ce1gVWb/MtKysFPQaZrc=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250326041157epcas5p40276f85d4e2dbdacbfd5aeeb24c61f5b~wPv5Sifpv2402124021epcas5p4m;
	Wed, 26 Mar 2025 04:11:57 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4ZMtf409dpz4x9Ps; Wed, 26 Mar
	2025 04:11:56 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9F.F4.19608.B8E73E76; Wed, 26 Mar 2025 13:11:55 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250326041155epcas5p17f14d57859e765d7835c9556a0e592ee~wPv3QbvJN1062310623epcas5p15;
	Wed, 26 Mar 2025 04:11:55 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250326041155epsmtrp174d050273514138cd454533e2aa36e9d~wPv3Pr_mX1028010280epsmtrp1T;
	Wed, 26 Mar 2025 04:11:55 +0000 (GMT)
X-AuditID: b6c32a50-225fa70000004c98-da-67e37e8be0ad
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	80.90.19478.B8E73E76; Wed, 26 Mar 2025 13:11:55 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250326041153epsmtip2fe691706bea154c11bdf3b38bc47f0f7~wPv1sAitb2010920109epsmtip2y;
	Wed, 26 Mar 2025 04:11:53 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Faraz Ata'" <faraz.ata@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>,
	<suyash.bitti@samsung.com>
In-Reply-To: <20250318075635.3372599-1-faraz.ata@samsung.com>
Subject: RE: [PATCH v2] arm64: dts: exynos: Add DT node for all UART ports
Date: Wed, 26 Mar 2025 09:41:52 +0530
Message-ID: <0ca401db9e05$35d331e0$a17995a0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIiLJ9Qel8GAkpX5i6PIbvAaC3kAAM/bP3Ast21bPA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOJsWRmVeSWpSXmKPExsWy7bCmlm533eN0g+2XrSzW7D3HZHFvxzJ2
	i/lHzrFaXLuxkN3i5ax7bBabHl9jtbi8aw6bxYzz+5gs/u/ZwW7x5ecDZovZ82scuD02repk
	89i8pN6jb8sqRo/Pm+QCWKKybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPIS
	c1NtlVx8AnTdMnOAblJSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgU6BUn5haX
	5qXr5aWWWBkaGBiZAhUmZGfMmdvAXjCRvWL3VLsGxj62LkYODgkBE4nF/0S7GLk4hAT2MEo8
	+/uQGcL5xCjxZ18TI5zzYPsqoAwnWEfX3qPsEImdjBILvy5jgXBeMkp0zF4PVsUmoCuxY3Eb
	G4gtIpAt8WbRZ7C5zAKPGCUOfPrHArKcU8BWYve/dJAaYQEvib6mW4wgNouAqsSOCXNZQGxe
	AUuJQ+2noGxBiZMzn4DZzALaEssWvoa6SEHi59NlrBC7rCSuzD8LVSMu8fLoEbBLJQQWckjM
	mtTPCtHgInHp8UomCFtY4tXxLewQtpTEy/42KDteYt+bFVA1BRJrrv1jgbDtJVYvOMMKcj+z
	gKbE+l36ELv4JHp/P2GChCmvREebEES1qkTzu6tQndISE7u7oS7wkLj5Zj/7BEbFWUg+m4Xk
	s1lIPpiFsGwBI8sqRqnUguLc9NRk0wJD3bzUcnh8J+fnbmIEp1itgB2Mqzf81TvEyMTBeIhR
	goNZSYT3GOvDdCHelMTKqtSi/Pii0pzU4kOMpsDwnsgsJZqcD0zyeSXxhiaWBiZmZmYmlsZm
	hkrivM07W9KFBNITS1KzU1MLUotg+pg4OKUamOYuuyKgkVheOYd3s8xFr7Pzay2d+X8VJP37
	YRP3b7JD90nuwl/KT0M17/jP9C1ylDGV3uM7lfEhH1uHcMHXzdxFDyojz4perG45uYlDQKeq
	m1UsTcCWUaxGcMvRmCtiNy1tH3toF6wNb+Lss5giZNAw4fbfizcvRahLJTTcVtLQMtgdfmpx
	Rv6KpYdbYrqOeFaYTUsyaTqx+gPH7Llsonfvm/N0tB8+4NjM0H12bvHJngaJHb/XMb/vcjrW
	seFTcVF8R8yOphMVntut/9l5Su+vnBd/5nqK04EQh+adzNu+yZr+ufKuNddnnsPqbaUHGsJf
	Ni2Q8OthEpFw1hW7lnK50LLHevV/S+/Zy4uUWIozEg21mIuKEwFsu56nOgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJXre77nG6wY9uRYs1e88xWdzbsYzd
	Yv6Rc6wW124sZLd4Oesem8Wmx9dYLS7vmsNmMeP8PiaL/3t2sFt8+fmA2WL2/BoHbo9NqzrZ
	PDYvqffo27KK0ePzJrkAligum5TUnMyy1CJ9uwSujDOLl7AVvGeruNq8iLGB8Q1rFyMnh4SA
	iUTX3qPsXYxcHEIC2xklzu36wQKRkJa4vnECO4QtLLHy33OooueMEutvrGMGSbAJ6ErsWNzG
	BmKLCORLbPszjwmkiFngBaPEkwUnWCE6+hgl/nf0AnVwcHAK2Ers/pcO0iAs4CXR13SLEcRm
	EVCV2DFhLthmXgFLiUPtp6BsQYmTM5+A2cwC2hK9D1sZYexlC18zQ1ynIPHz6TJWiCOsJK7M
	PwtVLy7x8ugR9gmMwrOQjJqFZNQsJKNmIWlZwMiyilE0taA4Nz03ucBQrzgxt7g0L10vOT93
	EyM4xrSCdjAuW/9X7xAjEwfjIUYJDmYlEd5jrA/ThXhTEiurUovy44tKc1KLDzFKc7AoifMq
	53SmCAmkJ5akZqemFqQWwWSZODilGpg2ywu482u8/fXgdaN61I91zyVXh3BMUdqbGFLKKeG3
	XHPmvwNHHR1SdlyazvlSj9uJzWZtYRnX8o0CegVHZjse+C7FfO2D0+F7n3NS+Osnfr3urVp/
	6XaRydMpE3Uy1q7VnKKx78X7+FaH7mc/1DL8jAtav6f9TZ1cev98xmvZvK33+CeysR1I+DTn
	N19YrrHyTPdNV0pXvpCz+GD8bKumWVXGi18hkUZZPhO7aqU69Lg/aZ0qdZsW/nXl/jsJ6imr
	YpfeC3CYOKF1selh9oBl+7QaDsyd8PaxZFjCnVPbec4Kr9Mvyjzv113wP47zef8Jzzm1Iovf
	yn/IPHf2jeSkjbyvmQ+4r88y91t44uIRJZbijERDLeai4kQAJowUFiADAAA=
X-CMS-MailID: 20250326041155epcas5p17f14d57859e765d7835c9556a0e592ee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250318074801epcas5p3de68627a3e64ebc2a95ed33a3f485e80
References: <CGME20250318074801epcas5p3de68627a3e64ebc2a95ed33a3f485e80@epcas5p3.samsung.com>
	<20250318075635.3372599-1-faraz.ata@samsung.com>

Hi Faraz

> -----Original Message-----
> From: Faraz Ata <faraz.ata=40samsung.com>
> Sent: Tuesday, March 18, 2025 1:27 PM
> To: alim.akhtar=40samsung.com; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> faraz.ata=40samsung.com; rosa.pila=40samsung.com;
> dev.tailor=40samsung.com; suyash.bitti=40samsung.com
> Subject: =5BPATCH v2=5D arm64: dts: exynos: Add DT node for all UART port=
s
>=20
> Universal Serial Interface (USI) supports three serial protocol like uart=
, i2c and
> spi. ExynosAutov920 has 18 instances of USI.
> Add all the USI DT node and subsequent uart nodes for all the instances.
>=20
> Signed-off-by: Faraz Ata <faraz.ata=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

