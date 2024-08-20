Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF9D188CD6
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139821; cv=none; b=oonZb92ff77nyobwYn/2nGDZOstrJ/tp0PvGxDiJ/HzRBIz5AbWpm6UuglSkYZKYAqRDY6JKrz2Bf3Vzn15ERA0EPhiGfDjSOHXZUNa+HDXdAQjhEhGGo0FskzXq9tHM4sMB9HKoUQxc8rDunqQmd26KWWk0dMVbgguKxohW7iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139821; c=relaxed/simple;
	bh=eMNumbsNTY3L8+I1RN5L5dUU86ccftSaZENl19XZiLA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=M0dtL4TgtNHVUkcT4Pc+UxEBaJDeuNIUUGMuWUpFTL7gB6cMxtzu8LnmVERqIcKchxgQgO71B7sp3Amrm77tlp5Vc15Yx7xkbNrxFtTEnQ1W6bf1yR5NEZF2BAM5Id825H7o4hmiVFssUFXA+FLL2gxWsgr/xWFNo09Ncy4o8rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=m4jVyo0A; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="m4jVyo0A"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240820074336epoutp020fd903763397e1e600ebe5431f52b53b~tYAdPMCWJ0608606086epoutp02d
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:43:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240820074336epoutp020fd903763397e1e600ebe5431f52b53b~tYAdPMCWJ0608606086epoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724139816;
	bh=hN7FazZh9m/hfP9NKL5IhmckLfZwrHEZbmY1jiXBLHc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=m4jVyo0AeKtCrwIaOaV0VBt7lnN6b2DL6u0QurUkQmZ2xbncwSludJB9FMvEPJufm
	 0z7QRK8CmIxPNMnzfmixlJ4UQRdM4yt7OJZfc5B3j5LyfDGZBTFj8oJqnWf0sxXz2/
	 J/alKHsrg5Lk1mkhQSXIwPvaWBWQvcHBDYkYKiuY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240820074336epcas2p419a2739fd5cb27dd25bb5d9119550885~tYAcuosiR1561615616epcas2p4E;
	Tue, 20 Aug 2024 07:43:36 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.100]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Wp1fv6x5Xz4x9QM; Tue, 20 Aug
	2024 07:43:35 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BE.26.19039.72944C66; Tue, 20 Aug 2024 16:43:35 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240820074335epcas2p4baf78b46ba77f1d0c5c698731da7d999~tYAb_aanX1233812338epcas2p4o;
	Tue, 20 Aug 2024 07:43:35 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240820074335epsmtrp2b4bf5ac0fa79551fb852b87b58d74c65~tYAb9VA-q0498904989epsmtrp2R;
	Tue, 20 Aug 2024 07:43:35 +0000 (GMT)
X-AuditID: b6c32a4d-36b9f70000004a5f-8d-66c44927ee77
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7B.B0.08964.72944C66; Tue, 20 Aug 2024 16:43:35 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240820074335epsmtip1ed5bd7e4ec3a716b008efd948af03286~tYAbqg87f0695306953epsmtip1h;
	Tue, 20 Aug 2024 07:43:35 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <02ab01daf2af$62450520$26cf0f60$@samsung.com>
