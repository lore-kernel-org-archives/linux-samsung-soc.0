Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6482F23E35F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 05:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760594115; cv=none; b=u/YeTCbAn3jIwMNSIsafwB+KbOLEZ0jkBOWTM0PMwcuugJAYt+AHmZfAFi6cR/l7Uwx0l9NS2PNfLX9dcg5nlIJth7+aiiDYvi8PgWqmuYxXKhl1oENtQqCuFh3vg1SXWaPEQTVzCl3Ozq/Z9t+OZ3dP85U4m3irsrdhT7lUsIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760594115; c=relaxed/simple;
	bh=zZ3hiuoOz7S40OWe1BhO7yrk1jjd8J+w81QTPBAFJB4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=VSMvi3YUBwu5+ZAXWuIX52CpxbJaS2ftASQ8NK08iGNVfgx/z6EpQEexVczmIOMHvbRwAoWy0N2do4GfZ/LI21S8xphr6W5cuxQbdPadnIybmtGx5pjThpz/3SpKqLHVwhhOLWZlKtD52c6kNUl1DGdIsXEJpvFwEuOxwyOEDCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FHwWz2us; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FHwWz2us"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251016055506epoutp033555ebdf4ac17b0aaa2ec284b9033e3b~u4wLzBCf62393223932epoutp03a
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 05:55:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251016055506epoutp033555ebdf4ac17b0aaa2ec284b9033e3b~u4wLzBCf62393223932epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760594106;
	bh=Lt1V1ttJT/rzLxB3yr+Kj2hiXZUyzShEyCvGqxVBJsQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=FHwWz2us2IYVIr+EuFa6oJbqoifB4KHvpW7efNqW30FqFZmUucTZAOWlA+M12qzg7
	 kjrIixlxsVwlX4MFCSgPlx0eKIF7vyEwh38v6QEQsiLqVWRhMzP3sF4zT2uRW1Z3R0
	 DXDOaRU6OpumLxcCPwDaMCMQgDWpxWigiDqYGv70=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251016055505epcas2p1bd7203b2019c94b7e042145b3c441814~u4wLSUwr41320913209epcas2p1v;
	Thu, 16 Oct 2025 05:55:05 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.201]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cnHGx1qvFz6B9mD; Thu, 16 Oct
	2025 05:55:05 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20251016055504epcas2p465445e62cb43a07d933890d533c08b97~u4wKYUP4M2158421584epcas2p4M;
	Thu, 16 Oct 2025 05:55:04 +0000 (GMT)
Received: from KORCO115296 (unknown [12.80.207.128]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251016055504epsmtip2ae441a34d309f357a7223522f6fc7556~u4wKSXLQv2437324373epsmtip2j;
	Thu, 16 Oct 2025 05:55:04 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Bartlomiej Zolnierkiewicz'"
	<bzolnier@gmail.com>, "'Rafael J . Wysocki'" <rafael@kernel.org>, "'Daniel
 Lezcano'" <daniel.lezcano@linaro.org>, "'Zhang Rui'" <rui.zhang@intel.com>,
	"'Lukasz	Luba'" <lukasz.luba@arm.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Henrik Grimler'" <henrik@grimler.se>
Cc: <linux-pm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <65380fa1-7d49-48eb-bab4-3e15cc4ea434@kernel.org>
Subject: RE: [PATCH v6 3/3] arm64: dts: exynosautov920: Add multiple sensors
Date: Thu, 16 Oct 2025 14:55:02 +0900
Message-ID: <001f01dc3e61$6b2ec7d0$418c5770$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQIjrV0tYij4Y9dxV2JVizj4BALpcQInw8+iAnOKzA4BpaaqeLQDYDWA
Content-Language: ko
X-CMS-MailID: 20251016055504epcas2p465445e62cb43a07d933890d533c08b97
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930005148epcas2p19ffbb0ceaacac4d92e7d43936884dc70
References: <20250930005139.1424963-1-shin.son@samsung.com>
	<CGME20250930005148epcas2p19ffbb0ceaacac4d92e7d43936884dc70@epcas2p1.samsung.com>
	<20250930005139.1424963-4-shin.son@samsung.com>
	<65380fa1-7d49-48eb-bab4-3e15cc4ea434@kernel.org>

Hello Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: Friday, October 10, 2025 9:46 PM
> To: Shin Son <shin.son@samsung.com>; Bartlomiej Zolnierkiewicz
> <bzolnier@gmail.com>; Rafael J . Wysocki <rafael@kernel.org>; Daniel
> Lezcano <daniel.lezcano@linaro.org>; Zhang Rui <rui.zhang@intel.com>;
> Lukasz Luba <lukasz.luba@arm.com>; Rob Herring <robh@kernel.org>; Conor
> Dooley <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>;
> Henrik Grimler <henrik@grimler.se>
> Cc: linux-pm@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v6 3/3] arm64: dts: exynosautov920: Add multiple
> sensors
> 
> On 30/09/2025 02:51, Shin Son wrote:
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > index 0fdf2062930a..fba403e48aed 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > @@ -330,6 +330,36 @@ watchdog_cl1: watchdog@10070000 {
> >  			samsung,cluster-index = <1>;
> >  		};
> >
> > +		tmu_top: tmu@100a0000 {
> > +			compatible = "samsung,exynosautov920-tmu";
> > +			reg = <0x100A0000 0x1000>;
> 
> I guess there will be new version, so nitpick: please use lowercase hex.
> 
> 
> Best regards,
> Krzysztof

Ok, I'll use the lowercase hex.
Thanks for your feedback.

Best regards,
Shin Son.

