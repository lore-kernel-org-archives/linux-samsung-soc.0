Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A708F66
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720578169; cv=none; b=PVdxAf2AmgP9+LZtyckPvNHRKbVeS9zgt8/k+GWiBnASYPqCYIagOZoOEsitOtTJa3W1xtfIcY1VgWCPd5fXfr+435J7l13QFMRM/X7KuAnZH7OCWeJGjjLE/2QWAoK70Gytrtd7OjO0i67Bfz1lJo7vqtfIrszbgR6Hdai33/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720578169; c=relaxed/simple;
	bh=exy/3SWSqSbemeMVW5eEXLE0MxoV5Vfj924B0k3VrZ0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=fryjlDgZ0NjyBB336zd1jAo3rnKtmtjT2UZKtnT3tOMHzxp5TFtnBH0cpoedRlhzt82Sw7msBgalmuOsuuBtLsQWN3KrR7mV9fFoIvYZn/QrqfzPfluy4CpIhcq/Vo9NDNc6vq+57ZodsCuqGhJzS8O8Wl5QyzaC6MOhY6bbF7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gbiLjUbm; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gbiLjUbm"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240710022245epoutp03dc1763addc000ef73b700b7d2553c94a~guLmhfRV02883228832epoutp03i
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:22:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240710022245epoutp03dc1763addc000ef73b700b7d2553c94a~guLmhfRV02883228832epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720578165;
	bh=uw+bsmZVY7hnnavGq0UHXYJ7wgRwm/6D69JG/zFh/As=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=gbiLjUbm0fCwA7WRe7QCSSqneewf7i8L5aW8DJZUS3QsXqjNSkpUiJ6/b5deLAFuB
	 padbL/iCfxBcL8ycdzOuYO60JdCHNKpsbyIgU8/e+vZopwYpoUrjhG6soRhwtMmaEC
	 puvBt8XPcnoJ61UeOcT6djnLp3RFZHbPBcj85ZRY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20240710022243epcas5p4dca8a4ebacfb7b8de2d253786b7fb4d6~guLlPVUH_0144901449epcas5p48;
	Wed, 10 Jul 2024 02:22:43 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WJhTX32Htz4x9Q1; Wed, 10 Jul
	2024 02:22:40 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	82.88.09989.E60FD866; Wed, 10 Jul 2024 11:22:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240710022238epcas5p1e1a54ce77378641c52e4d67329ac26eb~guLgDdWn_1105011050epcas5p1Q;
	Wed, 10 Jul 2024 02:22:38 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240710022238epsmtrp2106e6e31ca779ca8a834eb67cf5481a9~guLgCnvYm0614606146epsmtrp2V;
	Wed, 10 Jul 2024 02:22:38 +0000 (GMT)
X-AuditID: b6c32a4a-bffff70000002705-29-668df06e217a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	77.2A.19057.D60FD866; Wed, 10 Jul 2024 11:22:38 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240710022236epsmtip26c11ec9c6702e6856202b24eed5847be~guLeQIBaC0384103841epsmtip2S;
	Wed, 10 Jul 2024 02:22:36 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Rob Herring'" <robh@kernel.org>
Cc: "'Sunyeal Hong'" <sunyeal.hong@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo	Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Conor
 Dooley'" <conor+dt@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20240709162255.GA3676452-robh@kernel.org>
Subject: RE: [PATCH v2 1/4] dt-bindings: clock: add Exynos Auto v920 SoC CMU
 bindings