Subject: RE: [PATCH v6 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Tue, 20 Aug 2024 16:43:34 +0900
Message-ID: <08de01daf2d4$a96b21d0$fc416570$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQLQL30DU0UysUOS1ES52gTWByyh0gIaeEiEAf2S/v0CYnGY3rARdjpw
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJsWRmVeSWpSXmKPExsWy7bCmqa6655E0gw0njCwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANaobJuM1MSU1CKF1Lzk/JTMvHRbJe/g
	eOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoBOVFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnF
	JbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZr8/tZyuYIVpx4NtqxgbG04JdjJwc
	EgImEmfvTWLvYuTiEBLYwyix/sgbJgjnE6PEsl/boJxvjBL/lx9nhGlZ/noiVMteRomPM88x
	QzgvGSUaOzuZQarYBPQlVnffZgNJiAjcYZK4ve4hK4jDLLCOUWLzzCPsIFWcAlYSh58dBbI5
	OIQFwiQmfNMDCbMIqEqc2L2RFcTmFbCUmHb4OBOELShxcuYTFhCbWUBeYvvbOcwQJylI/Hy6
	jBUiLiIxu7MNLC4i4CaxrfE52HUSAic4JB6fvQz1g4vE/xs9ULawxKvjW9ghbCmJz+/2skHY
	+RKTr79lgmhuYJS49q8bapu9xKIzP8GOZhbQlFi/Sx/ElBBQljhyC+o2PomOw3/ZIcK8Eh1t
	QhCNahKfrlyGGiIjcezEM+YJjEqzkHw2C8lns5B8Mwth1wJGllWMUqkFxbnpqclGBYa6eanl
	8ChPzs/dxAhOw1q+Oxhfr/+rd4iRiYPxEKMEB7OSCG/3y4NpQrwpiZVVqUX58UWlOanFhxhN
	geE9kVlKNDkfmAnySuINTSwNTMzMDM2NTA3MlcR577XOTRESSE8sSc1OTS1ILYLpY+LglGpg
	krqa56LdmD5DSW+L2DS3v2c2S+20OPDQLKTnhv3DohSxyuar4RJv702J/PirKGAv95ddD9Zs
	UPwzo6j39Q7Bv/9ti9gYDDe9bbfw+VhnWjlzy7/YgtZ5Uwt/ByvOvumXEhe6XGBZpaGIx50G
	sZl5Th/Vgzt3Hpox55fNyrClyw8kZJyTuLzTVPpcysye5cyuzPk9LLN1tY7wFZrfuhe/Inf3
	1ltzG9VP/D7RLWG+L3CW5OUcLXnf9Vx3FBetPf7ny4a1T36EJMuIpU2RXrf6ZfH5zK2sxi9k
	pDafE2t5r+y6/cwxmRNBBspND53tmj7zzf8l4MUdaXJROaS/qyH/+n6xOZscAmQr1DbHW/U4
	KrEUZyQaajEXFScCAGnVU0NMBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWy7bCSnK6655E0gzP7hSwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANYoLpuU1JzMstQifbsErozX5/azFcwQ
	rTjwbTVjA+NpwS5GTg4JAROJ5a8nsncxcnEICexmlFjdO5UdIiEjsbHhP5QtLHG/5QgrRNFz
	Rokjj2exgSTYBPQlVnffZgNJiAg8YpL4/HMX2ChmgU2MEud232SDaPnMKDFz/mcmkBZOASuJ
	w8+Ogs0VFgiRmPZoD1icRUBV4sTujawgNq+ApcS0w8eZIGxBiZMzn7CA2MwC2hK9D1sZIWx5
	ie1v5zBD3Kcg8fPpMlaIuIjE7M42sLiIgJvEtsbnzBMYhWchGTULyahZSEbNQtK+gJFlFaNk
	akFxbnpusWGBYV5quV5xYm5xaV66XnJ+7iZGcDRqae5g3L7qg94hRiYOxkOMEhzMSiK83S8P
	pgnxpiRWVqUW5ccXleakFh9ilOZgURLnFX/RmyIkkJ5YkpqdmlqQWgSTZeLglGpgOhf/tz/E
	9uyas+85Fawm9J+4evHkruCqf1wPhVz9dY/4+i4J+jdLLeeN0aKjphuvKr4Xvrty25+bYnx6
	9aUTglg/3zz81O/kvApL9g0Gt97djXz56vymNFWToOSd98pYPufs++e3ba33QvZz63fLnqte
	zPt6c+u2eQvvvzVqqLrApCd5+mryWcnD/czTmHUXWp6T3PLNYuq/9E0/M37yxeUff7ssdeE/
	Va9nF1TvGRnPclE4KDq5+8slzzfLfiWGurIZnlViXyh5ODjb4sYRnj8RDv1eoS1XS1QmvXZZ
	8VR41n9Tz8cnPmmvKLrXPZXlW/zUz3HZ/zJ9ysM6K7/tFf/i9TzwoOmMGdULtk6QdXdQYinO
	SDTUYi4qTgQA0c0AxjUDAAA=
X-CMS-MailID: 20240820074335epcas2p4baf78b46ba77f1d0c5c698731da7d999
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240819052422epcas2p4db394defd5f298658f7841af3649ac6f
References: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
	<CGME20240819052422epcas2p4db394defd5f298658f7841af3649ac6f@epcas2p4.samsung.com>
	<20240819052416.2258976-2-sunyeal.hong@samsung.com>
	<02ab01daf2af$62450520$26cf0f60$@samsung.com>

Hello Alim,

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar@samsung.com>
> Sent: Tuesday, August 20, 2024 12:17 PM
> To: 'Sunyeal Hong' <sunyeal.hong@samsung.com>; 'Krzysztof Kozlowski'
> <krzk@kernel.org>; 'Sylwester Nawrocki' <s.nawrocki@samsung.com>; 'Chanwoo
> Choi' <cw00.choi@samsung.com>; 'Michael Turquette'
> <mturquette@baylibre.com>; 'Stephen Boyd' <sboyd@kernel.org>; 'Rob
> Herring' <robh@kernel.org>; 'Conor Dooley' <conor+dt@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH v6 1/4] dt-bindings: clock: add ExynosAuto v920 SoC
> CMU bindings
> 
> Hi Sunyeal,
> 
> > -----Original Message-----
> > From: Sunyeal Hong <sunyeal.hong@samsung.com>
> > Sent: Monday, August 19, 2024 10:54 AM
> > To: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> > <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
> > Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> > <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob
> > Herring <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>
> > Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux- kernel@vger.kernel.org; Sunyeal Hong <sunyeal.hong@samsung.com>
> > Subject: [PATCH v6 1/4] dt-bindings: clock: add ExynosAuto v920 SoC
> > CMU bindings
> >
> > Add dt-schema for ExynosAuto v920 SoC clock controller.
> > Add device tree clock binding definitions for below CMU blocks.
> >
> > - CMU_TOP
> > - CMU_PERIC0
> >
> Do update the commit message to match with the changes in this patch
> Thanks
> 

Okay... I'll update this, too.
Thanks

> > Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> > ---
> >  .../clock/samsung,exynosautov920-clock.yaml   | 197 ++++++++++++++++++
> >  .../clock/samsung,exynosautov920.h            | 191 +++++++++++++++++
> >  2 files changed, 388 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> > clock.yaml
> >  create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h
> >
> [snip]
> 
> > diff --git
> >
> > +      - samsung,exynosautov920-cmu-top
> > +      - samsung,exynosautov920-cmu-peric0
> > +      - samsung,exynosautov920-cmu-peric1
> > +      - samsung,exynosautov920-cmu-misc
> > +      - samsung,exynosautov920-cmu-hsi0
> > +      - samsung,exynosautov920-cmu-hsi1
> > +
> [snip]
> 
> > +#endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
> > --
> > 2.45.2
> 


