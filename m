Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD68D13B5B7
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720166622; cv=none; b=MCKd2zAsMXE6/L5f9jd2RFxsXT0JBvyRUJcaOHZXBNYhgeN7A+ONAlHQhBn3cF1zzYpGMA5DBYv/rC6BD0MGcIi2Uog/B6oSXRfrK6JZjlEFNbx9DknrLYIy++yMkn+CW2xRdmTlVrTWw5j7OIbyy8hQXQKbGmUbVEwHVeC5BDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720166622; c=relaxed/simple;
	bh=xI8EjAgxQ51VE0UmpIjmIWdiuSCttU6JpamLphCVgGY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=ryi+4QX7a13BT6f8x/bYZLE+NKVQMj1sbC9MMMAch8DimNR7Qtnv63gwmROYLmULpOhzkMTLyR+aFpS+1rXb04ZX2M79HQMCbuDgAmrYB4EMP166/kGQmS42aWXloGNanDY2r0fGgvdJ59ztvC5dnGq21Ks7JAF5qiTZN4kIND8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NQ1sO/8s; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NQ1sO/8s"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240705080338epoutp03c5037fa560d9ebd3d2785129c362915e~fQmznOg7O0279302793epoutp03V
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 08:03:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240705080338epoutp03c5037fa560d9ebd3d2785129c362915e~fQmznOg7O0279302793epoutp03V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720166618;
	bh=xI8EjAgxQ51VE0UmpIjmIWdiuSCttU6JpamLphCVgGY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=NQ1sO/8s7AaJ6ZR3SCWO1KJvhglZqSRaj/meeb5xlWkJQAbXKANQdrLQdUnv/JBky
	 KQLUbBhY6GZX+Q3d+O9I5NP3PbQ1WMR7JsmR+7S0o0QuuyjsQRRlWmKu+OXeQaD94S
	 fX2fGyvvBDq7emnNpqeE1Rt7X0Y/v3yhzfNPy0fk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240705080337epcas2p1a1519a7e1d3ea5f4976424f7d291977e~fQmy6jFUD2599925999epcas2p1O;
	Fri,  5 Jul 2024 08:03:37 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.97]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WFmHF0DTyz4x9Px; Fri,  5 Jul
	2024 08:03:37 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	C5.32.09806.8D8A7866; Fri,  5 Jul 2024 17:03:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240705080336epcas2p22b09e94f85e163e03e039326f3831b39~fQmyByE-b1251712517epcas2p2H;
	Fri,  5 Jul 2024 08:03:36 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240705080336epsmtrp1d51c502eba07a2f8052bd4df673cae7b~fQmyBEKuF1316813168epsmtrp1g;
	Fri,  5 Jul 2024 08:03:36 +0000 (GMT)
X-AuditID: b6c32a47-ecbfa7000000264e-fc-6687a8d8a8f0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	08.9F.19057.8D8A7866; Fri,  5 Jul 2024 17:03:36 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240705080336epsmtip22780df60491d052dde1c7481a941c4c7~fQmxz518B1579315793epsmtip21;
	Fri,  5 Jul 2024 08:03:36 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <8f4deb36-2a44-414a-9b9f-40b87bc7c949@kernel.org>
Subject: RE: [PATCH 2/5] dt-bindings: clock: add clock binding definitions
 for Exynos Auto v920
