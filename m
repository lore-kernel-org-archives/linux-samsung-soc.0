Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF411DED57
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739963707; cv=none; b=jMv3IhjtpGBimL5SIgVSAzf0SnpAa0J0fbmAQNEAfEyxcZoxfnuiyq0F18LRAco+l8jiS7W+nd2OpdQTfuFLFqb3N7QvqMOq67RPvxgScSVtecniUx1JiAJwoFxD7OsfKQVpX5tDjibV3lvyCz5f/sdLazHKyCUw+dMlz8f30pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739963707; c=relaxed/simple;
	bh=GWGcCY/BKKB/qK6QLbk19gz+fzovv0S7Buc7zIUdEVM=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=mcU0V1URR9bhl/krcFU5AV5VAHeFfw0lmOtPTY7qfPs8gMRkh9PFOLOBYIZdX7apXOSJ8/89tkAnn7vfy2tmfIzOq6lGm0YNcuMDpB0u3UuyJ3S7iw7MZRm4SOD7Afm6ks0kskHkfrMX7ZWDsDNV9Cyp48dF/hKyONciSCv2jm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=oNJKgvtb; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oNJKgvtb"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250219111503epoutp021a6119b017ee80de77bf5ad919786f9d~ll8UJfBsM1318613186epoutp02N
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 11:15:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250219111503epoutp021a6119b017ee80de77bf5ad919786f9d~ll8UJfBsM1318613186epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739963703;
	bh=GWGcCY/BKKB/qK6QLbk19gz+fzovv0S7Buc7zIUdEVM=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=oNJKgvtbYjSUN0eA8kn0lslJtn+kCv5S2pihCZSdTyb9psAozaPMH+sfwrpNELcRn
	 /n0oKA9o6Q9h0/hG1gplzeTaqYfggqHRDyNlR8WkaoWb4gjWWA7Gr6JguIsphaQoei
	 f6jIs2RinS6swkbnmpZ5Wnfe4Ozklr8ruPlNCW+M=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250219111503epcas5p4cb80d56939c54b0b36ce34dfcfb104fb~ll8Txcfhq1795217952epcas5p4R;
	Wed, 19 Feb 2025 11:15:03 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YyYhN5j71z4x9Px; Wed, 19 Feb
	2025 11:15:00 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	24.C5.19933.43DB5B76; Wed, 19 Feb 2025 20:15:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250219111500epcas5p134654617ad4a7306a5e3a02d7a398586~ll8RKu8wW2532725327epcas5p1Z;
	Wed, 19 Feb 2025 11:15:00 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250219111500epsmtrp24ae6f697da0e364610ff71a3783ab974~ll8RFbs-_0748807488epsmtrp2z;
	Wed, 19 Feb 2025 11:15:00 +0000 (GMT)
X-AuditID: b6c32a4a-c1fda70000004ddd-71-67b5bd34287d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	18.ED.18729.43DB5B76; Wed, 19 Feb 2025 20:15:00 +0900 (KST)
Received: from INBRO002756 (unknown [107.111.84.9]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250219111458epsmtip1ad4d3921769d3af8d3e5da40e4d93eec~ll8PYoXN53135331353epsmtip1y;
	Wed, 19 Feb 2025 11:14:58 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, =?UTF-8?Q?'Andr=C3=A9_Draszik'?=
	<andre.draszik@linaro.org>, "'Tudor Ambarus'" <tudor.ambarus@linaro.org>,
	"'Rob Herring'" <robh@kernel.org>, "'Krzysztof	Kozlowski'"
	<krzk+dt@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	<linux-fsd@tesla.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250219085726.70824-2-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 2/2] arm64: dts: tesla: Change labels to lower-case
