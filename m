Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7B6185E50
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 08:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728288278; cv=none; b=bM5N/dmDHtko9Z4LTgVKf4vqBFdIK83B6DVzIW77F+oFfYvIfsp8/zbyYl/pyhdYVZwYHBEG6X7kqtoOb5I1GjcdQaalG7E7chdWtPJSvNLxNC+tjFJDvR75G4c5RRqE6egTnH9BrhcToYqpo8GGAScCA7LU3+YsIACU8dQcdcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728288278; c=relaxed/simple;
	bh=d0Nr50T9BuaMEGr5DGSvDugCxM7HjgbbhG+C5L9WMpc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=bV8Z5WCGfkH1/oXqWPWFSGCW8O/l9FdVgPZqjpTvUq95JdnSWFqIwVRIUI7ecH97wj4rKsM6MxEyz4fdf/IMoRy/U5M4BgLCo7eHbEl7IhpQAChh/f7W0msJsUHyXNleCxGh6plGXDzeM1RmDWQ7gtrMTw2lcKUGEMHbgcgtYsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uz4OQYvq; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uz4OQYvq"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241007080433epoutp0160dbd3c835c59d184a5e05e28b98328f~8HQc1jyhD0686706867epoutp016
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 08:04:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241007080433epoutp0160dbd3c835c59d184a5e05e28b98328f~8HQc1jyhD0686706867epoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728288273;
	bh=RPX6OnITTkeWg+UgZ7xmUxRv/ENHDG8npcBLJcp5fAY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=uz4OQYvq4cKOWw9bVFCPXUos0m/6UHM42coAhY4D+NhdEYAd/iIjiTJcWxR9hJtoB
	 saLRXTr0muP+ZIAg7ZhjdJ5jFIiWPGMR7N6IO6Yd767cQMdSojzU+ukitEAXLDmEVY
	 RTB6kBGuo7OJ81Dy+dYB8uHtHdy1ZshcsFcpk1wY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20241007080433epcas2p392d0ad9103fff9170110096eae69174b~8HQcONqxU0759607596epcas2p3T;
	Mon,  7 Oct 2024 08:04:33 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.92]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XMWrw5GVTz4x9Q7; Mon,  7 Oct
	2024 08:04:32 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	F7.55.09770.01693076; Mon,  7 Oct 2024 17:04:32 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241007080432epcas2p29b631c66d2303786552d52f8aed81da7~8HQba05vB2947929479epcas2p2K;
	Mon,  7 Oct 2024 08:04:32 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241007080432epsmtrp178678f4dc0bbfa575a7fa9ca1d5b403d~8HQbZ9yAk1186511865epsmtrp1e;
	Mon,  7 Oct 2024 08:04:32 +0000 (GMT)
X-AuditID: b6c32a46-00dfa7000000262a-35-67039610e35b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	40.FE.08227.01693076; Mon,  7 Oct 2024 17:04:32 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241007080431epsmtip2930faf35e22019d19dcda213c25e6499~8HQbI7JlJ1335713357epsmtip2P;
	Mon,  7 Oct 2024 08:04:31 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Krzysztof Kozlowski'"
	<krzk+dt@kernel.org>, "'Rob Herring'" <robh@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Alim Akhtar'" <alim.akhtar@samsung.com>,
	"'Sylwester	Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Michael Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
In-Reply-To: <db9dc2ef-2c24-4f1b-82c8-316c347daf60@kernel.org>
Subject: RE: [PATCH 2/3] clk: samsung: exynosautov920: add peric1, misc and
 hsi0/1 clock support
