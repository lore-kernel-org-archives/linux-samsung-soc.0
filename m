Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFD22D627
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 03:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724123817; cv=none; b=D4hYvIenDw10/wHs2m+ofyNje6ewBUXvyNGMcKRnwqHthgRVAw01LZ7cxP9DXorHaAab3ENa39IovD+FxcyBTAkLY13M77FyzpIE13feC058uyPSvQ1st6EMVUGMU++VbYejYBEM/s7G/Rclr+V0tkCjlqA/EjzUPw21ZYW5Ht8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724123817; c=relaxed/simple;
	bh=7OS5U6hUroRgy2oQ+7zl1P3imxQtugoQ87EKZwryMJQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=fRgVHX2VH82KKJoWo7obdMzS6rRFtNpyzuV9ZgP2p8sCLLS+TdL40M27fixf3Ry3eJTCaliL2U8Vy8fYoOWrVTaKfc2tQ5vDhrR2rm7N0BrdzLTfdEUBzgz8E+6MUjJXl4ARoUAbbtWIF34jKVZm54+e/eLaJeuRh6VVuh2/HAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mQE1fc+W; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mQE1fc+W"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240820031647epoutp022f4b3fabee5d60af586ecc8599a7b970~tUXfPEf-n0102001020epoutp02s
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 03:16:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240820031647epoutp022f4b3fabee5d60af586ecc8599a7b970~tUXfPEf-n0102001020epoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724123807;
	bh=4L3WgD3UaaixdH74TH6NcTMHweQB4Wz7DCYygO4wg3E=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=mQE1fc+WIIMI6yMAxe7AeKBIcnj/9uVKMLiQV6pt3JzhsuwmVyuwWFCW/ymJWD+DH
	 Yle8MLA/WQM+Q1VfaFblBQyuGlJqj/k8R1vZRD+zyBpwN4A4492KWtJ04XL0gA+FEE
	 C94lf0w9NrNJoS+pqSCB9beHygQyf5eCzdkONdag=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240820031646epcas5p23da09078ad3ab137795789e29de5c881~tUXetoElL0938909389epcas5p2I;
	Tue, 20 Aug 2024 03:16:46 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Wnvl10tQvz4x9Q3; Tue, 20 Aug
	2024 03:16:45 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	ED.09.09640.C9A04C66; Tue, 20 Aug 2024 12:16:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20240820031644epcas5p28483b55967b4fb740717562413dfd717~tUXcuTORG0938809388epcas5p2C;
	Tue, 20 Aug 2024 03:16:44 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240820031644epsmtrp29518d7e78973d4e573e3b44c1f3e81e9~tUXctTMfR1384113841epsmtrp28;
	Tue, 20 Aug 2024 03:16:44 +0000 (GMT)
X-AuditID: b6c32a49-a57ff700000025a8-fb-66c40a9c0b74
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	C5.14.19367.C9A04C66; Tue, 20 Aug 2024 12:16:44 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240820031642epsmtip237268865e08a0ca495abb30bcd4ddb6a~tUXactUZO2417724177epsmtip2F;
	Tue, 20 Aug 2024 03:16:42 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sunyeal Hong'" <sunyeal.hong@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20240819052416.2258976-2-sunyeal.hong@samsung.com>
