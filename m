Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B62721CA03
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765975606; cv=none; b=FpicPcNbPZLIQPrDWDgQZ5thCotRGcodIw3AS9lGoH7FhktNTM1+sYhqWjlXQ5sKCHkDBhWbuq+jdbmZIo9VPNFxHW/qjPQkWn0AqpnI6bYXBRkxE3QG81zzBQi+1IVsTKrXh66GWfZ29vVfIWctsQZqZwbcBH/yVdgajpFwj7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765975606; c=relaxed/simple;
	bh=ppDZhQD+7hBx9AHp0mR1yEOUZo5giOYFeW3jsGXMOYo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=c8EIV/E7wKBHJpQjXE0Z3NZaYW/j30uoDH5HqJ6GHIhCAkp4Ue6RWWKOMx8MAnrRnGb49PVHvEg6Z6cyFhzAyNauzw4eSoxwPBvkE4rU7JgQLcG5iKdkX2aQhZHsRf4cI1I1oSfnw6ApQ+n8nedhQdpchRHJxN6HPwQ5VBEYEq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jvdB1Wz/; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jvdB1Wz/"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251217124640epoutp022aa61a057d3468ebde08b0fb02f01330~CAXPHY-8c0778807788epoutp02Q
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 12:46:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251217124640epoutp022aa61a057d3468ebde08b0fb02f01330~CAXPHY-8c0778807788epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765975600;
	bh=Tc8F4P3UwgpqXgjYXPX9FB7Ly58IjY618ESDQQ8MpP8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jvdB1Wz/5cArVBXW08MfqqkvUbuyM4oK7mXYjZcjc/W+vUdh8vEWroesFUrFNqcxu
	 dJOWf7hFpGrzMrFX3j9jpOi5xVcxLYAo75+5dlJBzj19ldXsoL39P7OPUZ6EhHi0Cr
	 1OaWR27nyrZjWbayoPeKOP7yeS3wpD0EFsUKZVJ4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251217124640epcas5p2f2733d2c0f8e9b6a15045e6abad62b6b~CAXOiJo191898218982epcas5p23;
	Wed, 17 Dec 2025 12:46:40 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dWYTC2XrPz2SSKX; Wed, 17 Dec
	2025 12:46:39 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251217124638epcas5p4faa585d6d891780a0d685b374440d44b~CAXNMxoIo2400224002epcas5p4q;
	Wed, 17 Dec 2025 12:46:38 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217124633epsmtip261ad2e48af313c7dcfd4da5022b5cbc2~CAXIxNvpk1684916849epsmtip2F;
	Wed, 17 Dec 2025 12:46:33 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chandan.vn@samsung.com>,
	<dev.tailor@samsung.com>, <karthik.sun@samsung.com>
In-Reply-To: <20251119114744.1914416-3-raghav.s@samsung.com>
Subject: RE: [PATCH 2/3] clk: samsung: exynosautov920: add clock support
Date: Wed, 17 Dec 2025 18:16:29 +0530
Message-ID: <139a01dc6f53$2f861f80$8e925e80$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH7EhboaEaVd13SrnoN6ZCnkjrAPAC2bvr2AlNHdSq00DPcIA==
Content-Language: en-us
X-CMS-MailID: 20251217124638epcas5p4faa585d6d891780a0d685b374440d44b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119113930epcas5p1116fba63f1fa2905a67e2f5f3e016c56
References: <20251119114744.1914416-1-raghav.s@samsung.com>
	<CGME20251119113930epcas5p1116fba63f1fa2905a67e2f5f3e016c56@epcas5p1.samsung.com>
	<20251119114744.1914416-3-raghav.s@samsung.com>

Hi Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Wednesday, November 19, 2025 5:18 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; sunyeal.hong@samsung.com;
> shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; chandan.vn@samsung.com;
> dev.tailor@samsung.com; karthik.sun@samsung.com; Raghav Sharma
> <raghav.s@samsung.com>
> Subject: [PATCH 2/3] clk: samsung: exynosautov920: add clock support
> 
> Add support for CMU_MFD which provides clocks to MFD block, and register
> the required compatible and cmu_info for the same.
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