Date: Wed, 10 Jul 2024 07:52:34 +0530
Message-ID: <015401dad270$0822f610$1868e230$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQE7Blz4AfM7P5wBaRtFEQIwSLSysN8xaMA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGJsWRmVeSWpSXmKPExsWy7bCmpm7eh940gxMd0hZr9p5jsrj+5Tmr
	xfwj51gtzp/fwG6x6fE1VouPPfdYLS7vmsNmMeP8PiaLi6dcLf7v2cFucfhNO6vFv2sbWSya
	lq1ncuD1eH+jld1j06pONo/NS+o9+rasYvT4vEkugDUq2yYjNTEltUghNS85PyUzL91WyTs4
	3jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6EQlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5x
	ia1SakFKToFJgV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbG3NuPWAr+CVU8m7mXqYHxFV8XIyeH
	hICJROPB/YxdjFwcQgK7GSVW73nKDuF8YpSYvfkdE4TzjVHiWudV1i5GDrCWm088QbqFBPYy
	Sjx+WApR84JRYsrV7awgCTYBXYkdi9vYQGwRAVWJplkPWECKmAWeM0s8nfmKCSTBKWAucaR5
	IwuILSwQLvH3xAR2EJsFqGHPicNgg3gFLCXet0xih7AFJU7OfAJWzywgL7H97RxmiB8UJH4+
	XcYKscxPYuG0r0wQNeISL48eAXtHQuAIh8T9nmmsEA0uEtcbpzBB2MISr45vYYewpSQ+v9vL
	BmFnSxy/OAvKrpDobv0IVWMvsfPRTRZQSDALaEqs36UPsYtPovf3EyZIAPFKdLQJQVSrSjS/
	u8oCYUtLTOzuhrrAQ2LSv0eMExgVZyH5bBaSz2Yh+WAWwrIFjCyrGCVTC4pz01OLTQuM8lLL
	4fGdnJ+7iRGcgLW8djA+fPBB7xAjEwfjIUYJDmYlEd75N7rThHhTEiurUovy44tKc1KLDzGa
	AoN7IrOUaHI+MAfklcQbmlgamJiZmZlYGpsZKonzvm6dmyIkkJ5YkpqdmlqQWgTTx8TBKdXA
	FC+Z6nM1RNR6/rnqGpYdCTf/umewvZ16RSBpteqNbdODv1zNT1/mF2nD9lpd+sPlOVXmPsbr
	bfsiNj+PWi2UI79kj8L8uh93Vc7q3mbmM+U/fHBdymOmTfm97CpudfsKPG9Ok35r8vCrSXP7
	jRL9UhdR1dsr17XP+xr5p8Nuh7R5/jTeFj39pCWHrZLMr/IVF7kKnzGeuqhlXxTHe8v1y6sE
	rgstjdJPnv3gQM6lf+tO3V1q6HBGYOlHjVTf+I0b5TdLv1jhFpES5lG6pzbp85wlLJsyXukG
	vjns8n/OjrMOK69/cGS6HL9oWi0Lr0zk3lbDzP62o5WTbgjMK9T/OHWzJ9/Emalb8mZ81F+p
	rMRSnJFoqMVcVJwIAPqBnoNJBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsWy7bCSvG7eh940g+mvGS3W7D3HZHH9y3NW
	i/lHzrFanD+/gd1i0+NrrBYfe+6xWlzeNYfNYsb5fUwWF0+5Wvzfs4Pd4vCbdlaLf9c2slg0
	LVvP5MDr8f5GK7vHplWdbB6bl9R79G1ZxejxeZNcAGsUl01Kak5mWWqRvl0CV8bc249YCv4J
	VTybuZepgfEVXxcjB4eEgInEzSeeXYxcHEICuxklJl84y9TFyAkUl5a4vnECO4QtLLHy33N2
	iKJnjBKbjl9gA0mwCehK7FjcBmaLCKhKNM16wAJSxCzwkVniYt89RoiOeUwSH99uA6viFDCX
	ONK8kQXEFhYIlfh76wQjiM0C1L3nxGFWEJtXwFLifcskdghbUOLkzCcsIKcyC+hJtG0EK2cW
	kJfY/nYOM8R1ChI/ny5jhTjCT2LhtK9MEDXiEi+PHmGfwCg8C8mkWQiTZiGZNAtJxwJGllWM
	kqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMFRqKW1g3HPqg96hxiZOBgPMUpwMCuJ8M6/
	0Z0mxJuSWFmVWpQfX1Sak1p8iFGag0VJnPfb694UIYH0xJLU7NTUgtQimCwTB6dUA9OKAJMF
	s1/E/Zn9cm14S0tpwd7NvYu2dLxYLLq8UL/LUOatnsEuG0Wf9xWMTME3uw5K8ivM79FxfsH/
	4fiHe6k/b3lW9m6IF1ZZu1pB8/qUaVrdsgxPmQ4wLP0846/gh3j2/XZ6dySUmR6e7DY1bOte
	uIpr/9eoRQ7/lA4t94+3DDRoT8/6sly3cmauLJvPU96pF5hOHys58FB2t4HSo2cSG5hvzw0v
	OGGU6C/b9YBRz+0Ai6b4MjnZgGAxo7jCDQoRoXeNzgdyLNjd8Szu4BU3l7aciPcOasqMUYIB
	4hLZq1fqnY0T6du82jK7nIMl6vTmpfPPppUrcHTrzNgf1iG09vWNwAfTa8Pexk7UU2Ipzkg0
	1GIuKk4EAEwxCpgxAwAA
