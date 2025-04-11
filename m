Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEBE20E33F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Apr 2025 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370063; cv=none; b=TWHVDRUspYjGAEMu+VNESq2E+qRsaz7r5RLh+ozK6xwXkHRSfUSDAQ97E0f59pbEQKFNZnywKm6kA5aN2tgMcUR3eYD26yzfmggGXLuO84CJcwm0hzcBSlrPqVOhVVl4WNqIvewy5GHiiHtwUnQEz/TX8nbhFI6WOPMVLc3bisk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370063; c=relaxed/simple;
	bh=9Xw3Mh/wFjiiLBBXROAQuUST13ypnhOe4s9HiOsX754=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=OCbZYdjFXCeOfIXLPfR7LorUWr+c9u1buDAqCwnD4ZvXzI+53eyQmQLoWuPakd1nQZHxK13Zz4SL4c0aoKuzoFE3jRENHysH8PxSIwTs/vdGAM+mRyUvrS46lXgH8/6vPVIODxWSUELPkS3bpnKobJyeeS+1gbpZ487ih1xTetA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=D1mIDsiD; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="D1mIDsiD"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250411111414epoutp0376e75d183aea476a5aa35f001637231f~1P1KE7J-72882328823epoutp031
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Apr 2025 11:14:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250411111414epoutp0376e75d183aea476a5aa35f001637231f~1P1KE7J-72882328823epoutp031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744370054;
	bh=0OoFQEgWGWV4qLariaW+VEJCc18NgTNJXjDGI90Tkc4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=D1mIDsiDqoHnxacBbma8C9uYET30EiJ4pDlsGVqXVDBqeyJcuTt9A3wJ6cqJbnDSJ
	 1Gyd5K2VRG5I/RMbfFI+onOGnpW58MU+sxAksbSD+981Iup471gPRZu51ZNnjmZnid
	 UKGc9XWqnLQdc8YT24MvRa61y7qx8unJO4YQQfT4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250411111413epcas5p34a91076073c61611c51cbc767660919a~1P1Jkuz-I1933419334epcas5p37;
	Fri, 11 Apr 2025 11:14:13 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.179]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZYvFv5tYNz3hhTB; Fri, 11 Apr
	2025 11:14:11 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4A.14.10144.389F8F76; Fri, 11 Apr 2025 20:14:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250411070733epcas5p25789fe1804b84c7e00793466c057e249~1Mdx_uxv13187431874epcas5p2J;
	Fri, 11 Apr 2025 07:07:33 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250411070733epsmtrp1271edd4020b75b269d23543ab838957e~1Mdx9w6sI1309013090epsmtrp1L;
	Fri, 11 Apr 2025 07:07:33 +0000 (GMT)
X-AuditID: b6c32a49-b77fe700000027a0-e4-67f8f98321a0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	63.25.08766.5BFB8F76; Fri, 11 Apr 2025 16:07:33 +0900 (KST)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250411070731epsmtip23121513fc26b7213ba22a6d817c81c61~1MdwTQTFN1089410894epsmtip2x;
	Fri, 11 Apr 2025 07:07:31 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <alim.akhtar@samsung.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>,
	<suyash.bitti@samsung.com>