Date: Wed, 19 Feb 2025 16:44:57 +0530
Message-ID: <0a8d01db82bf$83d4b000$8b7e1000$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH4fj3DFj4PAdpK0pFVpNwdI7DR8QKoHdT8AaxUyEyy8d6aEA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmlq7J3q3pBn0vNS22vNrMYrFm7zkm
	i/lHzrFavJx1j81i7+ut7BabHl9jtXj4Ktzi8q45bBYzzu9jstgw4x+Lxf89O9gtPt2Kc+Dx
	2LSqk83jzrU9bB6bl9R7/Guay+7xeZNcAGtUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmB
	oa6hpYW5kkJeYm6qrZKLT4CuW2YO0HFKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKU
	nAKTAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMxX9XshTM5ap4+7GJqYHxEWcXIweHhICJxJm+
	4C5GLg4hgd2MEl+73rJBOJ8YJab/62PqYuQEcr4xSkzdEAJigzSs6tzNClG0l1Hi5PW5TBDO
	C0aJb3svsoBUsQnoSuxY3AY2SkTgH7NE65I9bCAJTgEXiXsX3rCD2MIC7hJbOt6B2SwCqhKz
	f75lBLF5BSwlPt64wQRhC0qcnPkEbCizgLbEsoWvmSHOUJD4+XQZK4gtIuAkcfrka3aIGnGJ
	l0ePsIMslhBYyiEx6egBdogGF4npC+8yQtjCEq+Ob4GKS0l8freXDcKulli/YR4LhN3BKNG4
	vQbCtpfY+egmCyjAmAU0Jdbv0ofYxSfR+/sJEyQceSU62oQgqlUlmt9dhZoiLTGxu5sVwvaQ
	uLxiBjR4LzJK7D93jHkCo8IsJG/OQvLmLCTvzELYvICRZRWjZGpBcW56arFpgVFeajk8wpPz
	czcxgtOultcOxocPPugdYmTiYDzEKMHBrCTC21a/JV2INyWxsiq1KD++qDQntfgQoykw7Ccy
	S4km5wMTf15JvKGJpYGJmZmZiaWxmaGSOG/zzpZ0IYH0xJLU7NTUgtQimD4mDk6pBqYoE0Pj
	Xws/nH+TvfbjO9+PdXOuvW08nqGSIbCMo4z3np9vQOK7vZ6V3vrzGeo5eatCarxMJs5U2TDn
	m671U+PKxweYZhnzsrt9Xrss5KzstHVb4h/uqs5rkSpQeHC+L7JGdd8zc+fpdZ8XPlcxn+hw
	wePsj8BDTIoltl833Ty9tP+yhBYf/83upGX87/P+qD4vPr4udR+3heHjiLlTr0+U99dnT9nA
	kmoZlLRwQfGupzHBs437nR/a+HziT11+5cWGm+07fn/47TBlqtYRy+rvPc+snO7xP7hRcPsi
	00+FvgPPrH/JzvG4XPXPOPnvh1/HMrw9XkYu+SZyzXh5f+TE9+vSNvaZblWStHTJ6dmoxFKc
	kWioxVxUnAgAPpvkqUQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJTtdk79Z0g8+LeC22vNrMYrFm7zkm
	i/lHzrFavJx1j81i7+ut7BabHl9jtXj4Ktzi8q45bBYzzu9jstgw4x+Lxf89O9gtPt2Kc+Dx
	2LSqk83jzrU9bB6bl9R7/Guay+7xeZNcAGsUl01Kak5mWWqRvl0CV8bjrdMZC3o5Kh5eb2Fu
	YOxk72Lk5JAQMJFY1bmbtYuRi0NIYDejxKan31khEtIS1zdOgCoSllj57zk7RNEzRomzk3Yx
	gyTYBHQldixuYwOxRQTaWCR2bsyGKDrLKNG4+CJYEaeAi8S9C2/AJgkLuEts6XgHZrMIqErM
	/vmWEcTmFbCU+HjjBhOELShxcuYTFhCbWUBbovdhKyOMvWzha2aIixQkfj5dxgqx2Eni9MnX
	7BA14hIvjx5hn8AoNAvJqFlIRs1CMmoWkpYFjCyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1
	kvNzNzGCo0xLcwfj9lUf9A4xMnEwHmKU4GBWEuFtq9+SLsSbklhZlVqUH19UmpNafIhRmoNF
	SZxX/EVvipBAemJJanZqakFqEUyWiYNTqoHJxFZqpcCVjNYKDrbCi35fXfQPRhxZd4eXP1Pf
	8ptGg9uBR2ulfzAedMhvurwnwGn/3wrnzbOPd52v/D+ffy5D9C2nOP/r21ffOuLw8MXSH9qh
	xuv7w3mWbS8IbLWLPebhfGXDtIStXrqXNxUt+LMypH6CxbbVq6TYvVM2Xz8xL8I1922MzY9Z
	/Gddk0/ODWQ5tcj18M1fitz8N6fxH/xivz3jdkJH3+6PGVaqyvIHXGevWPfx1tTwQ0/CuTd1
	locEh/Uqe6+v/hWR0/dFkeucYjn3pPP8T6QjFFdVuASfnrRw0s6Wd92p5gKTuB9+u35xz6aK
	n9o3P1dMtOERbBVdonK6/JOM0U0r3gdsb9LslViKMxINtZiLihMBZYNe5yEDAAA=
X-CMS-MailID: 20250219111500epcas5p134654617ad4a7306a5e3a02d7a398586
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250219085736epcas5p1ab7bb90b526e8b9503a9adce76df8ec7
References: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
	<CGME20250219085736epcas5p1ab7bb90b526e8b9503a9adce76df8ec7@epcas5p1.samsung.com>
	<20250219085726.70824-2-krzysztof.kozlowski@linaro.org>

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Wednesday, February 19, 2025 2:27 PM
> To: Peter Griffin <peter.griffin=40linaro.org>; Andr=C3=A9=20Draszik=0D=
=0A>=20<andre.draszik=40linaro.org>;=20Tudor=20Ambarus=20<tudor.ambarus=40l=
inaro.org>;=0D=0A>=20Rob=20Herring=20<robh=40kernel.org>;=20Krzysztof=20Koz=
lowski=20<krzk+dt=40kernel.org>;=0D=0A>=20Conor=20Dooley=20<conor+dt=40kern=
el.org>;=20Alim=20Akhtar=0D=0A>=20<alim.akhtar=40samsung.com>;=20linux-fsd=
=40tesla.com;=20linux-arm-=0D=0A>=20kernel=40lists.infradead.org;=20linux-s=
amsung-soc=40vger.kernel.org;=0D=0A>=20devicetree=40vger.kernel.org;=20linu=
x-kernel=40vger.kernel.org=0D=0A>=20Cc:=20Krzysztof=20Kozlowski=20<krzyszto=
f.kozlowski=40linaro.org>=0D=0A>=20Subject:=20=5BPATCH=202/2=5D=20arm64:=20=
dts:=20tesla:=20Change=20labels=20to=20lower-case=0D=0A>=20=0D=0A>=20DTS=20=
coding=20style=20expects=20labels=20to=20be=20lowercase.=20=20No=20function=
al=20impact.=0D=0A>=20Verified=20with=20comparing=20decompiled=20DTB=20(dtx=
_diff=20and=20fdtdump+diff).=0D=0A>=20=0D=0A>=20Signed-off-by:=20Krzysztof=
=20Kozlowski=20<krzysztof.kozlowski=40linaro.org>=0D=0A>=20---=0D=0AReviewe=
d-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=0D=0A=0D=0A