X-CMS-MailID: 20240710022238epcas5p1e1a54ce77378641c52e4d67329ac26eb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231444epcas2p17d7c9842f0acaff0cc352d5c15f38e73
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231444epcas2p17d7c9842f0acaff0cc352d5c15f38e73@epcas2p1.samsung.com>
	<20240707231331.3433340-2-sunyeal.hong@samsung.com>
	<000001dad121$bf3c0a80$3db41f80$@samsung.com>
	<20240709162255.GA3676452-robh@kernel.org>

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, July 9, 2024 9:53 PM
> To: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: 'Sunyeal Hong' <sunyeal.hong@samsung.com>; 'Krzysztof Kozlowski'
> <krzk@kernel.org>; 'Sylwester Nawrocki' <s.nawrocki@samsung.com>;
> 'Chanwoo Choi' <cw00.choi@samsung.com>; 'Michael Turquette'
> <mturquette@baylibre.com>; 'Stephen Boyd' <sboyd@kernel.org>; 'Conor
> Dooley' <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v2 1/4] dt-bindings: clock: add Exynos Auto v920 SoC
> CMU bindings
> 
> On Mon, Jul 08, 2024 at 03:59:40PM +0530, Alim Akhtar wrote:
> > Hello Sunyeal
> >
> > > -----Original Message-----
> > > From: Sunyeal Hong <sunyeal.hong@samsung.com>
[snip]
> > > +            - description: External reference clock (38.4 MHz)
> > > +            - description: CMU_PERIC0 NOC clock (from CMU_TOP)
> > > +            - description: CMU_PERIC0 IP clock (from CMU_TOP)
> > > +
> > > +        clock-names:
> > > +          items:
> > > +            - const: oscclk
> > > +            - const: noc
> > > +            - const: ip
> > These are too generic name, please add peric0_noc and peric0_ip, and
this
> is to match with the UM.
> > I am sure in future you would like to add other IPs like USI, I2C etc
> > for the peric0 block
> 
> Names are local to the block, so adding the block name is redundant.
> 
Yes, noc and IP clocks are input to CMU_PERIC0 block which is coming from
another block (CMU_TOP)
The name mentioned in the UM as DIV_CLKCMU_PERIC0_NOC and
DIV_CLKCMU_PERIC0_IP. To match UM,
suggested to add prefix block name. It is redundant though.
I can think of a case where clock names are big and taking several
characters, it make sense to drop the prefix. 

> Wouldn't USI and I2C clocks be outputs? This property is input clocks.
> 
Yes it is, what I meant was the clock ID mentioned in
include/dt-bindings/clock/samsung,exynosautov920.h
Also contains _PERIC0_ as prefix.

I am fine with the recommended name (just keeping NoC and IP) for the local
clocks to a block.

> The names and descriptions should be defined at the top level and then
here
> should be just 'minItems: 3' (And above 'maxItems: 1').
> 
> Rob

