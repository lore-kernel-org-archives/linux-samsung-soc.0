Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078D235965
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 01:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734485534; cv=none; b=CJyN4cxafITq5RvF3Ctk/WAzV57UXFOIZeZEXT4saQ181VXCS0qtY5HPwf2I3kffvciv9Vuxp69oiJRDn2gdOwSdoCNppQ+goAWpaaqOzQdvoc7YqZ9Ztf91LFCnK66ZMkD/QgXyAeLZhFgGOAuDx9rR60sor8cSo4PbuoOzNzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734485534; c=relaxed/simple;
	bh=SouqQVOWo0IA078Liq47MXQRtgvuLzHHVcwGkCNOMQ4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=g5Y22o3YrKt4mRKxrVgLx1we+6k1dWJG1Wd9fQCHntvuaTrNop6S9iLV4XQKOmEO8PLZAega6yBgWc8IBuvTjYW/LfB+kkby4mncUEWBGBNGYL2VnM7ZpCuo3ckW7lIcZVzL3sjtgvbUc6tCiZVxVySpjdx7TBwFK6vvJpFlpMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IKaILiaa; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IKaILiaa"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241218013204epoutp01cba2bd21bd99718bf4e1f609a91905db~SIWUH2bJr1561815618epoutp01Z
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 01:32:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241218013204epoutp01cba2bd21bd99718bf4e1f609a91905db~SIWUH2bJr1561815618epoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734485524;
	bh=SouqQVOWo0IA078Liq47MXQRtgvuLzHHVcwGkCNOMQ4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=IKaILiaagE7q0l/ZcA4v1Nf1NUNXTCEs+2NPJhOGUq9m5Ajx9X/Un7z9r+EWfA2b8
	 DyjSh7wpbPtCI9JDpnYHNYvFW7u2FaXmatLNIgNv7ziaGmUgLP/Q3nUYBa9279hQVz
	 r1UGgL8PsAmoikEkXC4vqwTzaD8KT2nMHGhmzzaU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241218013203epcas2p2cc99b97742bcff0631feb781f9ac8bac~SIWTKpUag0430404304epcas2p2w;
	Wed, 18 Dec 2024 01:32:03 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.100]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4YCbkp36BJz4x9QB; Wed, 18 Dec
	2024 01:32:02 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	57.B3.22938.21622676; Wed, 18 Dec 2024 10:32:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241218013201epcas2p489ca5d184d4ea8728161885277363cc6~SIWR2B3_71074410744epcas2p4F;
	Wed, 18 Dec 2024 01:32:01 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241218013201epsmtrp19e2776648599b7ecdc5572d3364d707d~SIWRz309p0477804778epsmtrp1B;
	Wed, 18 Dec 2024 01:32:01 +0000 (GMT)