Subject: RE: [PATCH v6 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Tue, 20 Aug 2024 08:46:40 +0530
Message-ID: <02ab01daf2af$62450520$26cf0f60$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLQL30DU0UysUOS1ES52gTWByyh0gIaeEiEAf2S/v2wJD72QA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGJsWRmVeSWpSXmKPExsWy7bCmpu4criNpBrvf2Fis2XuOyeL6l+es
	FvOPnGO1OH9+A7vFpsfXWC0+9txjtbi8aw6bxYzz+5gsLp5ytfi/Zwe7xeE37awW/65tZLFo
	WraeyYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANaobJuM1MSU1CKF1Lzk/JTMvHRbJe/g
	eOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoBOVFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnF
	JbZKqQUpOQUmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZH1qOsxQs4KtYtugfYwPjG+4uRk4O
	CQETib07djF3MXJxCAnsZpT49XA2K4TziVFi4+EHbHDO+cZHbDAtbx7vYgGxhQR2MkosuxUE
	UfSCUWLKsw9gRWwCuhI7FreB2SIC95gkPu41ByliFljHKLF55hF2kASngIPEne3nmboYOTiE
	BcIkJnzTAwmzCKhKzJr3FayEV8BS4urZS8wQtqDEyZlPwBYzC8hLbH87hxniIAWJn0+XsULs
	cpLY9baBFaJGXOLlUZBVXEA1ezgklu7bC/WBi8Trt62MELawxKvjW9ghbCmJz+9garIljl+c
	BWVXSHS3foSqsZfY+egmC8jNzAKaEut36UPs4pPo/f0E7BUJAV6JjjYhiGpVieZ3V1kgbGmJ
	id3drBC2h8Tq3j9MExgVZyH5bBaSz2Yh+WAWwrIFjCyrGCVTC4pz01OLTQsM81LL4fGdnJ+7
	iRGcgLU8dzDeffBB7xAjEwfjIUYJDmYlEd7ulwfThHhTEiurUovy44tKc1KLDzGaAoN7IrOU
	aHI+MAfklcQbmlgamJiZmZlYGpsZKonzvm6dmyIkkJ5YkpqdmlqQWgTTx8TBKdXAZDktUPCU
	6vFytpn2vPUvPt1ILNqwL6z8ar9ERvUx2a7klTvlRN4oX7eyTjvycOWL+62mH+30fiuZf4z1
	u3BvtbOteMH67WuDU6K0T1i9EBGV9NcoXvy498vtP1WsF+6cm7dJbsZ+LYGv9+7nb1m0Mpsr
	NffkMj6J12vjPD1NDBr2rhPNWP/nurzJ1BIv9Q/ySrX75iVxFs893h/5ocrkuR5TiXzPV97p
	olJ+P/OmWE62NdjNyJCSHbaQV0x/U4zIY6vn6Q7vvyV0NsqKxE0ODb6lW25Ve1+RN0yr84BI
	eLKPV6v16epf8uvXX53B82/C3vsKD22mJwvxzH+huct70fbjm/ae/VqfWvRq2QYtJZbijERD
	Leai4kQArij6JkkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRmVeSWpSXmKPExsWy7bCSvO4criNpBi/75SzW7D3HZHH9y3NW
	i/lHzrFanD+/gd1i0+NrrBYfe+6xWlzeNYfNYsb5fUwWF0+5Wvzfs4Pd4vCbdlaLf9c2slg0
	LVvP5MDr8f5GK7vHplWdbB6bl9R79G1ZxejxeZNcAGsUl01Kak5mWWqRvl0CV8aHluMsBQv4
	KpYt+sfYwPiGu4uRk0NCwETizeNdLF2MXBxCAtsZJab8OcUIkZCWuL5xAjuELSyx8t9zMFtI
	4BmjxL+fiiA2m4CuxI7FbWwgtojAEyaJrYejQQYxC2xilDi3+yYbxNSjjBLLpn9mBqniFHCQ
	uLP9PBOILSwQIjHt0R4wm0VAVWLWvK9gG3gFLCWunr3EDGELSpyc+YQFxGYW0JZ4evMplC0v
	sf3tHGaI6xQkfj5dxgpxhZPErrcNrBA14hIvjx5hn8AoPAvJqFlIRs1CMmoWkpYFjCyrGEVT
	C4pz03OTCwz1ihNzi0vz0vWS83M3MYIjUCtoB+Oy9X/1DjEycTAeYpTgYFYS4e1+eTBNiDcl
	sbIqtSg/vqg0J7X4EKM0B4uSOK9yTmeKkEB6YklqdmpqQWoRTJaJg1OqgYmzokLRqHjayq8P
	BV40ln6reWrwWnqO7S9lw6dLNwkyrvl9iLGubHIpt8eHhZM3ejqbMJxq139+6tw6l/k1W/IX
	PIsUjL2168LKBt3stBPHY+VqjAIdnNjVF9YZpfYLC6X32s6/Ku5vYmQ1+dtvZs1/xfemm+R/
	vGnOoHPhy8btjeoL/GNEZx6fa56XK9r80XJeY0TpjAezegTPziu00VvXHLpcQyxmv37NoWUO
	hx6EiOZ6OujF/8wvbljZuOFCRKO25JLC+5aGT2fNsbSxud52V5Lpa/oLWV+FLKYlkZIH315T
	DFfsvtO5pLa/rNPLU5jT9rXsfT/e/C3Cr/abZ6elXc7UYq15LjstNmiaEktxRqKhFnNRcSIA
	EpgMOi8DAAA=
X-CMS-MailID: 20240820031644epcas5p28483b55967b4fb740717562413dfd717
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240819052422epcas2p4db394defd5f298658f7841af3649ac6f
References: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
	<CGME20240819052422epcas2p4db394defd5f298658f7841af3649ac6f@epcas2p4.samsung.com>
	<20240819052416.2258976-2-sunyeal.hong@samsung.com>

Hi Sunyeal,

> -----Original Message-----
> From: Sunyeal Hong <sunyeal.hong@samsung.com>
> Sent: Monday, August 19, 2024 10:54 AM
> To: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
> Alim Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob
> Herring <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; Sunyeal Hong <sunyeal.hong@samsung.com>
> Subject: [PATCH v6 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
> bindings
> 
> Add dt-schema for ExynosAuto v920 SoC clock controller.
> Add device tree clock binding definitions for below CMU blocks.
> 
> - CMU_TOP
> - CMU_PERIC0
> 
Do update the commit message to match with the changes in this patch
Thanks

> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> ---
>  .../clock/samsung,exynosautov920-clock.yaml   | 197 ++++++++++++++++++
>  .../clock/samsung,exynosautov920.h            | 191 +++++++++++++++++
>  2 files changed, 388 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> clock.yaml
>  create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h
> 
[snip]

> diff --git
> 
> +      - samsung,exynosautov920-cmu-top
> +      - samsung,exynosautov920-cmu-peric0
> +      - samsung,exynosautov920-cmu-peric1
> +      - samsung,exynosautov920-cmu-misc
> +      - samsung,exynosautov920-cmu-hsi0
> +      - samsung,exynosautov920-cmu-hsi1
> +
[snip]

> +#endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
> --
> 2.45.2


