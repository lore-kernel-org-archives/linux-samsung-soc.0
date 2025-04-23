Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90CA1758B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 00:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745369169; cv=none; b=oz/TfnOlx18np55wkWfr0/Esuz2cPfDXRg85Uqc3OE5ysLxwsuQcVn7ywECB+cyVaMhF8tDv2L60WL7R4GtDksmJ+RbDo5gTGqVDcr/INVnOSq5G9Y2ipGjZVv4/SObjVj3RO2DR9gjUvUXzABauKQr7fa+pT4jopq0+VlysAos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745369169; c=relaxed/simple;
	bh=/ELxdJsrw9LyX4PHEBuOWIwkMrF2oZbj1XoKIPsTJrY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=TajtOQSRx3oxx3JQD/p09j6CsWnj3o79FQcX0dNBm4zv7JjdZo8hV85iLQEtm4b5dRi7ALU8PBNHw1+RfE2NYPRrfJkbfCcsTwUEK6hDMrh8T77OS3hNHbps2NGGUguuYonPXpFwF8x03HsdJzcbVbGGBR5yD2DZtvG9C74Ntss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=M0SusGMq; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="M0SusGMq"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250423004600epoutp01597ea2959ed5e6f11f2f788c54e30565~4zAD710v33239632396epoutp01c
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 00:46:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250423004600epoutp01597ea2959ed5e6f11f2f788c54e30565~4zAD710v33239632396epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745369160;
	bh=/ELxdJsrw9LyX4PHEBuOWIwkMrF2oZbj1XoKIPsTJrY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=M0SusGMq/BQwHoYwTv/W71NY/wIcU5/BEt6/WhizDMkuKCp2UNwb15KBuW4hLL7nB
	 JJssMGpplatZ3aRN+W9nNaT0d9mOqovYB77jtpyC8elHj4/EfLm4cB6GNpVLRtXaFh
	 fR+koQ6BGXTGfMqaDvbp524DIrftp1fKL3I53E0g=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250423004559epcas2p499bd55fcdc74816f52962571c129f06f~4zADUj31j0829508295epcas2p4N;
	Wed, 23 Apr 2025 00:45:59 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.101]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zj0lW1GfJz3hhTD; Wed, 23 Apr
	2025 00:45:59 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250423004558epcas2p38dfcde1d8068cc8951ced6cf3a864ee1~4zACYlcxy2792927929epcas2p3c;
	Wed, 23 Apr 2025 00:45:58 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250423004558epsmtrp1327cc1b294aa654f2ccfab0953ef1afa~4zACXcAYE1547415474epsmtrp1p;
	Wed, 23 Apr 2025 00:45:58 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-f7-6808384621fe
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	3D.8D.19478.64838086; Wed, 23 Apr 2025 09:45:58 +0900 (KST)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250423004558epsmtip13565d4e756b1ba4cabfa90c306997e2d~4zACKZQas0157801578epsmtip1S;
	Wed, 23 Apr 2025 00:45:58 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Sunyeal Hong'" <sunyeal.hong@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <b5ada346-94e7-41f2-852b-6372f02b4122@kernel.org>
Subject: RE: [PATCH 1/3] dt-bindings: clock: exynosautov920: add cpucl0
 clock definitions
Date: Wed, 23 Apr 2025 09:45:50 +0900
Message-ID: <003601dbb3e9$141c6a40$3c553ec0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGPEGrsijGqefHqKZlvX6MGGm+h1AGzlWR9ARm/BD0BPmLVd7QpU1qg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsWy7bCSnK6bBUeGwcaP0hYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGX/7
	9zIWfOOoWD1pPXsD4yH2LkZODgkBE4mO2U9ZQGwhge2MEqc/K0HEJSQOz5jACGELS9xvOcIK
	UfOcUWLCMUUQm03AUGLVj+1MXYxcHCICE5klLn24wALiMAtsYpQ4t/smG0THe0aJMyc8uhg5
	ODgF7CS+3gZbJiwQKfFp3T+wBSwCqhKfjv4Bi/MKWEp0Xb/BCGELSpyc+QQsziygLdH7sJUR
	xl628DUzxHEKErs/HQU7TkTATeLQtHNQNSISszvbmCcwCs9CMmoWklGzkIyahaRlASPLKkbR
	1ILi3PTc5AJDveLE3OLSvHS95PzcTYzgONQK2sG4bP1fvUOMTByMhxglOJiVRHh/ubFnCPGm
	JFZWpRblxxeV5qQWH2KU5mBREudVzulMERJITyxJzU5NLUgtgskycXBKNTAF3SrOXRCh2JqY
	Z3cx42rJLTvz9BXL52/in/v77/boT2GvKp/J8BpFGKmI3X/V95bbMTG+u/vCjiN9V84xxDYz
	fL3wNcRp9w2L5vSTJ3rWPTT7fLOsfLZfiFpi6ZG7BieWVN1enOPTWeo6hz+yQWgm18dlXNKy
	TmVZTJ5fPqd8VPB/yrnqpnJPiNpf/gyWu2rSMx84bctVFlW5ZlNVVyvx/l2Fz6KGP+fnGf+5
	xCVSnnH+xxS9+jVsglfbr/z6aF8V+blB7N+fiulndnxKmiPKZFG2RDd5QwQfU4Te64dnqhqn
	Vnaej1n5ySCD9/DT8qwYga9bGyP5tCeIrRQ6sr7Ryd7F4in7/OuOl6bOPaXEUpyRaKjFXFSc
	CAAtn+zcMgMAAA==
X-CMS-MailID: 20250423004558epcas2p38dfcde1d8068cc8951ced6cf3a864ee1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250418061515epcas2p3d2dd703db7eb645f4866dcb01cc288fc
References: <20250418061500.1629200-1-shin.son@samsung.com>
	<CGME20250418061515epcas2p3d2dd703db7eb645f4866dcb01cc288fc@epcas2p3.samsung.com>
	<20250418061500.1629200-2-shin.son@samsung.com>
	<b5ada346-94e7-41f2-852b-6372f02b4122@kernel.org>

Hello Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski =5Bmailto:krzk=40kernel.org=5D
> Sent: Tuesday, April 22, 2025 4:54 PM
> To: Shin Son <shin.son=40samsung.com>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>; Alim
> Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Rob Herri=
ng
> <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>; Sunyeal Hong
> <sunyeal.hong=40samsung.com>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH 1/3=5D dt-bindings: clock: exynosautov920: add cpuc=
l0
> clock definitions
>=20
> On 18/04/2025 08:14, Shin Son wrote:
> > Add cpucl0 clock definitions.
>=20
> ... and cpucl0 is? Describe the hardware in the commit msg in the future.
>=20
>=20
> Best regards,
> Krzysztof

Thanks for the feedback.
I'll update the commit message to include a brief description of the hardwa=
re.

Best regards,
Shin Son

