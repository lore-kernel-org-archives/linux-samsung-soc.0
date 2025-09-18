Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED052FF168
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 08:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758185704; cv=none; b=hxkjkLG1hba6aEpRebyuuhXrxJhlfZVWT/F3PG85TP7DB7Tdz1vHkRQr6IChzyo4tJEQixbqdzJ+N9ehUm/yvdf1OBgG5ktW7jUkkyllvs5JBUd05hNBhIm29RKTZ5wTZNiHczuR59Lk3N36nOYz4btWKhRXY1NBLBfGskXWhgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758185704; c=relaxed/simple;
	bh=r8+mQ+RdYsv3rDfv2JvyVzGHe2KwLSTcDnHh5EcD3E0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=bT1fyLh9mWelnn6u8q5CEVBOrjXShTB+E+mFwFjjenscgDcnw+/ieAdpM7WJcLC51n9DgRztMVTu8jycdZF+4SqVk8MKws8giZC2mDov8tyjH1RYrne3gma2cC54QqGfwdUZy8qEqfJX4UUhdAd7iPfXjLfqkd2Q+NIcdu6D1HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IEi1i8gM; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IEi1i8gM"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250918085459epoutp013de2aaeea2414f19d06fa837016e726f~mVJQctUU53014730147epoutp015
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 08:54:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250918085459epoutp013de2aaeea2414f19d06fa837016e726f~mVJQctUU53014730147epoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758185699;
	bh=rmBBeWQLJLdBvcEKIt5FmNx+Tdlhgo71aY0OO5PcSIg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=IEi1i8gMN7XRpwrq1jlvNqDl3GdgvjdbqBCDWaWiEL4idn4Fyci88/rfn1jIYqlw0
	 y3wKRHjBGrcIklb/MTquI1Yt16WxUz2ekSmFHGRnVaGwBoe4bxYWMN4g/OrJP7lprP
	 9+a4Pg79J97saIxiHYSb2o4AtEOUn05wiyctgJUA=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250918085459epcas5p453b23f97b8a18ada0f3347f30227a5e8~mVJP3CffL3128931289epcas5p41;
	Thu, 18 Sep 2025 08:54:59 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cS8bQ0SqQz6B9mH; Thu, 18 Sep
	2025 08:54:58 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250918085457epcas5p183de37a5d137c6649aa29c66a510a9d4~mVJOQJrju3029730297epcas5p16;
	Thu, 18 Sep 2025 08:54:57 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918085454epsmtip22719dfea50c923eee5bf322bf1dd9c07~mVJL1aAhm2272122721epsmtip2U;
	Thu, 18 Sep 2025 08:54:54 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chandan.vn@samsung.com>,
	<dev.tailor@samsung.com>, <karthik.sun@samsung.com>
In-Reply-To: <20250915095401.3699849-3-raghav.s@samsung.com>
Subject: RE: [PATCH v2 2/3] clk: samsung: exynosautov920: add clock support
Date: Thu, 18 Sep 2025 14:24:53 +0530
Message-ID: <087b01dc2879$e8822770$b9867650$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIDMWX7dzjI2+lsAsCe3lTeFtXiqgH5gg35ANbkz8C0NAzFkA==
Content-Language: en-us
X-CMS-MailID: 20250918085457epcas5p183de37a5d137c6649aa29c66a510a9d4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89
References: <20250915095401.3699849-1-raghav.s@samsung.com>
	<CGME20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89@epcas5p3.samsung.com>
	<20250915095401.3699849-3-raghav.s@samsung.com>

Hi Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Monday, September 15, 2025 3:24 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; sunyeal.hong@samsung.com;
> shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; chandan.vn@samsung.com; dev.tailor@samsung.com;
> karthik.sun@samsung.com; Raghav Sharma <raghav.s@samsung.com>
> Subject: [PATCH v2 2/3] clk: samsung: exynosautov920: add clock support
> 
> Add support for CMU_M2M which provides clocks to M2M block, and register
> the required compatible and cmu_info for the same.
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