In-Reply-To: <befe7d30-1727-4540-9072-f21ef96ea504@kernel.org>
Subject: RE: [PATCH v2] arm64: dts: exynos: Add DT node for all UART ports
Date: Fri, 11 Apr 2025 12:37:19 +0530
Message-ID: <03e501dbaab0$65bb47a0$3131d6e0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIiLJ9Qel8GAkpX5i6PIbvAaC3kAAM/bP3AAeJrQQOy5+zv4A==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmum7zzx/pBlfa9S0ezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi5ax7bBbnz29gt9j0+BqrxeVdc9gsZpzfx2Txf88OdosvPx8wW8yeX+PA
	47FpVSebx+Yl9R59W1YxenzeJBfAEpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hp
	Ya6kkJeYm2qr5OIToOuWmQN0mJJCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwKRA
	rzgxt7g0L10vL7XEytDAwMgUqDAhO6Pp5FTGgsV8FV2LzzE1MD7g6mLk5JAQMJE4evg2G4gt
	JLCbUeLdD/4uRi4g+xOjREvbMXYI5xujxOl309lgOiac2Q+V2MsoMWtBExuE85JRYuLGTSwg
	VWwCmhJ3Pj9lAkmICHQxSux8MJkVxGEWeMQoceDTP6AqDg5OATuJw580QRqEBbwk+ppuMYLY
	LAKqEocPbQRbxytgKTHt6WsmCFtQ4uTMJ2ALmAXkJba/ncMMcZKCxM+ny1hBbBEBJ4kVL9ew
	Q9SIS7w8egTsVAmBHRwSc07eh/rBReJRdzeULSzx6vgWdghbSuJlfxuU7SMx+eg3RpA7JQQy
	JO6sFYEI20usXnCGFSTMDPTk+l36EGFZiamn1jFBrOWT6P39hAkiziuxYx6MrSxxcs8eVghb
	UuLQ7ResExiVZiH5bBaSz2Yh+WAWwrYFjCyrGCVTC4pz01OLTQsM81LL4RGenJ+7iRGcbrU8
	dzDeffBB7xAjEwfjIUYJDmYlEd724B/pQrwpiZVVqUX58UWlOanFhxhNgcE9kVlKNDkfmPDz
	SuINTSwNTMzMzEwsjc0MlcR5m3e2pAsJpCeWpGanphakFsH0MXFwSjUw5WzfEnJ47vvDwaWc
	3LPnrnFl1ZgaPb+Qj8kqq7J0Ts8XjccBoc1axbcMsnl9XWfvykwtSwy/X2eUfSb623zTAE3l
	Jz9YZ9zxZLq1ZWHYd5PNT49lx/+KmiQU2/ypc2Ja4C5liQ/iivxHI8QZD8eE6v7R3lTJYMT+
	3ervmfxz9+o+8ac8U+v8otsWtcpz9v6zeuzT9ii57Pi2ZsO2S1KTFhnIllgISS8vyzlUcPEY
	7/tJXjcPb3n5uM59wc6tD6Jb83orDi/cvGvrNzatzzujZV5un7RcZWmEkPfk1Qc2WV7vd5g0
	08FZyNPqZKiFwgGbmzs83A7cY12Y94brecCBt9JFCcfvsfNOtOeZ897hrRJLcUaioRZzUXEi
	AN+PvM5ABAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSvO7W/T/SDZ6817B4MG8bm8WaveeY
	LO7tWMZuMf/IOVaLl7PusVmcP7+B3WLT42usFpd3zWGzmHF+H5PF/z072C2+/HzAbDF7fo0D
	j8emVZ1sHpuX1Hv0bVnF6PF5k1wASxSXTUpqTmZZapG+XQJXRtPJqYwFi/kquhafY2pgfMDV
	xcjJISFgIjHhzH72LkYuDiGB3YwSt1++ZodISEocfnqXFcIWllj57zlU0XNGic/PPzGCJNgE
	NCXufH7KBJIQEZjAKDFly0Ywh1ngBaPEkwUnWCFaDjBKfP3SAdTCwcEpYCdx+JMmSLewgJdE
	X9MtsEksAqoShw9tZAOxeQUsJaY9fc0EYQtKnJz5hAXEZhbQlnh68ymULS+x/e0cZojzFCR+
	Pl0GdqqIgJPEipdr2CFqxCVeHj3CPoFReBaSUbOQjJqFZNQsJC0LGFlWMUqmFhTnpucWGxYY
	5qWW6xUn5haX5qXrJefnbmIEx52W5g7G7as+6B1iZOJgPMQowcGsJMLbHvwjXYg3JbGyKrUo
	P76oNCe1+BCjNAeLkjiv+IveFCGB9MSS1OzU1ILUIpgsEwenVAPT7F2zXM9tPnxlN0tCpG/O
	3GsOPXdPx5YEth6uO11XwPmpJGr9n6lPDxs41bv2X1gcFXAlbZL8Ia66HztNps66vqzHv3Xj
	r2VBFRsFFK9+j1zsxeNW/X7pyYtJeQ58pyMZyn/M0FrTH2679CuPdmX7jf1lB8wT8kWSC1yf
	rea8/OjHxcJbO961Tor7cpmZh/WWlC5/7i+ue1+LPv/iWXXyWU35j3WHvkqEcC41bpG19lz7
	YE+gQVnU001n9ltmF27dX7Pud2Gr0v8wl45P23qYDxhsq73guf9f10+nQ+W/ua+VVDNN8FIp
	vOW74mqN0mJNNl7xH5e6dlw6W79yYnqncfnXL2cUXzjlSpn/2uwupcRSnJFoqMVcVJwIABoX
	J+EqAwAA
