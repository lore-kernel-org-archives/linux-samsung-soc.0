Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA1329424
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 01:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724118395; cv=none; b=gg9tupRgpsHD49FRDEswm9v33iwQ9tlQ6rs8NE6BNiuDHlwn60VWVkaQydxSpbXOP/k3TflgOCZg5jTiDcZOreo86jpkmZ2SXZQbaezuZDney0gnYMr6WccTJPX2tUCXYtS4X39AxUIXrGU0wQWNvCC2L4gg1blO/TOWRlJdJ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724118395; c=relaxed/simple;
	bh=11EkUJQGxRVj3mLgiv7BwAlhqWQUyDxoRUsIT1LnvB4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=kg5Tg1OlrWYTrpq/wCia+uBkY76HW5oVbL3IlHomVysSzD0p5bWSEncHmqRMRxt6pkvdSlAtDSVo9SAcgns1fa9qpmOWKvHpPSQQJ+XRpOBtcTj4JYdqN6/yIAxLsmtJ9qoy38j+zFX3PqgnDIp8p1zoE/7CUlgs/a6Z4bjyllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZSBLEDE+; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZSBLEDE+"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240820014630epoutp043fe7f9bc016f696febe00609b6f59351~tTIqZpSpn0694106941epoutp04X
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 01:46:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240820014630epoutp043fe7f9bc016f696febe00609b6f59351~tTIqZpSpn0694106941epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724118390;
	bh=+0bjyuDRowq8OtVYtNFPU2eDyW/O81xqwpNamIeNVxY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ZSBLEDE+wLeiFMb1cVR7uPZcBejcehrI/tHetmhVUp/CgonWFLddQFxsx0b0R6oYo
	 4dRMi72TpktD8OnMdpxLT9AGxP7BoccCQjsdhRt35CdjXhL96CpHU85I/4/MoXQtc/
	 OkwPwhPic0rx823TiBDonmDXFCAO7KNhD1vAkvyg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240820014630epcas2p26d32b73d91040e3c51f85897fb2df11c~tTIp_e_zh2931829318epcas2p2K;
	Tue, 20 Aug 2024 01:46:30 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.88]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Wnsks5BK2z4x9Pw; Tue, 20 Aug
	2024 01:46:29 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	7E.47.08901.575F3C66; Tue, 20 Aug 2024 10:46:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240820014629epcas2p26db8f06709ceff9265c6d42fe77035d3~tTIpGjm8I2252322523epcas2p2g;
	Tue, 20 Aug 2024 01:46:29 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240820014629epsmtrp19fc0a106c4cfc025719847177738451b~tTIpFxLjf2900929009epsmtrp1D;
	Tue, 20 Aug 2024 01:46:29 +0000 (GMT)
X-AuditID: b6c32a43-a61b8700000022c5-16-66c3f5759bbc
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	27.CA.19367.475F3C66; Tue, 20 Aug 2024 10:46:28 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240820014628epsmtip1fd9752c7014f8e5cc3d8fc21f43f081e~tTIo2-XWs2108121081epsmtip1l;
	Tue, 20 Aug 2024 01:46:28 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Alim Akhtar'" <alim.akhtar@samsung.com>,
	"'Michael	Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Rob	Herring'" <robh@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <nqokjhodd4g3l7s5ukvhirytv4poiusgd5hgv2ntn3ekyolzyd@zmxxtwjgkqmp>