Date: Fri, 5 Jul 2024 17:03:35 +0900
Message-ID: <01c401daceb1$d64e7450$82eb5cf0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIPebKt0SL2hL1PGxWEYogtVpy49QFdVAxIAswtgRoBIrCNybFUDUGw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmhe6NFe1pBs+emFo8mLeNzeL6l+es
	FufPb2C3+Nhzj9Xi8q45bBYzzu9jsrh4ytXi8Jt2Vot/1zayOHB6vL/Ryu6xaVUnm0ffllWM
	Hp83yQWwRGXbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl
	5gCdoqRQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpMC/QK07MLS7NS9fLSy2xMjQw
	MDIFKkzIzjj36CZ7wQKxipX3TzA2MJ4U6mLk5JAQMJG41TOdvYuRi0NIYAejRNvh/1DOJ0aJ
	9W1nGCGcb4wS826vY4JpWXf9EAtEYi+jxN7pB8ESQgIvGSX+b7cFsdkE9CVWd99mAykSEehn
	kpj3/AcrSIJZIE1ixakt7CA2p4CdxMJDzcwgtrBAosT0D1PAalgEVCSeHfsPNpRXwFLi9Jz1
	jBC2oMTJmU9YIOZoSyxb+JoZ4iIFiZ9Pl4H1igi4SVydvYIRokZEYnZnGzPIERICMzkkNi9o
	hXrBReLNyxeMELawxKvjEAdJCEhJvOxvg7LzJSZff8sE0dzAKHHtXzfUNnuJRWd+AhVxAG3Q
	lFi/Sx/ElBBQljhyC+o2PomOw3/ZIcK8Eh1t0LBWk/h05TLUEBmJYyeeMU9gVJqF5LNZSD6b
	heSDWQi7FjCyrGIUSy0ozk1PLTYqMIbHdnJ+7iZGcDLVct/BOOPtB71DjEwcjIcYJTiYlUR4
	pd43pwnxpiRWVqUW5ccXleakFh9iNAWG9URmKdHkfGA6zyuJNzSxNDAxMzM0NzI1MFcS573X
	OjdFSCA9sSQ1OzW1ILUIpo+Jg1Oqganj9Ob72/OO1u2/vYrrEEvlvTU8DOl8u+ucjy1U2Njs
	FLoz+uiylefe2+ycqKqpum+/323N2v4ESZ2+pF9r+ky/GubMF2rs2bDs7LaJ834E3/9XkZjR
	Xxv4df+dSdvX+by+brax709tpeSiJxblpRuMJLI9BJ5LCDxr7Xzx/bppot4i76OGTaLR7698
	Zv2+9r+5Z1/NlgfBP1LPHnVXEeD19H7izeDze7nPj/xowY7g7WyfvUujDubvsXlSwd3Ou2Dy
	3jDf4NZDv56+slY9VCXLcK6xbpVD0SGlKTV/LXmnS796PHfNsaVLVpwpfrW3NvaD+oO56UwG
	d26L/OzyVeCQDvuzoibl+8yD/cxNtbOVWIozEg21mIuKEwEfUhO4LwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJXvfGivY0g+5fohYP5m1js7j+5Tmr
	xfnzG9gtPvbcY7W4vGsOm8WM8/uYLC6ecrU4/Kad1eLftY0sDpwe72+0sntsWtXJ5tG3ZRWj
	x+dNcgEsUVw2Kak5mWWpRfp2CVwZH36sYC74L1oxZfJN9gbGeUJdjJwcEgImEuuuH2LpYuTi
	EBLYzSix8ecvVoiEjMTGhv/sELawxP2WI6wQRc8ZJSZcPwqWYBPQl1jdfZsNJCEiMJlJ4ujO
	nYwgCWaBDIlD196zQXR8Z5SY/7yNGSTBKWAnsfBQM5DNwSEsEC/R+9QeJMwioCLx7Nh/JhCb
	V8BS4vSc9YwQtqDEyZlPWCBmaks8vfkUzl628DUzxHUKEj+fLgO7WkTATeLq7BVQN4hIzO5s
	Y57AKDwLyahZSEbNQjJqFpKWBYwsqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxgiNL
	S2sH455VH/QOMTJxMB5ilOBgVhLhlXrfnCbEm5JYWZValB9fVJqTWnyIUZqDRUmc99vr3hQh
	gfTEktTs1NSC1CKYLBMHp1QDU3x2qLBk9rs+Rt079X7RbjMFrpsX9IV+stlu8GKrws4K2RNP
	Eh4u/bs3/cYEnv1N30oj26bsrz0SJa0Vu27h9Nv5Ojp2tTX/MoInP9PUjv/gHNrmx65pGLPk
	vLJ8Si+rcmR+0YaXl1+/nbbQwvjr5q447/XSV5pWsL22dXKeJS1vNJ83jXNt9vmN9Stmsc6b
	MvNln5pozSOhmMgdCwID1XhVzNJZg+aus93AUZ6kPCV7lu8vu5RJ7z/mvimumn7lmfvKfyty
	xTZ9K76qM8Hca8npuTN8/d8ub90+dfaZ8Cpbi6J6oze8spvmTCp+FddosyjXfa5IZvOcj4XS
	glI2h4K+Xv9RuSRw3qqgV4F2SizFGYmGWsxFxYkATG0XbhsDAAA=
X-CMS-MailID: 20240705080336epcas2p22b09e94f85e163e03e039326f3831b39
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705021200epcas2p273ca089c2cb9882f121e864ec8407367
References: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
	<CGME20240705021200epcas2p273ca089c2cb9882f121e864ec8407367@epcas2p2.samsung.com>
	<20240705021110.2495344-3-sunyeal.hong@samsung.com>
	<8f4deb36-2a44-414a-9b9f-40b87bc7c949@kernel.org>

Hello Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Friday, July 5, 2024 3:03 PM
> To: Sunyeal Hong <sunyeal.hong=40samsung.com>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>; Alim
> Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH 2/5=5D dt-bindings: clock: add clock binding defini=
tions
> for Exynos Auto v920
>=20
> On 05/07/2024 04:11, Sunyeal Hong wrote:
> > Add device tree clock binding definitions for below CMU blocks.
> >
> > - CMU_TOP
> > - CMU_PERIC0
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
>=20
> Headers are part of bindings patch.
>=20

Is your request to combine PATCH 0 and 1 correct? If correct, I will update=
 it as requested.

> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older kerne=
l,
> gives you outdated entries. Therefore please be sure you base your patche=
s
> on recent Linux kernel.
>=20
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be fine,
> although remember about =60b4 prep --auto-to-cc=60 if you added new patch=
es to
> the patchset.
>=20
> You missed at least devicetree list (maybe more), so this won't be tested
> by automated tooling. Performing review on untested code might be a waste
> of time.
>=20
> Please kindly resend and include all necessary To/Cc entries.
> </form letter>
>=20
> Best regards,
> Krzysztof

The mail list was created using get_maintainer.pl. If there is any problem,=
 please let me know.

./scripts/get_maintainer.pl -f drivers/clk/samsung/
Krzysztof Kozlowski <krzk=40kernel.org> (maintainer:SAMSUNG SOC CLOCK DRIVE=
RS)
Sylwester Nawrocki <s.nawrocki=40samsung.com> (maintainer:SAMSUNG SOC CLOCK=
 DRIVERS)
Chanwoo Choi <cw00.choi=40samsung.com> (maintainer:SAMSUNG SOC CLOCK DRIVER=
S)
Alim Akhtar <alim.akhtar=40samsung.com> (reviewer:SAMSUNG SOC CLOCK DRIVERS=
)
Michael Turquette <mturquette=40baylibre.com> (maintainer:COMMON CLK FRAMEW=
ORK)
Stephen Boyd <sboyd=40kernel.org> (maintainer:COMMON CLK FRAMEWORK)
linux-samsung-soc=40vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS)
linux-clk=40vger.kernel.org (open list:COMMON CLK FRAMEWORK)
linux-kernel=40vger.kernel.org (open list)

Thanks,
Sunyeal Hong

