Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F16261565
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745836888; cv=none; b=arnVAoZS0QW4tfzZXvE5v2t8qPW9RpbcHM2r/17FN9g3Vu2fiT8yutRqtClQ8Xjb1+sK4l5Kr7nlrK61HAPzh+01iec7+oxCT3ujuPCrSAymgel83A4krqPFr7coWEcp8J6WeUlNNmI8GptMGa5K5uzDF9z0HuIX9qVeOv6HjKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745836888; c=relaxed/simple;
	bh=Vm7qliEL+U0f1iQBYUqrrTlLguK2QMufO3UPrOVlLcM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=CpTbuOgBg1J0epdEaK51XceAvuPGeKIZ7mS64DEb7uCeGZUVQmq0bgQwKHCtNDnOcelTo4aSj17J5h+rqvCfMG9F02ASQ+e3/ETZHBgiFMWJaSS9b5gP2FTB65Y8BAtzHdOzNKtE9O1hiKRaDrldgBZ4DMRfK3uw8U2iqKtnXL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Y/c59yuT; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Y/c59yuT"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250428104122epoutp012c1710e23dcfb8dd6bd9075da7e0df32~6dWUXkl312886128861epoutp01N
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 10:41:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250428104122epoutp012c1710e23dcfb8dd6bd9075da7e0df32~6dWUXkl312886128861epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745836882;
	bh=Per/s3GLdQBrXVmnb/0ApsgYI11Thl7c7vR99d1KZKM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Y/c59yuTJakOag9K+40eNUz9PH9sRJFBfm1xoAnH5Ls30XiqEkSF4MvAAGXm+2lQJ
	 ocAabOUQHDPLuUC+6gDNw67JksZX1Z56wHNjn+R0yAhQp4+z1Ft4A4VrdiLtfWRe/u
	 ScTpn5K7laGU1e56j7poE5ljdEr8Hx0Xi0e9/ztE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250428104121epcas2p2664c11c25322a64c834805e7b64726d4~6dWTzEM-40152201522epcas2p24;
	Mon, 28 Apr 2025 10:41:21 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.99]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZmKk94plkz2SSKd; Mon, 28 Apr
	2025 10:41:21 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250428104120epcas2p2678b32dcf4967de037b092d61a98b78b~6dWSyFRJd0152201522epcas2p23;
	Mon, 28 Apr 2025 10:41:20 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428104120epsmtrp2387a91d294cc6c3c812a787510e16d16~6dWSxKUGB1266612666epsmtrp2c;
	Mon, 28 Apr 2025 10:41:20 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-3a-680f5b50f7f8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BA.9D.08766.05B5F086; Mon, 28 Apr 2025 19:41:20 +0900 (KST)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250428104120epsmtip2a4b3dd0caed8045c506ad944f0e99973~6dWSkeRA_1158811588epsmtip28;
	Mon, 28 Apr 2025 10:41:20 +0000 (GMT)
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
In-Reply-To: <cc76fdc3-761f-4171-aec4-02f5e6013cb8@kernel.org>
Subject: RE: [PATCH 1/3] dt-bindings: clock: exynosautov920: add cpucl1/2
 clock definitions
Date: Mon, 28 Apr 2025 19:41:20 +0900
Message-ID: <02d401dbb82a$14449de0$3ccdd9a0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJbASRnoWq0F4GjHT9tcwPYQHtTxAF8kF2mAeFCTbUCVbay3LKMpwCw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSvG5ANH+GwYJ2I4sH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksWhatp7Jgc/j/Y1Wdo9NqzrZPDYvqffo27KK0ePzJrkA1igum5TUnMyy1CJ9uwSujOZ7
	85kL1ghUnDm3mqmB8QBPFyMnh4SAicS21U+Zuxi5OIQEdjNKbF//hgkiISFxeMYERghbWOJ+
	yxFWiKLnjBILFv4HK2ITMJRY9WM7E0hCRGAis8SlDxdYQBxmgU2MEud232SDaHnPKPF1HUiG
	k4NTwE5iw9KPYO3CAtESU77fAIuzCKhKfDsxmxXE5hWwlPh9aBILhC0ocXLmEzCbWUBbovdh
	KyOELS+x/e0cZoj7FCR2fzoK1isi4CYx6+V9JogaEYnZnW3MExiFZyEZNQvJqFlIRs1C0rKA
	kWUVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZwXGpp7mDcvuqD3iFGJg7GQ4wSHMxK
	IrxVBvwZQrwpiZVVqUX58UWlOanFhxilOViUxHnFX/SmCAmkJ5akZqemFqQWwWSZODilGpgS
	um90xa2a5twz31bQ5ZiSysIZVvtswo+eDV1rqn2jcAafwJZGnRrVy+8O2vetnvpdKO/LnutZ
	CV55h/t+lc8RXFReNb8r4pmKVPaElyb6mzgPMJYZFpu1ie9+kv+jd7P8xhs3b93ftWjxVIHy
	v8mdzwouZz6Z8Nnlbe9XI9FrxYvT4p56ragN+X6xT/FI+72clac/WVWIVYatTsx42Rm0/9qH
	b0uK16/eY71jvQ6T9/z5Nqv9Xs3+UXC8sKfwcEK30HFlX1EHrlmr5O0+rlO55/Hhztwbet8u
	W6WW13LE9gZOVq3fOOtz+8GQlxscnypd+uirdKkxbyGbu4BE9OvAuLU3u85NmnnP/FHg6u8T
	lFiKMxINtZiLihMBlBwKVzoDAAA=
X-CMS-MailID: 20250428104120epcas2p2678b32dcf4967de037b092d61a98b78b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428084728epcas2p34ffa0051a16c10ff1c358a98cc2c2fa4
References: <20250428084721.3832664-1-shin.son@samsung.com>
	<CGME20250428084728epcas2p34ffa0051a16c10ff1c358a98cc2c2fa4@epcas2p3.samsung.com>
	<20250428084721.3832664-2-shin.son@samsung.com>
	<cc76fdc3-761f-4171-aec4-02f5e6013cb8@kernel.org>

Hello Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: Monday, April 28, 2025 6:13 PM
> To: Shin Son <shin.son@samsung.com>; Sylwester Nawrocki
> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
> Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob Herring
> <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sunyeal Hong
> <sunyeal.hong@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 1/3] dt-bindings: clock: exynosautov920: add cpucl1/2
> clock definitions
> 
> On 28/04/2025 10:47, Shin Son wrote:
> > Add cpucl1 and cpucl2 clock definitions.
> >
> > CPUCL1/2 refer to CPU Cluster 1 and CPU Cluster 2, which provide clock
> > support for the CPUs on Exynosauto V920 SoC.
> 
> You should have sent all cpcl0-2 together, so we see complete picture.
> 
> >
> > Signed-off-by: Shin Son <shin.son@samsung.com>
> > ---
> >  .../clock/samsung,exynosautov920-clock.yaml   | 45 +++++++++++++++++++
> >  .../clock/samsung,exynosautov920.h            | 32 +++++++++++++
> >  2 files changed, 77 insertions(+)
> >
> 
> 
> ...
> 
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (38.4 MHz)
> > +            - description: CMU_CPUCL2 SWITCH clock (from CMU_TOP)
> > +            - description: CMU_CPUCL2 CLUSTER clock (from CMU_TOP)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +            - const: switch
> > +            - const: cluster
> > +
> > +
> Just one blank line.
> 
> Best regards,
> Krzysztof

Thanks for the feedback.
I will group related patches together next time for a more complete view.
I will also remove the extra blank line and resend the patch.

Best regards,
Shin Son

