Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A278D22B8B5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128499; cv=none; b=BtHnx+HQlGm2ikGc6QrDzoLmWP8uBQcxydGtArmIQ5qe2jXkKchxfCpj6VCAxbc+soNvLro55XhHmAqxS1EVg0iClUsj033cB/NaoMyIW5xcZbbIfg/hooEcl4SCKOWNyzRxxSi6kSQE3ttOF1Ui5N/p8/aniduo4WGT15TFYI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128499; c=relaxed/simple;
	bh=0QBrnqhRIrXS2Ee5H0IPYyfHJFfkoIpFeri48SlBd6M=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=p7jTUAVxqAOFACmEJZtJc81dbNE72BHSKaOAHxSwpw7Xbk+r8d9bmCcqO9NycpvXUh9Xe5n7+QQGJa8xKfk83Q9IIyH0UX0X4T2bD6bou9j18OlkV43f0OTQB6Nk+NUF9L0SLkJINC33PxbwKVYrLfVluDWvdjxfcuQiaIfYq5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=f5KJ1xZ7; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="f5KJ1xZ7"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250929064815epoutp0339521118a7f71e354c1603f08265c5cb~prgvf52VC2074020740epoutp030
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:48:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250929064815epoutp0339521118a7f71e354c1603f08265c5cb~prgvf52VC2074020740epoutp030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759128495;
	bh=8TiR7dGLuJ/tq4eQDQdq/rwZsrr+n8wFDc6W+Ckqzuw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=f5KJ1xZ7ivX42KIaCUmksBu+e7eEdRFhN8kz9NDTGYTv9R+2QG11YwA/BVqm8H8Ws
	 m/51VvtKHY0LT92U7Ax9e0+6/TGw3baJhRu6qqnw+AIZqTghnPd5YFIdZ78kV5Bg+m
	 FZQtLJDQfMCHMavGX+FjtaEYoW+c8Smqeq5nZxIM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250929064814epcas5p166cba3caff64057f60180a7e870930e1~prgu4RX0f0500005000epcas5p1S;
	Mon, 29 Sep 2025 06:48:14 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cZsG563xDz2SSKg; Mon, 29 Sep
	2025 06:48:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250929064813epcas5p4c9eabc364711d3c2948e1d42e986a135~prgtWfP532753627536epcas5p4f;
	Mon, 29 Sep 2025 06:48:13 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929064810epsmtip2ab63fcced95b35cd61b01060a0ddeb0a~prgqdJL-D1104111041epsmtip2H;
	Mon, 29 Sep 2025 06:48:09 +0000 (GMT)
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
In-Reply-To: <20250903073827.3015662-5-pritam.sutar@samsung.com>
Subject: RE: [PATCH v8 4/6] phy: exynos5-usbdrd: support HS combo phy for
 ExynosAutov920
Date: Mon, 29 Sep 2025 12:18:07 +0530
Message-ID: <001601dc310d$069ef990$13dcecb0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgFajeyMAXpI9yS0KRFjsA==
Content-Language: en-us
X-CMS-MailID: 20250929064813epcas5p4c9eabc364711d3c2948e1d42e986a135
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072946epcas5p371f7d0e15d8757f738c08f80a8eefb60
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072946epcas5p371f7d0e15d8757f738c08f80a8eefb60@epcas5p3.samsung.com>
	<20250903073827.3015662-5-pritam.sutar@samsung.com>

Hi Pritam

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
> Subject: [PATCH v8 4/6] phy: exynos5-usbdrd: support HS combo phy for
> ExynosAutov920
> 
> Support UTMI+ combo phy for this SoC which is somewhat simmilar to what
> the existing Exynos850 support does. The difference is that some register
> offsets and bit fields are defferent from Exynos850.
> 
> Add required change in phy driver to support combo HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
Thanks!
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

