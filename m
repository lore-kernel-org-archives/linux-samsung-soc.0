Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DDC8C0B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755537509; cv=none; b=mg5FATTRJPFXcL4vtBtcCAaLUzu5+w05AdSnE8xHpMLBTsh9NetqZzdCsuve0L7by+YeGEFn+MQbuYHqK+SZh8SFU1VTKvz3bAqtDQaPhIqFwiol2nT7AZ4vJLftZX/1J7gRub6Tha1m0WAWsRauki2GxEcDvDeTADe2sU7VO9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755537509; c=relaxed/simple;
	bh=hu75ymby8evG1hDlfMFXLnU+OuYSG3B3jdgOnJy9zEI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=pliQZTAvS98jfve9gNkAeixgHnhfEV6qnxoFOKHS7aCkUP/+nVS5DCRTIUagvHZ6cpk3kwqxndLuLURqYjHZXxHvz8XyKsNKlnjOESoRLwaMQjxu4Cvnizy9/hnl9bBaU8+xNx2dEM3fKi4+yvfjN9HlX4SM3VoYGUg0QJVVnPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=nsrFQtSg; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nsrFQtSg"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250818171825epoutp0461bff6217ab420d14d2d81f32a470e7c~c7A9sL4of0545505455epoutp04k
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 17:18:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250818171825epoutp0461bff6217ab420d14d2d81f32a470e7c~c7A9sL4of0545505455epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755537505;
	bh=3TKLORAFWjyKSjKXEDenOkvdTWQqYqNMRKTqumATFPI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=nsrFQtSgxkMloRzQrb0Fqf74lhUW4JnFr5o/SrFP7NqI4XnQgXNmFNF2SgiJqZNgw
	 BGbbU8R4rb7Pmt86WSrde1oSJwPRs26gOhSWPsmMbUaefHuI2H6ozm2ctk5Nl+UnFT
	 Lfydxqj7WSd58mlNrNUUBdv3f1Fsaz2pJ23ecnUs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250818171824epcas5p22c7cd57b1ceefb7f6ba85f95bb83e1fb~c7A8ntsF32416824168epcas5p2n;
	Mon, 18 Aug 2025 17:18:24 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c5KDb4RJ0z3hhT7; Mon, 18 Aug
	2025 17:18:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250818084108epcas5p2cf03efaffd338376a8d1f4dac8972d94~cz9T6GJJc2176121761epcas5p29;
	Mon, 18 Aug 2025 08:41:08 +0000 (GMT)
Received: from FDSFTE462 (unknown [107.122.81.248]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250818084105epsmtip1696e665c75c145cb5e2e7b5854be6a06~cz9RM6cWW2722027220epsmtip19;
	Mon, 18 Aug 2025 08:41:05 +0000 (GMT)
From: "Shradha Todi" <shradha.t@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <linux-pci@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>
Cc: <mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <arnd@arndb.de>,
	<m.szyprowski@samsung.com>, <jh80.chung@samsung.com>,
	<pankaj.dubey@samsung.com>
In-Reply-To: <4a47b758-5c20-4e30-bc61-206acd48bdd0@kernel.org>
Subject: RE: [PATCH v3 06/12] dt-bindings: PCI: Split exynos host into two
 files
Date: Mon, 18 Aug 2025 14:11:04 +0530
Message-ID: <000801dc101b$d7b22510$87166f30$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHWPHKmIG2WTsjb/5pkHKJ2GfeRPwKMZRF7AtQYMuoCMTwzCLQ3MAYw
Content-Language: en-in
X-CMS-MailID: 20250818084108epcas5p2cf03efaffd338376a8d1f4dac8972d94
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250811154721epcas5p26c9e2880ca55a470f595d914b4030745
References: <20250811154638.95732-1-shradha.t@samsung.com>
	<CGME20250811154721epcas5p26c9e2880ca55a470f595d914b4030745@epcas5p2.samsung.com>
	<20250811154638.95732-7-shradha.t@samsung.com>
	<4a47b758-5c20-4e30-bc61-206acd48bdd0@kernel.org>

> >
> > @@ -19,9 +19,6 @@ allOf:
> >    - $ref: /schemas/pci/snps,dw-pcie.yaml#
> >
> >  properties:
> > -  compatible:
> > -    const: samsung,exynos5433-pcie
> > -
> >    reg:
> >      items:
> >        - description: Data Bus Interface (DBI) registers.
> 
> 
> So the only common part left here is reg and phy? I don't think such
> common file brings any value.
> 
> 

Okay, will keep two separate files. 

> Best regards,
> Krzysztof

