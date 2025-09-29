Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161B1F4617
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128554; cv=none; b=AqRGI0psEjwyKoO3jOiELkGoM4MJRMUB+IdoIzPIjFa+y0GEg6VCsP4NLKKh5DEYwQ7j79FHP1ZLbH6Eyw5W6Yp/SZ22n39ijxovYQ9KlyFQ6GjBDZ2aOg+NwbXGECN47N28kzULLfFLqFWTNyrtFyE9rlNYoWkzPsSfUlSQxBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128554; c=relaxed/simple;
	bh=i6H7PiTWtFyXx1EDWLzRArKpM+33BIbig/ztJFn1z0w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=uzQ7VjUIexzrgshXiMnw0ze0nPPWRgdAEqvYumvM4kJEsYH463vuPalsIXEgqwXwKYkt6uJsP+PFyRQAWgWizzL/gfK9NFxnMeqoWp/3hdHHuHX/QDZiijyHkNnDrapTQr2iEvQfjXkqHg3u3/g77R6znuQ2PiSFEp/NL0+oPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=MPrC84OF; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="MPrC84OF"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250929064911epoutp034a1e1cc30d4625e2b0c237fd1741790b~prhj5oeg-2179221792epoutp03r
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:49:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250929064911epoutp034a1e1cc30d4625e2b0c237fd1741790b~prhj5oeg-2179221792epoutp03r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759128551;
	bh=uW/biS9+F79MB+CEqJ9ljHsHmR77xOXVQzzomERvLW4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=MPrC84OFDqt7d3aP+YosXCmgVdD6JBYu/kycQG+DiK1eqtnCzRGBhb0qLcuEApmNa
	 EoVd4+mtKlHxzUKwzPwpL3BJlF8B/4JTgkklMM66EfxBR7Vp5amEIyfFwnqvu1M+cm
	 ED825+mozegBa9zCeVUiY90AMWxn3Y4itj48RFjc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250929064911epcas5p3258155eb119b44766be8084abd31a1ac~prhjMtLud1689416894epcas5p3Z;
	Mon, 29 Sep 2025 06:49:11 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cZsH95hMFz6B9mD; Mon, 29 Sep
	2025 06:49:09 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250929064909epcas5p3d66043c4ebddff823a0ff065dc94f005~prhhf_UNC1007110071epcas5p3_;
	Mon, 29 Sep 2025 06:49:09 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929064906epsmtip18de76634ab37e3abc408d75247b35fdf~prheozuOU1376013760epsmtip1G;
	Mon, 29 Sep 2025 06:49:05 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Pritam Manohar Sutar'" <pritam.sutar@samsung.com>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andre.draszik@linaro.org>,
	<peter.griffin@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <igor.belwon@mentallysanemainliners.org>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250903073827.3015662-6-pritam.sutar@samsung.com>
Subject: RE: [PATCH v8 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Mon, 29 Sep 2025 12:19:04 +0530
Message-ID: <001701dc310d$27fead10$77fc0730$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgLXAGWnAetyVdK0GaSqAA==
Content-Language: en-us
X-CMS-MailID: 20250929064909epcas5p3d66043c4ebddff823a0ff065dc94f005
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072949epcas5p11a1e474fad83ff3036be2c443ed5bc35
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072949epcas5p11a1e474fad83ff3036be2c443ed5bc35@epcas5p1.samsung.com>
	<20250903073827.3015662-6-pritam.sutar@samsung.com>

Hi pritam

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Sent: Wednesday, September 3, 2025 1:08 PM
> To: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com;
> andre.draszik@linaro.org; peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
> m.szyprowski@samsung.com; s.nawrocki@samsung.com;
> pritam.sutar@samsung.com
> Cc: linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; rosa.pila@samsung.com;
> dev.tailor@samsung.com; faraz.ata@samsung.com;
> muhammed.ali@samsung.com; selvarasu.g@samsung.com
> Subject: [PATCH v8 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
> ExynosAutov920 combo ssphy
> 
> The USBDRD31 5nm controller consists of Synopsys USB20 femptoPhy and
> USB31 SSP+ combophy. Document support for the USB31 SSP+ phy found on
> combophy of the ExynosAutov920 SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