X-AuditID: b6c32a43-0b1e27000000599a-4b-676226128c4f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	81.70.18949.11622676; Wed, 18 Dec 2024 10:32:01 +0900 (KST)
Received: from KORCO078619 (unknown [10.229.8.183]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241218013201epsmtip1c4569df0c042cf24fcdcecd7b9634b72~SIWRhO9zZ0718107181epsmtip1d;
	Wed, 18 Dec 2024 01:32:01 +0000 (GMT)
From: =?UTF-8?B?64KY7IaM7JuQL1NPV09OIE5B?= <sowon.na@samsung.com>
To: <krzk@kernel.org>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	"'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>
In-Reply-To: 
Subject: RE: [PATCH v3 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
 bindings
Date: Wed, 18 Dec 2024 10:32:01 +0900
Message-ID: <001401db50ec$a31703a0$e9450ae0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKN54LK9wdlweRKh/1XLNX4aAwNFgFS5b/OAqaWsZ0BueJmj7ErLxsggC0/MQA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRmVeSWpSXmKPExsWy7bCmua6QWlK6wZsuUYsH87axWazZe47J
	Yv6Rc6wWR1v/M1u8nHWPzeL8+Q3sFntfb2W3uLxrDpvFjPP7mCz+79nBbrHzzglmB26PTas6
	2TzuXNvD5tG3ZRWjx+dNcgEsUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koK
	eYm5qbZKLj4Bum6ZOUBXKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKzAv0ihNz
	i0vz0vXyUkusDA0MjEyBChOyM/6/fMFaMFmhYsf1I4wNjPPkuxg5OSQETCRmfvvP2sXIxSEk
	sINR4uGzBVDOJ0aJrdPvMEE43xglVlybzATT8u9ZDztEYi+jxNFFT6FaXjBKNG14yAhSxSbg
	KLFy2l+gDg4OEQFRiVXnBUBqmAV2M0nMPT4fLM4pwCsx4Z81SLmwQLDEghm/mUFsFgFVibc3
	7rGC2LwClhKbd85nhLAFJU7OfMICYjMLaEssW/iaGeIgBYmfT5eB1YsI+Em8mjSJFaJGRGJ2
	ZxszyF4JgQMcEjd23YNqcJFY+fID1DfCEq+Ob2GHsKUkXva3Qdn5Eusf3mWDsCsk7h76zwJh
	20ssOvOTHeR+ZgFNifW79EFMCQFliSO3oE7jk+g4/JcdIswr0dEmBNGoJNFxfg7UUgmJVS8m
	s01gVJqF5LFZSB6bheSBWQi7FjCyrGIUSy0ozk1PTTYqMITHdXJ+7iZGcHrVct7BeGX+P71D
	jEwcjIcYJTiYlUR43TQT04V4UxIrq1KL8uOLSnNSiw8xmgKDeiKzlGhyPjDB55XEG5pYGpiY
	mRmaG5kamCuJ895rnZsiJJCeWJKanZpakFoE08fEwSnVwOQhdnb79Y9M7165/ry7836ap2jH
	v/onew7O0yziqHZ/YMtu8f6rHx/HTidz5sMceYr2vlOLBa5kHOX6kdYcI6iyuS61i6cwrcnD
	zuL2Jta6A8XzN/7WWMz2efl2XX1708eiF+bu15fJzGsVucB4UmOXvvPB8P9qescaG8v8OyTc
	vpjlO9s+PMN02kvO4aND3XVnoYfMbgtufU0vcrnm7ePlxx+eGD+ZP+PlUs/JDxsa0+ISfN/M
	XGcX0X/c7Ua2m3Gy7SvJPbFiPh8N2FZO533tIHKkc7Go9q7pVtK/5Mvz7XwO7nAJkKz4W2b/
	LdjGxfBHf8TGE1cUu+x/nTlkEj7DqP59VIYxX/Sh5m1KLMUZiYZazEXFiQCUzlnIOAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsWy7bCSnK6gWlK6wbZ72hYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLfa+3spucXnXHDaLGef3MVn837OD3WLnnRPMDtwem1Z1
	snncubaHzaNvyypGj8+b5AJYorhsUlJzMstSi/TtErgyfvRwFkwXr/g+7xxjA+Mm4S5GTg4J
	AROJf8962LsYuTiEBHYzSpw/v4oJIiEh8e3NHihbWOJ+yxFWiKJnjBLLnm5iBEmwCThKrJz2
	F6iIg0NEQFRi1XkBkBpmgaNMEo/XbmWCaHjDKLHg5TY2kCJOAV6JCf+sQXqFBQIluiYdAJvD
	IqAq8fbGPVYQm1fAUmLzzvmMELagxMmZT1hAbGYBbYneh62MMPayha+ZIY5TkPj5dBkrzKGv
	jm9hh7BNJd7+7wSLiwj4SbyaNIkVoldEYnZnG/MERtFZSFbMQrJiFpIVs5C0LGBkWcUomVpQ
	nJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERybWlo7GPes+qB3iJGJg/EQowQHs5IIr5tmYroQ
	b0piZVVqUX58UWlOavEhRmkOFiVx3m+ve1OEBNITS1KzU1MLUotgskwcnFINTN5rrfl1NE1n
	sCYsmvJ67Vf+frkFRstOnLhcJBPA7TKBNdrWrMlv5bQ9M5M2b5fhaF9S/Tl+iv3nw+eWbBGZ
	uFa9r3F+3/6nDA/t/jTcs7K6u35GlX1IUdbDNf4KET7+ClUd0lc42sqy9y43KLnZ+E5q52pj
	Hj35ZTMiZd8d3rJK8apVu5GA3o4wp7J3v8/PLvT88e+Ud4T6Pom+qob12Xm9bRo2667vfl6o
	sSi8W+Lz0/2zmu/NcOR4e3JFQ1C5hP5y8R1819/He/JctHhTKuv0pCHIZkrGhdNsJ0weWu3w
	3Sfns7tHXFy97Xq68dTgS7rPwsVWLuLMTDqXtHRC7+rTTZffr3TbnvzzwbN1zkosxRmJhlrM
	RcWJALNVSWs8AwAA
X-CMS-MailID: 20241218013201epcas2p489ca5d184d4ea8728161885277363cc6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241118021011epcas2p21593217ccf58afddad5ce36f510e7cb6
References: <20241118021009.2858849-1-sowon.na@samsung.com>
	<CGME20241118021011epcas2p21593217ccf58afddad5ce36f510e7cb6@epcas2p2.samsung.com>
	<20241118021009.2858849-2-sowon.na@samsung.com>
	<000001db3a42$c5a79b70$50f6d250$@samsung.com> 

Hi Krzysztof,

> -----Original Message-----
> From: =EB=82=98=EC=86=8C=EC=9B=90/SOWON=20NA=20<sowon.na=40samsung.com>=
=0D=0A>=20Sent:=20Tuesday,=20November=2019,=202024=203:36=20PM=0D=0A>=20To:=
=20'Alim=20Akhtar'=20<alim.akhtar=40samsung.com>=0D=0A>=20Cc:=20'robh=40ker=
nel.org'=20<robh=40kernel.org>;=20'krzk=40kernel.org'=0D=0A>=20<krzk=40kern=
el.org>;=20'conor+dt=40kernel.org'=20<conor+dt=40kernel.org>;=0D=0A>=20'vko=
ul=40kernel.org'=20<vkoul=40kernel.org>;=20'kishon=40kernel.org'=0D=0A>=20<=
kishon=40kernel.org>;=20'krzk+dt=40kernel.org'=20<krzk+dt=40kernel.org>;=20=
'linux-=0D=0A>=20kernel=40vger.kernel.org'=20<linux-kernel=40vger.kernel.or=
g>;=0D=0A>=20'devicetree=40vger.kernel.org'=20<devicetree=40vger.kernel.org=
>;=20'linux-samsung-=0D=0A>=20soc=40vger.kernel.org'=20<linux-samsung-soc=
=40vger.kernel.org>;=20'Krzysztof=0D=0A>=20Kozlowski'=20<krzysztof.kozlowsk=
i=40linaro.org>=0D=0A>=20Subject:=20RE:=20=5BPATCH=20v3=201/3=5D=20dt-bindi=
ngs:=20phy:=20Add=20ExynosAutov920=20UFS=20PHY=0D=0A>=20bindings=0D=0A>=20=
=0D=0A>=20Hi=20Alim,=0D=0A>=20=0D=0A>=20On=2011/19/24=202:21=20PM,=20Alim=
=20Akhtar=20wrote:=0D=0A>=20>=20-----Original=20Message-----=0D=0A>=20>=20F=
rom:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=0D=0A>=20>=20Sent:=20Tue=
sday,=20November=2019,=202024=202:21=20PM=0D=0A>=20>=20To:=20'Sowon=20Na'=
=20<sowon.na=40samsung.com>;=20robh=40kernel.org;=0D=0A>=20>=20krzk=40kerne=
l.org;=0D=0A>=20>=20conor+dt=40kernel.org;=20vkoul=40kernel.org;=20kishon=
=40kernel.org=0D=0A>=20>=20Cc:=20krzk+dt=40kernel.org;=20linux-kernel=40vge=
r.kernel.org;=0D=0A>=20>=20devicetree=40vger.kernel.org;=20linux-samsung-so=
c=40vger.kernel.org;=0D=0A>=20>=20'Krzysztof=20Kozlowski'=20<krzysztof.kozl=
owski=40linaro.org>=0D=0A>=20>=20Subject:=20RE:=20=5BPATCH=20v3=201/3=5D=20=
dt-bindings:=20phy:=20Add=20ExynosAutov920=20UFS=0D=0A>=20>=20PHY=20binding=
s=0D=0A>=20>=0D=0A>=20>=0D=0A>=20>=0D=0A>=20>=20>=20-----Original=20Message=
-----=0D=0A>=20>=20>=20From:=20Sowon=20Na=20<sowon.na=40samsung.com>=0D=0A>=
=20>=20>=20Sent:=20Monday,=20November=2018,=202024=207:40=20AM=0D=0A>=20>=
=20>=20To:=20robh=40kernel.org;=20krzk=40kernel.org;=20conor+dt=40kernel.or=
g;=0D=0A>=20>=20>=20vkoul=40kernel.org;=20alim.akhtar=40samsung.com;=20kish=
on=40kernel.org=0D=0A>=20>=20>=20Cc:=20krzk+dt=40kernel.org;=20linux-kernel=
=40vger.kernel.org;=0D=0A>=20>=20>=20devicetree=40vger.kernel.org;=20linux-=
samsung-soc=40vger.kernel.org;=0D=0A>=20>=20>=20sowon.na=40samsung.com;=20K=
rzysztof=20Kozlowski=0D=0A>=20>=20>=20<krzysztof.kozlowski=40linaro.org>=0D=
=0A>=20>=20>=20Subject:=20=5BPATCH=20v3=201/3=5D=20dt-bindings:=20phy:=20Ad=
d=20ExynosAutov920=20UFS=20PHY=0D=0A>=20>=20>=20bindings=0D=0A>=20>=20>=0D=
=0A>=20>=20>=20Add=20samsung,exynosautov920-ufs-phy=20compatible=20for=20Ex=
ynosAuto=20v920=20SoC.=0D=0A>=20>=20>=0D=0A>=20>=20>=20Signed-off-by:=20Sow=
on=20Na=20<sowon.na=40samsung.com>=0D=0A>=20>=20>=20Acked-by:=20Krzysztof=
=20Kozlowski=20<krzysztof.kozlowski=40linaro.org>=0D=0A>=20>=20>=20---=0D=
=0A>=20>=20I=20am=20not=20sure=20how=20we=20can=20help=20you,=20you=20are=
=20keep=20missing=20to=20collect=20all=0D=0A>=20>=20the=20tags=0D=0A>=20>=
=20https://lkml.org/lkml/2024/11/7/617=0D=0A>=20>=0D=0A>=20Really=20sorry=
=20for=20missing=20tags.=20I=20append=20it=20immediately,=20and=20will=20no=
t=20miss=0D=0A>=20anymore.=0D=0A>=20Your=20review=20helps=20me=20a=20lot=20=
and=20makes=20my=20patch=20better.=20I=20applied=20all=20your=0D=0A>=20revi=
ews=20to=20my=20patches.=0D=0A>=20=0D=0A>=20Thank=20you=20a=20lot=20once=20=
again=20for=20your=20help.=0D=0A>=20=0D=0A=0D=0AI=20missed=20including=20th=
e=20=22Reviewed-by=22=20tag=20in=20the=20patch=20set=20I=20sent.=20Could=20=
you=20please=20let=20me=20know=20if=20you'd=20prefer=20me=20to=20send=20a=
=20v4=20with=20the=20tag=20included,=20or=20if=20you're=20able=20to=20apply=
=20it=20with=20the=20missing=20tag?=0D=0A=0D=0AThank=20you=20for=20your=20u=
nderstanding,=20and=20I=20apologize=20for=20the=20oversight.=0D=0A=0D=0ABes=
t=20regards,=0D=0ASowon.=0D=0A=0D=0A