Date: Mon, 7 Oct 2024 17:04:31 +0900
Message-ID: <00a501db188f$8a7142b0$9f53c810$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFSCxBMLhmUc00YvRpkCeNGXSX0HwHNkDzvAdUnffwB72SclrNgdZtw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRmVeSWpSXmKPExsWy7bCmha7ANOZ0gz1zNSwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi5ax7bBbnz29gt9j0+Bqrxceee6wWl3fNYbOYcX4fk8XFU64W//fsYLc4
	/Kad1eLftY0sDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7Y8v0lY8FFgYrdO7czNjAe
	5+1i5OSQEDCR2LLsCEsXIxeHkMAORonjB5eyQzifGCV6jl+Bcr4xSnw5MIsRpqX99342iMRe
	Rom+xvNQzktGiSVPVzGDVLEJ6Eus7r4NlhAR6GGW6Jk7AWwLs8A6Roldf7awg1RxCthJPFo9
	lQXEFhZIktg5bQWYzSKgItH6+gMbiM0rYCkx4+x/RghbUOLkzCdgNcwC8hLb385hhrhJQeLn
	02WsILaIgJvEnAsbWCFqRCRmd7YxgyyWEDjDIbFg1WcghwPIcZH4tl8eoldY4tVxiHskBKQk
	Xva3Qdn5EpOvv2WC6G1glLj2rxtqmb3EojM/2UHmMAtoSqzfpQ8xUlniyC2o0/gkOg7/ZYcI
	80p0tAlBNKpJfLpyGWqIjMSxE8+YJzAqzULy2Cwkj81C8sAshF0LGFlWMYqlFhTnpqcWGxUY
	waM7OT93EyM4EWu57WCc8vaD3iFGJg7GQ4wSHMxKIrwRaxjThXhTEiurUovy44tKc1KLDzGa
	AoN6IrOUaHI+MBfklcQbmlgamJiZGZobmRqYK4nz3mudmyIkkJ5YkpqdmlqQWgTTx8TBKdXA
	xBPZGVH07kL8hZADs3Nm+p/e5PDmj0zc3/JlJpoclxeV6Ucc3698aG9YCOtkI1ZTQ/XZ8Zyy
	N/U+hhu03duqNluCU+jdetvCOsnK4MsBDL/s5mt3Wee0qtb8PCrT+uz1dq2psvaLnMJv73sV
	Ee8Us3M7w3T3i4IFl+ouv+z+ZasRtVhmu6e+cT6DivLGHxLFS19f2SxUf/LtjLUPlNZkhv6Q
	e8fE/zcu5Nrsw/zv913ItP3QF37v7HoOM1aH9O4PP+QF+J9x1xi+0yzOK7OdV/9ecL5sv28W
	56Lvj6TSdCz7PIqEE7/bv5mzsVpZbd+HCLMWjfW3WXMCHkXo9etft53wZh2n+ovgqe5BahOU
	WIozEg21mIuKEwECQxTATQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSvK7ANOZ0g8vT2C0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi5ax7bBbnz29gt9j0+Bqrxceee6wWl3fNYbOYcX4fk8XFU64W//fsYLc4
	/Kad1eLftY0sDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZWz5
	/pKx4KJAxe6d2xkbGI/zdjFyckgImEi0/97P1sXIxSEksJtR4m3XahaIhIzExob/7BC2sMT9
	liOsEEXPGSX+nd/EDJJgE9CXWN19G6xbRGASs8SUF3dYQBxmgU2MElsaXjJDtHxnlDjdsBBs
	FqeAncSj1VPBdggLJEjsbt7HBGKzCKhItL7+wAZi8wpYSsw4+58RwhaUODnzCVg9s4C2RO/D
	VkYIW15i+9s5zBD3KUj8fLqMFcQWEXCTmHNhAytEjYjE7M425gmMwrOQjJqFZNQsJKNmIWlZ
	wMiyilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOC61tHYw7ln1Qe8QIxMH4yFGCQ5m
	JRHeiDWM6UK8KYmVValF+fFFpTmpxYcYpTlYlMR5v73uTRESSE8sSc1OTS1ILYLJMnFwSjUw
	rV03vVUk0Y514a+9Js6P/tzbULIq/+QjFfGvH5il4trtAxPzNX65e0p/3epQrs6yZ/nBja4a
	yansPbxf+bIS97jOj13C+q3PL5H1WKnMnq/nv7hM2peR2H1U4szXvxlnJPkV5LjX+60QfODN
	k9vwtLjBaate6+13H2fV+55bYJLOdsk5h93OXc6ofs2nuTbLPBcFS5eKN5rX+x8TfaLipbOv
	laVrccRVFr1nG04Lv/+8aV7OzaVP+JZ1LGo1OVNn3Xug71LG2+R01cxd8xy09mofX1yxv1v4
	mwOL1rrjLk9ttoduVlkv9c1ixt5X3AcnLv7Fejs9If7UCp25ogJtTHzbdcxi4j4+D80w3rFd
	iaU4I9FQi7moOBEAxBs1ZjoDAAA=
X-CMS-MailID: 20241007080432epcas2p29b631c66d2303786552d52f8aed81da7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240912103903epcas2p4fb9aaeafb223b63c57c2f0cac7f37c3d
References: <20240912103856.3330631-1-sunyeal.hong@samsung.com>
	<CGME20240912103903epcas2p4fb9aaeafb223b63c57c2f0cac7f37c3d@epcas2p4.samsung.com>
	<20240912103856.3330631-3-sunyeal.hong@samsung.com>
	<db9dc2ef-2c24-4f1b-82c8-316c347daf60@kernel.org>

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Monday, September 30, 2024 8:36 PM
> To: Sunyeal Hong <sunyeal.hong@samsung.com>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Rob Herring <robh@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>; Sylwester
> Nawrocki <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
> Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> clk@vger.kernel.org
> Subject: Re: [PATCH 2/3] clk: samsung: exynosautov920: add peric1, misc
> and hsi0/1 clock support
> 
> On 12/09/2024 12:38, Sunyeal Hong wrote:
> > Like CMU_PERIC1, this provides clocks for USI09 ~ USI17, USI_I2C and
> USI_I3C.
> > Like CMU_MISC, this provides clocks for MISC, GIC and OTP.
> > Like CMU_HSI0, this provides clocks for PCIE.
> > Like CMU_HSI1, this provides clocks for USB and MMC.
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> > ---
> 
> ...
> 
> > +
> >  static int __init exynosautov920_cmu_probe(struct platform_device
> > *pdev)  {
> >  	const struct samsung_cmu_info *info; @@ -1154,6 +1431,19 @@ static
> > const struct of_device_id exynosautov920_cmu_of_match[] = {
> >  	{
> >  		.compatible = "samsung,exynosautov920-cmu-peric0",
> >  		.data = &peric0_cmu_info,
> > +	}, {
> > +		 .compatible = "samsung,exynosautov920-cmu-peric1",
> > +		 .data = &peric1_cmu_info,
> > +	}, {
> > +		 .compatible = "samsung,exynosautov920-cmu-misc",
> > +		 .data = &misc_cmu_info,
> > +	}, {
> > +		.compatible = "samsung,exynosautov920-cmu-hsi0",
> > +		.data = &hsi0_cmu_info,
> > +	}, {
> > +		.compatible = "samsung,exynosautov920-cmu-hsi1",
> > +		.data = &hsi1_cmu_info,
> > +	}, {
> 
> This is unrelated change. Please rebase.
> 
Could you please explain in more detail the comment mentioned above?

Best Regards,
sunyeal

> Best regards,
> Krzysztof
> 


