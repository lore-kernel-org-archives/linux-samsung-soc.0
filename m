Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCAD2AD04
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 04:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753848967; cv=none; b=HXjOLXgJrmLoadIvpZrpugMQIEA4PycmZwd18jT4yS8dQ/GNnJK5HyEaiYqFgcvN/eDTBoPBtBNlIESzdSnW8E7BuMxI9S914cmQIoqjJqAiTgC6/gNsZ1VBFTxeNJBNuOVuzXkTwGilEGUgvDp4vHxksPp3AFZ2Ftrk4XZqyqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753848967; c=relaxed/simple;
	bh=7CTv2eFnrYTyLbXTpSMkgisEsWLxApbFpqIfcyN+qM4=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Le25oeXr+bIbQ8yywDue848OrN2hyrDVgTRn5sVK3blqwP+hH7qk6voLtDHRnDIXrUpcM8dxaYmMu8PeG4RxsfFvSpjMGinQUMsktfNkKr1S90aYTnUzj3g9r1og3c1+8kDLGzv6xFeMWFVVFTVUwxtyx8oDYSgsn4X7PdTbeEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SgUje2in; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SgUje2in"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250730041603epoutp03a48b237dfa7fcdd323b722280bc01aea~W7Fb_94EK1921019210epoutp03N
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 04:16:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250730041603epoutp03a48b237dfa7fcdd323b722280bc01aea~W7Fb_94EK1921019210epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753848963;
	bh=CB1G052Ym6eC+ql2GG5IxULt6yYskrTaLEPsGeUfdZQ=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=SgUje2inFBOJM4uRXoXdqaQixjOrV3JDJgeAIY6cFPCbUfSshQiFR/dTiuLH1gFc/
	 +sJahnJMOacwcfEAkTf9g3hrYo7XSy4YNz8cWS/GULZJv+9XfYe7Vw5UswchnvFIKO
	 +mfeHiBpKjdr2h5GNuLCNlX4+qPtwZ4YoSfBeWP4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250730041602epcas5p3ac10266bf1f1b19e4c88cffe35a51ba7~W7FbaiNeo0782007820epcas5p38;
	Wed, 30 Jul 2025 04:16:02 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bsJmd5B6hz6B9mL; Wed, 30 Jul
	2025 04:16:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250730041600epcas5p19ee4c430c3f6d28b0ec1b8f962c33e90~W7FZyXgwD1206112061epcas5p1S;
	Wed, 30 Jul 2025 04:16:00 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250730041559epsmtip14c7f776d90e03c6368495aa9d94b3b3b~W7FYYBde90047500475epsmtip1F;
	Wed, 30 Jul 2025 04:15:59 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Devang Tailor'" <dev.tailor@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<faraz.ata@samsung.com>
In-Reply-To: <20250710083434.1821671-2-dev.tailor@samsung.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
 exynosautov9
Date: Wed, 30 Jul 2025 09:45:58 +0530
Message-ID: <36d301dc0108$a8423670$f8c6a350$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQMc6yo9jRPgA4nZ2IiZrgLtyBFMygIGWJ0zAVVuF6axrVxZoA==
X-CMS-MailID: 20250730041600epcas5p19ee4c430c3f6d28b0ec1b8f962c33e90
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe@epcas5p4.samsung.com>
	<20250710083434.1821671-2-dev.tailor@samsung.com>



> -----Original Message-----
> From: Devang Tailor <dev.tailor@samsung.com>
> Sent: Thursday, July 10, 2025 2:05 PM
> To: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com; alexandre.belloni@bootlin.com;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> rtc@vger.kernel.org; faraz.ata@samsung.com
> Cc: Devang Tailor <dev.tailor@samsung.com>
> Subject: [PATCH v2 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
> exynosautov9
> 
> Add "samsung,exynosautov9-rtc" dedicated compatible for on-chip RTC
> found in ExynosAutov9 SoC.
> 
> Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