X-CMS-MailID: 20250411070733epcas5p25789fe1804b84c7e00793466c057e249
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250318074801epcas5p3de68627a3e64ebc2a95ed33a3f485e80
References: <CGME20250318074801epcas5p3de68627a3e64ebc2a95ed33a3f485e80@epcas5p3.samsung.com>
	<20250318075635.3372599-1-faraz.ata@samsung.com>
	<befe7d30-1727-4540-9072-f21ef96ea504@kernel.org>

Hello Krzysztof

> Subject: Re: [PATCH v2] arm64: dts: exynos: Add DT node for all UART ports
> 
> On 18/03/2025 08:56, Faraz Ata wrote:
> > +
> > +		usi_17: usi@10d800c0 {
> 
> Messed order. Keep nodes sorted by unit address (see DTS coding style).
> 
>
Thanks for your review
Based on the DTS coding style, it is acceptable to group nodes
of the same type together, even if it breaks the unit address ordering.
https://docs.kernel.org/6.12/devicetree/bindings/dts-coding-style.html
Please let me know your opinion on this.
Do you mean I should move all the USI_ node after pwm node?

> > +			compatible = "samsung,exynosautov920-usi",
> > +				     "samsung,exynos850-usi";
> > +			reg = <0x10d800c0 0x20>;
> > +			samsung,sysreg = <&syscon_peric1 0x1040>;
> > +			samsung,mode = <USI_V2_UART>;
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges;
> > +			clocks = <&cmu_peric1
> CLK_MOUT_PERIC1_NOC_USER>,
> > +				 <&cmu_peric1
> CLK_DOUT_PERIC1_USI17_USI>;
> > +			clock-names = "pclk", "ipclk";
> > +			status = "disabled";
> > +
> > +			serial_17: serial@10d80000 {
> > +				compatible = "samsung,exynosautov920-
> uart",
> > +					     "samsung,exynos850-uart";
> > +				reg = <0x10d80000 0xc0>;
> > +				interrupts = <GIC_SPI 803
> IRQ_TYPE_LEVEL_HIGH>;
> > +				pinctrl-names = "default";
> > +				pinctrl-0 = <&uart17_bus>;
> > +				clocks = <&cmu_peric1
> CLK_MOUT_PERIC1_NOC_USER>,
> > +					 <&cmu_peric1
> CLK_DOUT_PERIC1_USI17_USI>;
> > +				clock-names = "uart", "clk_uart_baud0";
> > +				samsung,uart-fifosize = <64>;
> > +				status = "disabled";
> > +			};
> > +		};
> > +
> >  		pwm: pwm@109b0000 {
> >  			compatible = "samsung,exynosautov920-pwm",
> >  				     "samsung,exynos4210-pwm";
> 
> 
> Best regards,
> Krzysztof