Subject: RE: [PATCH v6 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Tue, 20 Aug 2024 10:46:28 +0900
Message-ID: <087301daf2a2$c64deb70$52e9c250$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQLQL30DU0UysUOS1ES52gTWByyh0gIaeEiEAf2S/v0Ct8KU3bAOZ1cw
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRmVeSWpSXmKPExsWy7bCmuW7p18NpBg2TVS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANaobJuM1MSU1CKF1Lzk/JTMvHRbJe/g
	eOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoBOVFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnF
	JbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZB1ZNZC84LFbxa84RtgbGR/xdjJwc
	EgImEt/fLGXvYuTiEBLYwSix4vNsKOcTo8TFSzsZ4Zyd9xazwbS8PrwQKrGTUeLgoiOsEM5L
	RomXV5cyglSxCehLrO6+DdYhIqArsfnGcrC5zAJ3mSWmvtjFDpLgFPCTaP26Gaibg0NYIExi
	wjc9kDCLgKrEsu4zTCA2r4ClxPwHDVC2oMTJmU9YQGxmAXmJ7W/nMENcpCDx8+kyVoi4iMTs
	zjZmiL1uEkcPTWcB2SshsIND4t/udlaIBheJee/OQr0jLPHq+BZ2CFtK4mV/G5SdLzH5+lsm
	iOYGRolr/7qhttlLLDrzkx3kaGYBTYn1u/RBTAkBZYkjt6Bu45PoOPyXHSLMK9HRJgTRqCbx
	6cplqCEyEsdOPGOewKg0C8lns5B8NgvJN7MQdi1gZFnFKJZaUJybnppsVGAIj+3k/NxNjODk
	q+W8g/HK/H96hxiZOBgPMUpwMCuJ8Ha/PJgmxJuSWFmVWpQfX1Sak1p8iNEUGNYTmaVEk/OB
	6T+vJN7QxNLAxMzM0NzI1MBcSZz3XuvcFCGB9MSS1OzU1ILUIpg+Jg5OqQam2Xn/XGST3eM9
	m8PXRMS/rHx79yy/vMQORfmDCXUnrYo/Sb6bv/nG1gc2gWwtIXFFFpbX8xp1F/EHPNjz3s3M
	Y1tGQvWvxaqKyTKGBfdeHw7c9KcsqTrjWcCOVKmq/UE3Ixf3Ou5fZX154aZZ/fr8BbcPMf41
	4XQoW5iQor/br4G3uJOh5NNVwxtbXn3bNendzHXneUTUzPgEiszjtCtfXlXklVt3uOrdpVv6
	7Avz7G6rvpdfbR59QGGCougHvivtR1ZEHXnwJ3QDr/iqgD2rr/4peJQzQUu6i7ko56SDBtuD
	Gcv7L0yPblCWNjn5SOO4xedrf/9q75A6JNsvUrL59Nq3WpNfPHwuKRj64SWbEktxRqKhFnNR
	cSIAKkSBSUcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsWy7bCSnG7J18NpBu8/Wls8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBkHVk1kLzgs
	VvFrzhG2BsZH/F2MnBwSAiYSrw8vZOxi5OIQEtjOKHHySAc7REJGYmPDfyhbWOJ+yxFWiKLn
	jBIfzzexgCTYBPQlVnffZgOxRQR0JTbfWM4OUsQs8JxZoqN9GTtERzuTxKu21WAdnAJ+Eq1f
	N7OC2MICIRLTHu1hArFZBFQllnWfAbN5BSwl5j9ogLIFJU7OfALWyyygLdH7sJURwpaX2P52
	DjPEeQoSP58uY4WIi0jM7mxjhrjITeLooeksExiFZyEZNQvJqFlIRs1C0r6AkWUVo2hqQXFu
	em5ygaFecWJucWleul5yfu4mRnAMagXtYFy2/q/eIUYmDsZDjBIczEoivN0vD6YJ8aYkVlal
	FuXHF5XmpBYfYpTmYFES51XO6UwREkhPLEnNTk0tSC2CyTJxcEo1MC31mrbP6pFIIseX1ykd
	uw+HiCwtWHJpl1QDT2znD9ad/8R7QhUNHRwXMmvd2jJ3RaXV+SBu0VxFFublL+Wn3Dj8rCFA
	nHn/KaPgn9XF1s8dIhdvL8meufDP8sZ8jogeixNKwSHxDOuXbPla7b7Ol183u93y572W/MiD
	EmHrm1fmPWOYcP+a/bfYI6+vmFgsWGtzdGpHho+jSX3FLZeFAuJmYoohhnIHr2yYfUNsS1dH
	p8jxaQkmzmI+Fy7s8NmVEja7mo/voK1yZenGtBn9C8yVX+zZyq7Dw3p7mnMbA/fpubdbopWW
	3n5iICD5aWt8j6Av898dcjP9ztRPSeaU/bb0bbp8l35U41Z+MfMGJZbijERDLeai4kQATRzI
	KjADAAA=
X-CMS-MailID: 20240820014629epcas2p26db8f06709ceff9265c6d42fe77035d3
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
	<nqokjhodd4g3l7s5ukvhirytv4poiusgd5hgv2ntn3ekyolzyd@zmxxtwjgkqmp>

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Monday, August 19, 2024 5:20 PM
> To: Sunyeal Hong <sunyeal.hong@samsung.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>; Chanwoo Choi
> <cw00.choi@samsung.com>; Alim Akhtar <alim.akhtar@samsung.com>; Michael
> Turquette <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob
> Herring <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>; linux-
> samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v6 1/4] dt-bindings: clock: add ExynosAuto v920 SoC
> CMU bindings
> 
> On Mon, Aug 19, 2024 at 02:24:12PM +0900, Sunyeal Hong wrote:
> > Add dt-schema for ExynosAuto v920 SoC clock controller.
> > Add device tree clock binding definitions for below CMU blocks.
> >
> > - CMU_TOP
> > - CMU_PERIC0
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
>  +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (38.4 MHz)
> > +            - description: CMU_PERIC0 NOC clock (from CMU_TOP)
> > +            - description: CMU_PERIC0 IP clock (from CMU_TOP)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +            - const: noc
> > +            - const: ip
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynosautov920-cmu-peric1
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (38.4 MHz)
> > +            - description: CMU_PERIC1 NOC clock (from CMU_TOP)
> > +            - description: CMU_PERIC1 IP clock (from CMU_TOP)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +            - const: noc
> > +            - const: ip
> 
> This is the same peric0, so combine them and clocks could be just:
> 
> items:
>   - description: External reference clock (38.4 MHz)
>   - description: CMU_PERICn NOC clock (from CMU_TOP)
>   - description: CMU_PERICn IP clock (from CMU_TOP)
> 

As you reviewed, I will remove the duplicates.

> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynosautov920-cmu-misc
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (38.4 MHz)
> > +            - description: CMU_MISC NOC clock (from CMU_MISC)
> 
> Similarly:
> 
> - description: CMU_MISC/CMU_HSI0 NOC clock (from CMU_MISC)

Best Regards,
sunyeal

