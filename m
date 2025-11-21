Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388AF2F066A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763712678; cv=none; b=bYWWQaJPJ9TY0B1LaWpHh2AvVQbt+v0YqanPjO7F7FhlXSvuboKOncugDNmk4f3VBzAzXvkyY/jqEnLbcsvWZRY4/CS7V+hrZijeU3mhnaMgUj6BpZ9XbSgP9YgTqa9H1etSmCZ9RgGUnXadrgumPt3R0YxjsWLk8zTerTfuJVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763712678; c=relaxed/simple;
	bh=sszqIw8VWjdlo11n69qb0lYxc8G42zCRNwnv/cRKMVw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=McRa3czOQzebR3KMBCaLdbmKmZyXCuZDlBtORL6j+i675dA9vZCeITOmo9X9Kk+ceb0hhxwo4DoebE314CspKzcaG7rFJbmgwfhMXNFYW9BsGu3ldfesR0C7nWMN/l5F3qVUdLRqTuVri/LPNIafFuraZ50sao9jMScRYwGerYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ay75cYit; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ay75cYit"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251121081114epoutp01b8c8da7f0dbab78be031d54f30edf016~591UyPpzC1175911759epoutp01g
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:11:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251121081114epoutp01b8c8da7f0dbab78be031d54f30edf016~591UyPpzC1175911759epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763712674;
	bh=4E9M62Me/h6erfMIN1DQKUjCF0wnRycI4GmGTblPxAU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ay75cYitLrlhnC+2yJytnzNnKCLTN+27BHiRDR17aWeZcKA9bW+X4U7SGgLNkXB1p
	 JDUq2l6n/uAcznsAiRGP61mkjhz+00/oDcKssN/k7NXNvuROa0z3vxGxhFE/uEJ4ln
	 PGt5RtFZAmhsgjyg8qLAqDkHg3uXvXtgGjenb2qs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251121081113epcas5p2ff50cb9e60abb66cea9c21e303196e74~591UB06qW0583405834epcas5p2y;
	Fri, 21 Nov 2025 08:11:13 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4dCSbN41Gpz3hhTL; Fri, 21 Nov
	2025 08:11:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251121081111epcas5p4058d461e132b62b19353c324e4945af4~591SY40PU2083220832epcas5p4d;
	Fri, 21 Nov 2025 08:11:11 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251121081108epsmtip20f5444687891e55a700ba969ef877ec4~591Padg460059200592epsmtip2Y;
	Fri, 21 Nov 2025 08:11:08 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Vinod Koul'" <vkoul@kernel.org>
Cc: <kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <johan@kernel.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <aR9EAj82IiLWFQ-t@vaman>
Subject: RE: [PATCH v9 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Date: Fri, 21 Nov 2025 13:40:52 +0530
Message-ID: <00f001dc5abe$66163610$3242a230$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQId6djPdSPyHc1kqH9U3Yvp+ju6FgKXgK1iAO7OvGACspMeQbRH4LFA
Content-Language: en-in
X-CMS-MailID: 20251121081111epcas5p4058d461e132b62b19353c324e4945af4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251010070106epcas5p2a7e051ce5edc0768e5a5d3b3c267f984
References: <20251010070912.3758334-1-pritam.sutar@samsung.com>
	<CGME20251010070106epcas5p2a7e051ce5edc0768e5a5d3b3c267f984@epcas5p2.samsung.com>
	<20251010070912.3758334-7-pritam.sutar@samsung.com> <aR9EAj82IiLWFQ-t@vaman>

Hi Vinod, 

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: 20 November 2025 10:08 PM
> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Cc: kishon@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; alim.akhtar@samsung.com; andre.draszik@linaro.org;
> peter.griffin@linaro.org; kauschluss@disroot.org; johan@kernel.org;
> ivo.ivanov.ivanov1@gmail.com; m.szyprowski@samsung.com;
> s.nawrocki@samsung.com; linux-phy@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> rosa.pila@samsung.com; dev.tailor@samsung.com;
> faraz.ata@samsung.com; muhammed.ali@samsung.com;
> selvarasu.g@samsung.com
> Subject: Re: [PATCH v9 6/6] phy: exynos5-usbdrd: support SS combo phy for
> ExynosAutov920
> 
> On 10-10-25, 12:39, Pritam Manohar Sutar wrote:
> > Add required change in phy driver to support combo SS phy for this SoC.
> 
> what is the 'required change', would be good to describe.
> 

Can you please confirm if commit message is described as below?

"
    phy: exynos5-usbdrd: support SS combo phy for ExynosAutov920

    Update phy driver to enable SS combo phy for this SoC. New register
    definitions, init/reset helper functions and a dedicated PHY
    configuration structure are added. Add these changes in driver
    to support combo SS phy for this SoC.
"

> --
> ~Vinod

Thank you,

Regards,
Pritam

