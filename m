Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C1E23F424
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128397; cv=none; b=ZNgwKz7a4oslYqppDiJJwkygH92I72u8KctyRP9vfqoa8KBbLuN02p1ZiuPG71lFgGdOLZp0a9t3U0ref7xE2HZNqjm3NzjPQ3N6OvRaPOiOL3kERxI/OXNopEwcywtXoXAt4XltEx77tuVc1vaKipjitZrkIon1+X6o0cC6fFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128397; c=relaxed/simple;
	bh=A/u6QqvzEAId89/NmZ42A0adYx0PfzegRO4+mvntsL8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=dwj37mX0YuWDY278KP3JuHXnK1ylfjquaZHpx/ozjJ5ZD8ndeFQD3mG6Yqmn+4QShaWS4ggyxtUEtXb5QU/8k6sb426/l4b4TF/sGSRngAq13KdDd2Cbe4JU0/tmbT/nDN+nBbad4fmQ+6QLpWw3DV08u7qDndu0vNeBgoeoBCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HNVWJqCH; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HNVWJqCH"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250929064633epoutp044bd11df455a14d92f6577e108b928522~prfQ0b4wp0938809388epoutp04I
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:46:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250929064633epoutp044bd11df455a14d92f6577e108b928522~prfQ0b4wp0938809388epoutp04I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759128393;
	bh=FfZBLJLuc+uuntD1S7nxM2h+LKVCtE+y0dCkxRqcjtE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=HNVWJqCHjtOX4H+DJfZ6FrHgojQmY86b8uryxjqMb5WAIUNZpmbTE68r21/TAq0ww
	 YzEvdW8e80wxSvxhQA15Jdy/JJoY3Fpq+2FA0H3d4JfVQmN9FCszI+swlu7IC4OIrn
	 5sTMOM9+0TMQgRwdO/dLzGr8bkCFIox6tJmU7xU4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250929064633epcas5p3f9bb11016d7a35cd65b5e5228d9e07b6~prfQPnHzg2175121751epcas5p3F;
	Mon, 29 Sep 2025 06:46:33 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cZsD811vkz2SSKf; Mon, 29 Sep
	2025 06:46:32 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250929064631epcas5p2226adbf90c50ec59281f56d85d664bdd~prfOjiy3R0521705217epcas5p2e;
	Mon, 29 Sep 2025 06:46:31 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929064627epsmtip1e18cd0b249e2fc57699cfa1204c7b11a~prfK0LkG31254112541epsmtip1d;
	Mon, 29 Sep 2025 06:46:27 +0000 (GMT)
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
In-Reply-To: <20250903073827.3015662-3-pritam.sutar@samsung.com>
Subject: RE: [PATCH v8 2/6] phy: exynos5-usbdrd: support HS phy for
 ExynosAutov920
Date: Mon, 29 Sep 2025 12:16:26 +0530
Message-ID: <001401dc310c$c9f18710$5dd49530$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgG7M6EYAY8VKj20JWVfgA==
Content-Language: en-us
X-CMS-MailID: 20250929064631epcas5p2226adbf90c50ec59281f56d85d664bdd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072939epcas5p4b36818cd2e2b5c59fdd4a1b90579eb47
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072939epcas5p4b36818cd2e2b5c59fdd4a1b90579eb47@epcas5p4.samsung.com>
	<20250903073827.3015662-3-pritam.sutar@samsung.com>

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
> Subject: [PATCH v8 2/6] phy: exynos5-usbdrd: support HS phy for
> ExynosAutov920
> 
> Enable UTMI+ phy support for this SoC which is very similar to what the
> existing Exynos850 supports.
> 
> Add required change in phy driver to support HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

