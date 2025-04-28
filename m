Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583CE3C3C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 08:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745828813; cv=none; b=R6ojRfOyFbpguNI908D4QMerNk4hXwNTmy+PD2ObQ80IKzQ5Qa9f8LxGDCEweMcd+y+RMl4VdLIq2Mn1tgGvZYLR783J6QpW/mWXY+AIPdo8s1xKr91VoOFc2cdPVa8xiV7tafQfVkx1IG7iu4ZMe9BlCZvPZw0e3MtB4ebhRQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745828813; c=relaxed/simple;
	bh=uOU0q/hWbR9mniHBU9QFIydsxxhiGhDlJIe5azyuIIk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=dHZnnuelwt3k63f+h7UHHhwZxXhc4pGpT8883rlGg/61txAXAQptwN9w/AfTt4ZS2h8G3gqqa4O0DvGgLCfC/He97Ek9zUdtWHJ4o7MdpmDlUGrK1pTCItCbceOyfRX4tu/4EzJlVPSF9u4YtpPYIdVebDShrOGfVMnEfUihvmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Pv7DxwpX; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Pv7DxwpX"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250428082648epoutp049b385ff800f0e2aa9b73c371cf8931a5~6bg0ytPYG0564005640epoutp04V
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 08:26:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250428082648epoutp049b385ff800f0e2aa9b73c371cf8931a5~6bg0ytPYG0564005640epoutp04V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745828808;
	bh=C3ekUdVyc5lKna1B3ODGvGE5qt1aBk/h9qBhnTOllb4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Pv7DxwpXM38xwIgOGr3ofXWmYLHIQJJmHK9SJYLLinNxtziegPvuuWtDV7diB44/9
	 mZzr8qWXaO+Pp3BLt9e+LCtHI3gQp7umnr/hLEnAjC85c3PfW3a1dq7EoowXkHKARy
	 xZBBRTGqEfbrnpSQs9DZ8QFGGC42wVWSYbQ8Xcys=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250428082647epcas2p2dfc36e3cf5aa0bf32155279b15f89c6b~6bg0RZBUp0907509075epcas2p2C;
	Mon, 28 Apr 2025 08:26:47 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.100]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZmGkv4Sssz6B9mB; Mon, 28 Apr
	2025 08:26:47 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250428082646epcas2p4460f473df235e8546df6a71e05240119~6bgzSPIU_0314903149epcas2p4o;
	Mon, 28 Apr 2025 08:26:46 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428082646epsmtrp143bee6ba981f6e33c5cf36ee9e09b6c7~6bgzRdC8X1746317463epsmtrp1Q;
	Mon, 28 Apr 2025 08:26:46 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-12-680f3bc6c77b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	23.20.08766.6CB3F086; Mon, 28 Apr 2025 17:26:46 +0900 (KST)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250428082646epsmtip1d3bbcbdee9a21ba30bf0891de9710294~6bgzCkV6Y0683206832epsmtip1I;
	Mon, 28 Apr 2025 08:26:46 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Sunyeal Hong'" <sunyeal.hong@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <cdbc8c9b-ecfb-4969-997c-52e873a3abf0@kernel.org>
Subject: RE: [PATCH v2 2/3] clk: samsung: exynosautov920: add cpucl0 clock
 support
Date: Mon, 28 Apr 2025 17:26:46 +0900
Message-ID: <02b401dbb817$47c67a70$d7536f50$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGOlsMvr1R6l3BJizf5uOhEVh8iDwK47iPiAr6d9CQCUOddC7QUvGjg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsWy7bCSnO4xa/4Mgw9P9C0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4MqY3
	qhX85q5YfPYxUwNjI1cXIweHhICJxJyNpl2MXBxCArsZJb6cusXWxcgJFJeQODxjAiOELSxx
	v+UIK4gtJPCcUeLhr3QQm03AUGLVj+1MIM0iAhOZJS59uMAC4jALbGKUOLf7JhvE2PeMEh3N
	F9hBWjgF7CQ+n/kFNkpYIEhi8tPlzCA2i4CqxPKed2BxXgFLidutN9kgbEGJkzOfsIDYzALa
	Er0PWxkhbHmJ7W/nMEOcpyCx+9NRsF4RATeJ9sv32CFqRCRmd7YxT2AUnoVk1Cwko2YhGTUL
	ScsCRpZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjBEamluYNx+6oPeocYmTgYDzFK
	cDArifBWGfBnCPGmJFZWpRblxxeV5qQWH2KU5mBREucVf9GbIiSQnliSmp2aWpBaBJNl4uCU
	amAyaC/3uOd2Ip4tcUf7x75HT2rP8vLceeO+4Ovb/zodskoaJxRPC7589/HQq7y0rm3bmrM7
	FncpqTF/Ztpzy+hG+UW77OUc8t1r1XMYbvu36id2eb9tEN/EXLbuiMtpq7lz1ZZJx222eOgU
	t3d54tvPr3vNRe9t+Kc6IzyrbevOZ6prJh9Uvy7j0X0kI9hk5+4ui0+/1r3KOxW2P23GnO0v
	O7h/C8/nm6v725JLsraRw/nK9cWfdbOsOpPmyZ6bd0X62ZGAzy3HZK5K+MYp87C4v7I51FOV
	uNZ5f+Zk0/WX7df8U7WbrrFH5fLczOPHr+s8OSDQVuD+cxuPfWDbzdsdCSXPvrR4Ndv4KT5+
	otusxFKckWioxVxUnAgAJcX7djcDAAA=
X-CMS-MailID: 20250428082646epcas2p4460f473df235e8546df6a71e05240119
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423044159epcas2p3476aede31ffc8de8a9169584ec8a3d78
References: <20250423044153.1288077-1-shin.son@samsung.com>
	<CGME20250423044159epcas2p3476aede31ffc8de8a9169584ec8a3d78@epcas2p3.samsung.com>
	<20250423044153.1288077-3-shin.son@samsung.com>
	<cdbc8c9b-ecfb-4969-997c-52e873a3abf0@kernel.org>

> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: Monday, April 28, 2025 4:23 AM
> To: Shin Son <shin.son@samsung.com>; Sylwester Nawrocki
> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
> Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob Herring
> <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sunyeal Hong
> <sunyeal.hong@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v2 2/3] clk: samsung: exynosautov920: add cpucl0 clock
> support
> 
> On 23/04/2025 06:41, Shin Son wrote:
> > Register compatible and cmu_info data to support clock CPUCL0(CPU
> > Cluster 0), this provides clock for CPUCL0_SWTICH/DBG/CLUSTER.
> > These clocks are required early during boot for the CPUs, so they are
> > declared using CLK_OF_DECLARE instead of being registered through a
> platform driver.
> >
> > Signed-off-by: Shin Son <shin.son@samsung.com>
> 
> Applied, but remember to use proper wrapping and run checkpatch.
> 
> [Checkpatch]
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit
> description?)
> 
> 
> Best regards,
> Krzysztof

Hello, Krzysztof Kozlowski.

Ack, thanks for your feedback. 
I will make sure to thoroughly review my patches next time.

Best regards,
Shin Son

